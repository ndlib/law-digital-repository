# Generated via
#  `rails generate common_repository_model::collection JournalArticle`
require 'spec_helper'
require 'common_repository_model/test_support'
describe JournalArticleMetadataDatastream do
  include CommonRepositoryModel::TestSupport

  before(:all) do
    @journal_article = FactoryGirl.build(:journal_article)
    @metadata = @journal_article.descriptive_metadata
    @metadata.content = rdf_content_for(@journal_article)
    @journal_article.save!

    @journal_article = JournalArticle.find(@journal_article.pid)
  end

  after(:all) do
    @journal_article.destroy
  end

  def metadata; @metadata ||= @journal_article.descriptive_metadata; end

  def self.it_should_have_term_with_value(method_name, value)
    it "should have ##{method_name}" do
      metadata.send(method_name).should == value
    end
  end

  it_should_have_term_with_value :title, ['The Trial of Criminal Cases and Adult Probation in the Chancery Court']
  it_should_have_term_with_value :created, ['1925-11-01']
  it_should_have_term_with_value :issued, ['1925-11-02']
  it_should_have_term_with_value :available, [""]
  it_should_have_term_with_value :subject, ['Probation', 'The Notre Dame Lawyer', 'Law Reviews', 'Lindsey, Ben B.', '1900-2000', 'Criminal']
  it_should_have_term_with_value :abstract, ["The principle of probation, as applied to offenders against the state--whether such offenders be adults or minors--was originally applied in a limited, way to proceedings in criminal courts. As with all reforms, it came first in a rather limited fashion-generally as to misdemeanors and first offenders; gradually it was extended to more serious offenses."]
  it_should_have_term_with_value :publisher, ['University of Notre Dame']
  it_should_have_term_with_value :bibliographic_citation, ['Ben B. Lindsey, The Trial of Criminal Cases and Adult Probation in the Chancery Court, 01 The N. D. Lawyer 03 (1926).']
  it_should_have_term_with_value :source, ['The Notre Dame Lawyer: A Monthly Law Review. Volume 1, Number 1, November 1925. Pages 3-10.']
  it_should_have_term_with_value :is_part_of, ['The Notre Dame Lawyer','1234-5678']
  it_should_have_term_with_value :rights, [RDF::URI.new('http://nd.edu/copyright')]
  it_should_have_term_with_value :access_rights, ['World']
  it_should_have_term_with_value :language, ['eng']
  it_should_have_term_with_value :archived_object_type, ['Article']
  it_should_have_term_with_value :modified, ['2001-07-18']
  it_should_have_term_with_value :content_format, ['text/html']
  it_should_have_term_with_value :extent, ['14 Kbytes']
  it_should_have_term_with_value :requires, ['Adobe Reader']
  it_should_have_term_with_value :identifier_other, ['03_1NotreDameL[i](1925--1926)']
  it_should_have_term_with_value :identifier_doi, ['doi:123456']
  it_should_have_term_with_value :identifier_uri, ['URI of record']
  it_should_have_term_with_value :creator, ['Lindsey, Ben B.']
  it_should_have_term_with_value :date_digitized, ['2012-01-01']
  it_should_have_term_with_value :date_accessioned, ["2012-02-03"]
  it_should_have_term_with_value :publisher_repository, ['University of Notre Dame. Kresege Law Library & Technology']
  it_should_have_term_with_value :publisher_digital, ['University of Notre Dame. Kresege Law Library & Technology']
  it_should_have_term_with_value :publisher_institution, ['University of Notre Dame']
  it_should_have_term_with_value :equipment_digitizing, ['Adobe Acrobat X']
  it_should_have_term_with_value :is_part_of_issn, ['1234-5678']
end


def rdf_content_for(object)
  %(
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/title> "The Trial of Criminal Cases and Adult Probation in the Chancery Court" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/created> "1925-11-01" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/issued> "1925-11-02" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/available> "" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/subject> "Probation" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/subject> "The Notre Dame Lawyer" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/subject> "Law Reviews" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/subject> "Lindsey, Ben B." .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/subject> "1900-2000" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/subject> "Criminal" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/abstract> "The principle of probation, as applied to offenders against the state--whether such offenders be adults or minors--was originally applied in a limited, way to proceedings in criminal courts. As with all reforms, it came first in a rather limited fashion-generally as to misdemeanors and first offenders; gradually it was extended to more serious offenses." .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/publisher> "University of Notre Dame" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/bibliographicCitation> "Ben B. Lindsey, The Trial of Criminal Cases and Adult Probation in the Chancery Court, 01 The N. D. Lawyer 03 (1926)." .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/source> "The Notre Dame Lawyer: A Monthly Law Review. Volume 1, Number 1, November 1925. Pages 3-10." .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/isPartOf> "The Notre Dame Lawyer" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/isPartOf> "1234-5678" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/rights> <http://nd.edu/copyright> .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/accessRights> "World" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/language> "eng" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/type> "Article" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/modified> "2001-07-18" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/format> "text/html" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/extent> "14 Kbytes" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/requires> "Adobe Reader" .
    <info:fedora/#{object.pid}> <http://library.nd.edu/meta_data/terms/identifierOther> "03_1NotreDameL[i](1925--1926)" .
    <info:fedora/#{object.pid}> <http://library.nd.edu/meta_data/terms/identifierDOI> "doi:123456" .
    <info:fedora/#{object.pid}> <http://library.nd.edu/meta_data/terms/identifierURI> "URI of record" .
    <info:fedora/#{object.pid}> <http://purl.org/dc/terms/creator> "Lindsey, Ben B." .
    <info:fedora/#{object.pid}> <http://library.nd.edu/meta_data/terms/dateDigitized> "2012-01-01" .
    <info:fedora/#{object.pid}> <http://library.nd.edu/meta_data/terms/isPartOf.ISSN> "1234-5678" .
    <info:fedora/#{object.pid}> <http://library.nd.edu/meta_data/terms/dateAccessioned> "2012-02-03" .
    <info:fedora/#{object.pid}> <http://library.nd.edu/meta_data/terms/publisherRepository> "University of Notre Dame. Kresege Law Library & Technology" .
    <info:fedora/#{object.pid}> <http://library.nd.edu/meta_data/terms/publisherDigital> "University of Notre Dame. Kresege Law Library & Technology" .
    <info:fedora/#{object.pid}> <http://library.nd.edu/meta_data/terms/publisherInstitution> "University of Notre Dame" .
    <info:fedora/#{object.pid}> <http://library.nd.edu/meta_data/terms/equipmentDigitizing> "Adobe Acrobat X" .
  )
end
