# Generated via
#  `rails generate common_repository_model::collection Journal`
#
# Read about factories at https://github.com/thoughtbot/factory_girl

require 'common_repository_model/test_support'
FactoryGirl.define do
  factory :journal, class: Journal, parent: :common_repository_model_collection do
    sequence(:name) {|n| "Journal Name #{n}"}
  end

  factory :invalid_journal, parent: :journal do
    name ''
  end
end
