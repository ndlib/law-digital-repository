# Generated via
#  `rails generate common_repository_model::collection JournalArticle`

require 'common_repository_model/metadata_datastream'

module RDF
  class UND < Vocabulary('http://library.nd.edu/meta_data/terms/')
    property :identifierDOI
    property :identifierURI
    property :identifierOther
    property :dateDigitized
    property :dateAccessioned
    property :publisherRepository
    property :publisherDigital
    property :publisherInstitution
    property :equipmentDigitizing
    property "isPartOf.ISSN".to_sym
  end
end

class JournalArticleMetadataDatastream < CommonRepositoryModel::MetadataDatastream
  register_vocabularies RDF::DC
  map_predicates do |map|
    map.title({:in => RDF::DC})
    map.created({:in => RDF::DC})
    map.issued({:in => RDF::DC})
    map.available({:in => RDF::DC})
    map.subject({:in => RDF::DC})
    map.abstract({:in => RDF::DC})
    map.subject({:in => RDF::DC})
    map.publisher({:in => RDF::DC})
    map.bibliographic_citation({:in => RDF::DC, :to => 'bibliographicCitation'})
    map.source({:in => RDF::DC})
    map.is_part_of({:in => RDF::DC, :to => 'isPartOf'})
    map.rights({:in => RDF::DC})
    map.access_rights({:in => RDF::DC, :to => 'accessRights'})
    map.language({:in => RDF::DC})
    map.archived_object_type({:in => RDF::DC, :to => 'type'})
    map.modified({:in => RDF::DC})
    map.content_format({:in => RDF::DC, :to => 'format'})
    map.extent({:in => RDF::DC})
    map.requires({:in => RDF::DC})
    map.identifier_doi({:in => RDF::UND, :to => 'identifierDOI'})
    map.identifier_other({:in => RDF::UND, :to => 'identifierOther'})
    map.identifier_uri({:in => RDF::UND, :to => 'identifierURI'})
    map.creator({:in => RDF::DC, :to => 'creator'})
    map.date_digitized({:in => RDF::UND, :to => 'dateDigitized'})
    map.date_accessioned({:in => RDF::UND, :to => 'dateAccessioned'})
    map.publisher_repository({:in => RDF::UND, :to => 'publisherRepository'})
    map.publisher_digital({:in => RDF::UND, :to => 'publisherDigital'})
    map.publisher_institution({:in => RDF::UND, :to => 'publisherInstitution'})
    map.equipment_digitizing({:in => RDF::UND, :to => 'equipmentDigitizing'})
    map.is_part_of_issn({:in => RDF::UND, :to => 'isPartOf.ISSN'})
  end
end
