require 'spec_helper'

describe JournalsController do
  let(:journal_attributes) { FactoryGirl.attributes_for(:journal) }
  it 'POST /journals' do
    post :create, journal: journal_attributes
  end
end
