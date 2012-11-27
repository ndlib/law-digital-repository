require 'spec_helper'

describe JournalsController do
  let(:journal_attributes) { FactoryGirl.attributes_for(:journal) }
  it 'POST /journals' do
    mock(Journal).new(journal_attributes)
      .returns(Journal::DataStruct.new(journal_attributes))
    post :create, journal: journal_attributes
  end
end
