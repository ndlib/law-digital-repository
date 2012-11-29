require 'spec_helper'
require 'common_repository_model/test_support'

describe "Journals", type: :request do
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
