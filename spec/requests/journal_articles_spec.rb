require 'spec_helper'
require 'common_repository_model/test_support'

describe "JournalArticles", type: :request do

  describe "GET /journal_articles.json" do

    before(:all) do
      @journal_volume1 = FactoryGirl.create(:journal_volume)
      @journal_volume2 = FactoryGirl.create(:journal_volume)
      @journal_article1 = FactoryGirl.create(:journal_article).tap { |obj|
        obj.volumes << @journal_volume1
        obj.save!
      }
      @journal_article2 = FactoryGirl.create(:journal_article).tap { |obj|
        obj.volumes << @journal_volume1
        obj.save!
      }
      @journal_article3 = FactoryGirl.create(:journal_article).tap { |obj|
        obj.volumes << @journal_volume2
        obj.save!
      }
    end

    after(:all) do
      @journal_volume1.delete if @journal_volume1
      @journal_volume2.delete if @journal_volume2
      @journal_article1.delete if @journal_article1
      @journal_article2.delete if @journal_article2
      @journal_article3.delete if @journal_article3
    end

    it 'should render JSON object of PIDs' do
      get journal_articles_path(format: :json)
      response.status.should be(200)
      json = JSON.parse(response.body)
      root = json.fetch('journal_articles')
      root.should include(@journal_article1.pid)
      root.should include(@journal_article2.pid)
      root.should include(@journal_article3.pid)
    end

    it 'should render JSON object of PIDs scoped to :volume_id' do
      get journal_articles_path(volume_id: @journal_volume1.id, format: :json)
      response.status.should be(200)
      json = JSON.parse(response.body)
      root = json.fetch('journal_articles')
      root.should include(@journal_article1.pid)
      root.should include(@journal_article2.pid)
      root.should_not include(@journal_article3.pid)
    end

    it 'should render 404 if :volume_id is not found' do
      get journal_articles_path(volume_id: "-2", format: :json)
      response.status.should be(404)
    end

  end

  describe "GET /journal_articles/:pid.json" do

    subject { FactoryGirl.create(:journal_article) }

    it 'should render JSON object' do
      get journal_article_path(subject, format: :json)
      response.status.should be(200)
      json = JSON.parse(response.body)
      expect {
        json.fetch('journal_article').fetch('pid')
      }.to_not raise_error(KeyError)
    end

  end

  describe "POST /journals.json" do

    describe 'with valid data' do

      let(:journal) { FactoryGirl.create(:journal) }
      let(:parameters) { FactoryGirl.attributes_for(:journal_article) }

      it "should create a new item" do
        expect {
          post(
            journal_articles_path(volume_id: journal.pid, format: :json),
            journal_article: parameters
          )
        }.to change { JournalArticle.count }.by(1)
        response.status.should be(201)
        response.location.should == url_for(assigns(:journal_article))
        JournalArticle.find(assigns(:journal_article).pid).volumes.
          should == [journal]
      end

    end
    describe 'without :volume_id' do

      let(:parameters) { FactoryGirl.attributes_for(:invalid_journal_article) }

      it "should NOT create a new item" do
        expect {
          post(
            journal_articles_path(format: :json),
            journal_article: parameters
          )
        }.to change { JournalVolume.count }.by(0)
        response.status.should be(404)
      end

    end

  end

  describe "PUT /journals.json" do

    before(:each) do
      @journal_article = FactoryGirl.create(:journal_article)
    end

    after(:each) do
      @journal_article.delete rescue true
    end

    describe 'with valid data' do

      let(:parameters) { FactoryGirl.attributes_for(:journal_article) }

      it 'should update an existing item' do
        put journal_article_path(@journal_article, format: :json), journal_article: parameters
        response.status.should be(204)
      end

    end

  end

end
