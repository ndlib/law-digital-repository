# Generated via
#  `rails generate common_repository_model::collection JournalArticle`
require 'common_repository_model/collection'
class JournalArticle < CommonRepositoryModel::Collection

  def name_of_area_to_assign
    Journal::AREA_NAME.freeze
  end

  has_metadata(name: 'descriptive_metadata', type: JournalArticleMetadataDatastream)

  delegate_to(
    :descriptive_metadata,
    [:title, :is_part_of_issn, :abstract, :bibliographic_citation],
    unique: true
  )
  validates :title, :is_part_of_issn, :abstract, :bibliographic_citation, presence: true, on: :update

  is_member_of :volumes, class_name: "JournalVolume", property: :is_article_of
end
