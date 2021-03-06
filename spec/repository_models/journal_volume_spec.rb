# Generated via
#  `rails generate common_repository_model::collection JournalVolume`
require 'spec_helper'
require 'common_repository_model/test_support'

describe JournalVolume do
  include CommonRepositoryModel::TestSupport

  describe 'factories (meta)', slow: true, factory: true do
    it 'should have a create(:journal_volume_with_journal)' do
      volume = FactoryGirl.create(:journal_volume_with_journal)
      volume = volume.class.find(volume.id)
      volume.journals.count.should == 1
    end
  end

  it 'should have volumes' do
    journal = FactoryGirl.build(:journal)
    with_persisted_area(journal.name_of_area_to_assign) do |area|
      journal.save!
      volume = FactoryGirl.create(:journal_volume)
      volume.journals << journal
      volume.save!

      journal = journal.class.find(journal.pid)
      volume = volume.class.find(volume.pid)

      assert_rels_ext(volume, :is_volume_of, [journal])
      assert_rels_ext(volume, :is_member_of, [journal])
      assert_active_fedora_has_many(volume, :journals, [journal])

      assert_rels_ext(journal, :is_volume_of, [])
      assert_rels_ext(journal, :is_member_of, [])
      assert_active_fedora_has_many(journal, :volumes, [volume])

    end
  end

end
