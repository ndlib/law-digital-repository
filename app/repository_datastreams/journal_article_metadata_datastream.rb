# Generated via
#  `rails generate common_repository_model::collection JournalArticle`

require 'common_repository_model/metadata_datastream'

class JournalArticleMetadataDatastream < CommonRepositoryModel::MetadataDatastream
  register_vocabularies RDF::DC
  map_predicates do |map|
    map.title({in: RDF::DC})
    map.created({in: RDF::DC})
    map.issued({in: RDF::DC})
    map.available({in: RDF::DC})
    map.subject({in: RDF::DC})
    map.abstract({in: RDF::DC})
    map.subject({in: RDF::DC})
    map.publisher({in: RDF::DC})
    map.bibliographic_citation({in: RDF::DC, to: 'bibliographicCitation'})
    map.source({in: RDF::DC})
    map.is_part_of({in: RDF::DC, to: 'isPartOf'})
    map.rights({in: RDF::DC})
    map.access_rights({in: RDF::DC, to: 'accessRights'})
    map.language({in: RDF::DC})
    map.archived_object_type({in: RDF::DC, to: 'type'})
    map.modified({in: RDF::DC})
    map.content_format({in: RDF::DC, to: 'format'})
    map.extent({in: RDF::DC})
    map.requires({in: RDF::DC})
    map.identifier_doi({in: CommonRepositoryModel::CustomVocabulary, to: 'identifierDOI'})
    map.identifier_other({in: CommonRepositoryModel::CustomVocabulary, to: 'identifierOther'})
    map.identifier_uri({in: CommonRepositoryModel::CustomVocabulary, to: 'identifierURI'})
    map.creator({in: RDF::DC, to: 'creator'})
    map.date_digitized({in: CommonRepositoryModel::CustomVocabulary, to: 'dateDigitized'})
    map.date_accessioned({in: CommonRepositoryModel::CustomVocabulary, to: 'dateAccessioned'})
    map.publisher_repository({in: CommonRepositoryModel::CustomVocabulary, to: 'publisherRepository'})
    map.publisher_digital({in: CommonRepositoryModel::CustomVocabulary, to: 'publisherDigital'})
    map.publisher_institution({in: CommonRepositoryModel::CustomVocabulary, to: 'publisherInstitution'})
    map.equipment_digitizing({in: CommonRepositoryModel::CustomVocabulary, to: 'equipmentDigitizing'})
    map.is_part_of_issn({in: CommonRepositoryModel::CustomVocabulary, to: 'isPartOf.ISSN'})
  end
end
