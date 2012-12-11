# Generated via
#  `rails generate common_repository_model::collection JournalArticle`

require 'common_repository_model/collection_serializer'
class JournalArticleSerializer < CommonRepositoryModel::CollectionSerializer
  has_many :volumes, embed: :ids
  # You already will have the area (PID); See corresponding spec
  #
  # https://github.com/rails-api/active_model_serializers
end
