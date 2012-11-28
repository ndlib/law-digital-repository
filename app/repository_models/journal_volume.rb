# Generated via
#  `rails generate common_repository_model::collection JournalVolume`
require 'common_repository_model/collection'
class JournalVolume < CommonRepositoryModel::Collection
  def name_of_area_to_assign
    Journal::AREA_NAME.freeze
  end

  is_member_of :journals, class_name: "Journal", property: :is_volume_of

  def journal
    journals.first
  end

  # ***************************************************************************
  # ***************************************************************************
  # NOTE: When managing associations, there is a bug in the underlying
  #   has_and_belongs_to_many. To remove an item from the association, you
  #   will presently need to operate on the child object – that is the object
  #   with the RELS-EXT entry.
  #   use `object.remove_from_containers(a_container)`
  # ***************************************************************************
  # ***************************************************************************
  #
  # EXAMPLE OF .has_members && .is_member_of
  # Creates a relationship in which the RELS-EXT entries are stored in the
  # "child" object. By using the has_members and is_member_of, the RELS-EXT
  # also has an "isMemberOf" entry. In this way, we can generically walk the
  # document tree as we know a related object exists.
  #
  # has_members :children, type: "JournalVolume" , property: 'is_named_member_of'
  # is_member_of :parents, type: "JournalVolume" , property: 'is_named_member_of'
  #
  # In this case, a Page object would have the RELS-EXT entry
  # has_members :pages, type: "Page", property: "is_page_of"
  #
  # In this case, the JournalVolume object would have the RELS-EXT entry
  # is_member_of :containers, type: "Container", property: "is_contained_in"
  #
  # For Examples Specs:
  # https://github.com/ndlib/common_respository_model/blob/master/spec/common_respository_model/integration_spec.rb
  #

end
