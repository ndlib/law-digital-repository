# Generated via
#  `rails generate common_repository_model::collection JournalArticle`
require 'common_repository_model/collection'
class JournalArticle < CommonRepositoryModel::Collection

  def name_of_area_to_assign
    Journal::AREA_NAME.freeze
  end

  has_metadata(name: 'descriptive_metadata', type: ActiveFedora::SimpleDatastream) do |m|
    m.field :title, :string
    m.field :issn, :string
    m.field :abstract, :string
    m.field :recommended_citation, :string
  end

  delegate_to(
    :descriptive_metadata,
    [:title, :issn, :abstract, :recommended_citation],
    unique: true
  )
  validates :title, :issn, :abstract, :recommended_citation, presence: true

  is_member_of :volumes, class_name: "JournalVolume", property: :is_article_of
end
