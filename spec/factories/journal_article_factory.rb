# Generated via
#  `rails generate common_repository_model::collection JournalArticle`
#
# Read about factories at https://github.com/thoughtbot/factory_girl

require 'common_repository_model/test_support'
FactoryGirl.define do
  factory :journal_article, class: JournalArticle, parent: :common_repository_model_collection do
    title 'A Generic Title'
    issn '1234'
    abstract %(Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Vivamus
    vitae risus vitae lorem iaculis placerat. Aliquam sit amet felis. Etiam
    congue. Donec risus risus, pretium ac, tincidunt eu, tempor eu, quam. Morbi
    blandit mollis magna. Suspendisse eu tortor. Donec vitae felis nec ligula
     blandit rhoncus. Ut a pede ac neque mattis facilisis. Nulla nunc ipsum,
     sodales vitae, hendrerit non, imperdiet ac, ante. Morbi sit amet mi.
     Ut magna. Curabitur id est. Nulla velit. Sed consectetuer sodales justo.
     Aliquam dictum gravida libero. Sed eu turpis. Nunc id lorem. Aenean
     consequat tempor mi. Phasellus in neque. Nunc fermentum convallis ligula.)
  end
  factory :invalid_journal_article, parent: :journal_article do
    title nil
    issn nil
  end
  factory :journal_article_with_volume, parent: :journal_article do
    after(:create) { |article|
      article.volumes << create(:journal_volume_with_journal)
      article.save!
    }
  end
end
