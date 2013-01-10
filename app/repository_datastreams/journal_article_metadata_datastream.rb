# Generated via
#  `rails generate common_repository_model::collection JournalArticle`

require 'common_repository_model/metadata_datastream'

class JournalArticleMetadataDatastream < CommonRepositoryModel::MetadataDatastream
  set_terminology(
    namespaces: {
      'dc' => "http://purl.org/dc/elements/1.1/",
      'dcterms' => "http://purl.org/dc/terms/",
      'xsi' => "http://www.w3.org/2001/XMLSchema-instance"
    }
  ) do |t|
    t.title(xmlns: 'dc', accessor: text_accessor)
    t.created(xmlns: 'dcterms', accessor: date_accessor)
    t.issued(xmlns: 'dcterms', accessor: date_accessor)
    t.available(xmlns: 'dcterms',accessor: date_accessor)
    t.subject(xmlns: 'dc',accessor: text_accessor)
    t.abstract(xmlns: 'dcterms', accessor: text_accessor)
    t.subject(xmlns: 'dc', accessor: text_accessor)
    t.publisher(xmlns: 'dc', accessor: text_accessor)
    t.bibliographic_citation(xmlns: 'dcterms', path: 'bibliographicCitation', accessor: text_accessor)
    t.source(xmlns: 'dc', accessor: text_accessor)
    t.is_part_of(xmlns: 'dcterms', path: 'isPartOf', accessor: text_accessor)
    t.rights(xmlns: 'dc', accessor: text_accessor)
    t.access_rights(xmlns: 'dcterms', path: 'accessRights', accessor: text_accessor)
    t.language(xmlns: 'dc', accessor: text_accessor)
    t.archived_object_type(xmlns: 'dc', path: 'type', accessor: text_accessor)
    t.modified(path: %(//dcterms:modified[@xsi:type="dcterms:W3CDTF"]), accessor: date_accessor)
    t.content_format(path: %(//dc:format[@xsi:type="dcterms:IMT"]), accessor: text_accessor)
    t.extent(xmlns: 'dcterms', accessor: text_accessor)
    t.requires(xmlns: 'dcterms', accessor: text_accessor)
    t.identifier_doi(xmlns: 'dcterms', path: 'identifierDOI', accessor: text_accessor)
    t.identifier_other(xmlns: 'dcterms', path: 'identifierOther', accessor: text_accessor)
    t.identifier_uri(xmlns: 'dcterms', path: 'identifierURI', accessor: text_accessor)
    t.creator_author(xmlns: 'dcterms', path: 'creatorAuthor', accessor: text_accessor)
    t.date_digitized(xmlns: 'dcterms', path: 'dateDigitized', accessor: date_accessor)
    t.date_accessioned(xmlns: 'dcterms', path: 'dateAccessioned', accessor: date_accessor)
    t.publisher_repository(xmlns: 'dcterms', path: 'publisherRepository', accessor: text_accessor)
    t.publisher_digital(xmlns: 'dcterms', path: 'publisherDigital', accessor: text_accessor)
    t.publisher_institution(xmlns: 'dcterms', path: 'publisherInstitution', accessor: text_accessor)
    t.equipment_digitizing(xmlns: 'dcterms', path: 'equipmentDigitizing', accessor: text_accessor)
    t.is_part_of_issn(xmlns: 'dcterms', path: 'isPartOf.ISSN', accessor: text_accessor)
  end
end
