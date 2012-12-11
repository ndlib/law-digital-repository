# Generated via
#  `rails generate common_repository_model::collection JournalArticle`
#
# Read about factories at https://github.com/thoughtbot/factory_girl

require 'common_repository_model/test_support'
FactoryGirl.define do
  factory :journal_article, class: JournalArticle, parent: :common_repository_model_collection do
  end
  factory :invalid_journal_article, parent: :journal_article do
  end
end
