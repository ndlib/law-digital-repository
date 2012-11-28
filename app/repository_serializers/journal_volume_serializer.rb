# Generated via
#  `rails generate common_repository_model::collection JournalVolume`

require 'common_repository_model/collection_serializer'
class JournalVolumeSerializer < CommonRepositoryModel::CollectionSerializer
  has_many :journals, embed: :ids
  # You already will have the area (PID); See corresponding spec
  #
  # https://github.com/rails-api/active_model_serializers
end
