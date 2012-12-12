# Generated via
#  `rails generate common_repository_model::collection JournalVolume`
#
# Read about factories at https://github.com/thoughtbot/factory_girl

require 'common_repository_model/test_support'
FactoryGirl.define do
  factory :journal_volume, class: JournalVolume, parent: :common_repository_model_collection do
  end
  factory :invalid_journal_volume, parent: :journal_volume do
  end
  factory :journal_volume_with_journal, parent: :journal_volume do
    after(:create) { |volume|
      volume.journals << create(:journal)
      volume.save!
    }
  end

end
