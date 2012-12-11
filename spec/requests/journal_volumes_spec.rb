require 'spec_helper'
require 'common_repository_model/test_support'

describe "JournalsVolumes", type: :request do

  describe "GET /journal_volumes.json" do

    before(:all) do
      @journal1 = FactoryGirl.create(:journal)
      @journal2 = FactoryGirl.create(:journal)
      @journal_volume1 = FactoryGirl.create(:journal_volume).tap { |obj|
        obj.journals << @journal1
        obj.save!
      }
      @journal_volume2 = FactoryGirl.create(:journal_volume).tap { |obj|
        obj.journals << @journal1
        obj.save!
      }
      @journal_volume3 = FactoryGirl.create(:journal_volume).tap { |obj|
        obj.journals << @journal2
        obj.save!
      }
    end

    after(:all) do
      @journal1.delete if @journal1
      @journal2.delete if @journal2
      @journal_volume1.delete if @journal_volume1
      @journal_volume2.delete if @journal_volume2
      @journal_volume3.delete if @journal_volume3
    end

    it 'should render JSON object of PIDs' do
      get journal_volumes_path(format: :json)
      response.status.should be(200)
      json = JSON.parse(response.body)
      root = json.fetch('journal_volumes')
      root.should include(@journal_volume1.pid)
      root.should include(@journal_volume2.pid)
      root.should include(@journal_volume3.pid)
    end

    it 'should render JSON object of PIDs scoped to :journal_id' do
      get journal_volumes_path(journal_id: @journal1.id, format: :json)
      response.status.should be(200)
      json = JSON.parse(response.body)
      root = json.fetch('journal_volumes')
      root.should include(@journal_volume1.pid)
      root.should include(@journal_volume2.pid)
      root.should_not include(@journal_volume3.pid)
    end

    it 'should render 404 if :journal_id is not found' do
      get journal_volumes_path(journal_id: "-2", format: :json)
      response.status.should be(404)
    end

  end

  describe "GET /journal_volumes/:pid.json" do

    subject { FactoryGirl.create(:journal_volume) }

    it 'should render JSON object' do
      get journal_volume_path(subject, format: :json)
      response.status.should be(200)
      json = JSON.parse(response.body)
      expect {
        json.fetch('journal_volume').fetch('pid')
      }.to_not raise_error(KeyError)
    end

  end

  describe "POST /journals.json" do

    describe 'with valid data' do

      let(:journal) { FactoryGirl.create(:journal) }
      let(:parameters) { FactoryGirl.attributes_for(:journal_volume) }

      it "should create a new item" do
        expect {
          post(
            journal_volumes_path(journal_id: journal.pid, format: :json),
            journal_volume: parameters
          )
        }.to change { JournalVolume.count }.by(1)
        response.status.should be(201)
        response.location.should == url_for(assigns(:journal_volume))
        JournalVolume.find(assigns(:journal_volume).pid).journals.
          should == [journal]
      end

    end
    describe 'without :journal_id' do

      let(:parameters) { FactoryGirl.attributes_for(:invalid_journal_volume) }

      it "should NOT create a new item" do
        expect {
          post(
            journal_volumes_path(format: :json),
            journal_volume: parameters
          )
        }.to change { JournalVolume.count }.by(0)
        response.status.should be(404)
      end

    end

  end

  describe "PUT /journals.json" do

    before(:each) do
      @journal_volume = FactoryGirl.create(:journal_volume)
    end

    after(:each) do
      @journal_volume.delete rescue true
    end

    describe 'with valid data' do

      let(:parameters) { FactoryGirl.attributes_for(:journal_volume) }

      it 'should update an existing item' do
        put journal_volume_path(@journal_volume, format: :json), journal_volume: parameters
        response.status.should be(204)
      end

    end

  end

end
