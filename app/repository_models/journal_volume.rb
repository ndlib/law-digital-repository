# Generated via
#  `rails generate common_repository_model::collection JournalVolume`
require 'common_repository_model/collection'
class JournalVolume < CommonRepositoryModel::Collection
  def name_of_area_to_assign
    Journal::AREA_NAME.freeze
  end

  is_member_of :journals, class_name: "Journal", property: :is_volume_of

end
