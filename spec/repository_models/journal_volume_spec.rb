# Generated via
#  `rails generate common_repository_model::collection JournalVolume`
require 'spec_helper'
require 'common_repository_model/test_support'

describe JournalVolume do
  include CommonRepositoryModel::TestSupport
  subject { FactoryGirl.build(:journal_volume, journals: [journal]) }
  let(:journal) { FactoryGirl.build(:journal) }

  it 'should belong to a journal' do
    subject.journal.should == journal
  end
end
