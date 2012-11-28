require 'spec_helper'
# require 'capybara/rspec'
require 'common_repository_model/test_support'

describe "Journals", type: :request do
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
      end
    end
    describe 'with invalid data' do
      let(:journal_parameters) { FactoryGirl.attributes_for(:invalid_journal) }
      it "should create a new item" do
        expect {
          post journals_path(format: :json), journal: journal_parameters
        }.to change { Journal.count }.by(0)
        response.status.should be(422)
      end
    end
  end
end
