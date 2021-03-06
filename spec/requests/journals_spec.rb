require 'spec_helper'
# require 'capybara/rspec'
require 'common_repository_model/test_support'

describe "Journals", type: :request do
  describe "GET /journals.json" do
    before(:each) do
      @journal1 = FactoryGirl.create(:journal)
      @journal2 = FactoryGirl.create(:journal)
      @journal3 = FactoryGirl.create(:journal)
    end
    after(:each) do
      @journal1.delete if @journal1
      @journal2.delete if @journal2
      @journal3.delete if @journal3
    end

    it 'should render JSON object of PIDs' do
      get journals_path(format: :json)
      response.status.should be(200)
      json = JSON.parse(response.body)
      root = json.fetch('journals')
      root.should include(@journal1.pid)
      root.should include(@journal2.pid)
      root.should include(@journal3.pid)
    end
  end
  describe "GET /journals/:pid.json" do
    subject { FactoryGirl.create(:journal) }
    it 'should render JSON object' do
      get journal_path(subject, format: :json)
      response.status.should be(200)
      json = JSON.parse(response.body)
      expect {
        json.fetch('journal').fetch('pid')
      }.to_not raise_error(KeyError)
    end
  end
  describe "POST /journals.json" do
    describe 'with valid data' do
      let(:journal_parameters) { FactoryGirl.attributes_for(:journal) }
      it "should create a new item" do
        expect {
          post journals_path(format: :json), journal: journal_parameters
        }.to change { Journal.count }.by(1)
        response.status.should be(201)
        response.location.should == url_for(assigns(:journal))
      end
    end
    describe 'with invalid data' do
      let(:journal_parameters) { FactoryGirl.attributes_for(:invalid_journal) }
      it "should NOT create a new item" do
        expect {
          post journals_path(format: :json), journal: journal_parameters
        }.to change { Journal.count }.by(0)
        response.status.should be(422)
      end
    end
  end
  describe "PUT /journals.json" do
    before(:each) do
      @journal = FactoryGirl.create(:journal)
    end
    after(:each) do
      @journal.delete rescue true
    end
    describe 'with valid data' do
      let(:journal_parameters) { FactoryGirl.attributes_for(:journal) }
      it 'should update an existing item' do
        put journal_path(@journal, format: :json), journal: journal_parameters
        response.status.should be(204)
      end
    end
    describe 'with INVALID data' do
      let(:journal_parameters) { FactoryGirl.attributes_for(:invalid_journal) }
      it 'should NOT update an existing item' do
        put journal_path(@journal, format: :json), journal: journal_parameters
        response.status.should be(422)
      end
    end
  end
end
