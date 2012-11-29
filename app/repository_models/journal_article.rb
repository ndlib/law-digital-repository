# Generated via
#  `rails generate common_repository_model::collection JournalArticle`
require 'common_repository_model/collection'
class JournalArticle < CommonRepositoryModel::Collection
  def name_of_area_to_assign
    Journal::AREA_NAME.freeze
  end

  is_member_of :volumes, class_name: "JournalVolume", property: :is_article_of
end
