require 'spec_helper'

describe JournalsController do
  include CommonRepositoryModel::TestSupport
  let(:journal_attributes) { FactoryGirl.attributes_for(:journal) }
  it 'POST /journals' do
    with_persisted_area(Journal.new.name_of_area_to_assign) do
      post :create, journal: journal_attributes
    end
  end
end
