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
end
