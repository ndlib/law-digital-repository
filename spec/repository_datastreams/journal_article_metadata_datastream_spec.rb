# Generated via
#  `rails generate common_repository_model::collection JournalArticle`
require 'spec_helper'
require 'common_repository_model/test_support'
describe JournalArticleMetadataDatastream do
  include CommonRepositoryModel::TestSupport
  subject {
    # See below for RAW_XML
    JournalArticleMetadataDatastream.from_xml(RAW_XML)
  }
  def self.it_should_have_term_with_value(method_name, value)
    it "should have ##{method_name}" do
      subject.send(method_name).should == value
    end
  end
  it_should_have_term_with_value :title, ['The Trial of Criminal Cases and Adult Probation in the Chancery Court']
  it_should_have_term_with_value :created, [Date.new(1925,11,01)]
  it_should_have_term_with_value :issued, [Date.new(1925,11,02)]
  it_should_have_term_with_value :available, [JournalArticleMetadataDatastream::NOT_AVAILBLE_DATE]
  it_should_have_term_with_value :subject, ['Probation, The Notre Dame Lawyer, Law Reviews, Lindsey, Ben B., 1900-2000, Criminal']
  it_should_have_term_with_value :abstract, ["The principle of probation, as applied to offenders against the state--whether such offenders be adults or minors--was originally applied in a limited, way to proceedings in criminal courts. As with all reforms, it came first in a rather limited fashion-generally as to misdemeanors and first offenders; gradually it was extended to more serious offenses."]
  it_should_have_term_with_value :publisher, ['University of Notre Dame']
  it_should_have_term_with_value :bibliographic_citation, ['Ben B. Lindsey, The Trial of Criminal Cases and Adult Probation in the Chancery Court, 01 The N. D. Lawyer 03 (1926).']
  it_should_have_term_with_value :source, ['The Notre Dame Lawyer: A Monthly Law Review. Volume 1, Number 1, November 1925. Pages 3-10.']
  it_should_have_term_with_value :is_part_of, ['The Notre Dame Lawyer']
  it_should_have_term_with_value :rights, ['http://nd.edu/copyright/']
  it_should_have_term_with_value :access_rights, ['World']
  it_should_have_term_with_value :language, ['eng']
  it_should_have_term_with_value :archived_object_type, ['Article']
  it_should_have_term_with_value :modified, [Date.new(2001,07,18)]
  it_should_have_term_with_value :content_format, ['text/html']
  it_should_have_term_with_value :extent, ['14 Kbytes']
  it_should_have_term_with_value :requires, ['Adobe Reader']
  it_should_have_term_with_value :identifier_other, ['03_1NotreDameL[i](1925--1926)']
  it_should_have_term_with_value :identifier_doi, ['Doi: 123456']
  it_should_have_term_with_value :identifier_uri, ['URI of record']
  it_should_have_term_with_value :creator_author, ['Author: Lindsey, Ben B.']
  it_should_have_term_with_value :date_digitized, [Date.new(2012,01,01)]
  it_should_have_term_with_value :date_accessioned, [Date.new(2012,01,02)]
  it_should_have_term_with_value :publisher_repository, ['University of Notre Dame. Kresege Law Library & Technology']
  it_should_have_term_with_value :publisher_digital, ['University of Notre Dame. Kresege Law Library & Technology']
  it_should_have_term_with_value :publisher_institution, ['University of Notre Dame']
  it_should_have_term_with_value :equipment_digitizing, ['Adobe Acrobat X']
  it_should_have_term_with_value :is_part_of_issn, ['1234-5678']
end

RAW_XML = %(
  <?xml version="1.0"?>

<metadata
  xmlns="http://example.org/myapp/"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://example.org/myapp/ http://example.org/myapp/schema.xsd"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:dcterms="http://purl.org/dc/terms/">

  <dc:title>
    The Trial of Criminal Cases and Adult Probation in the Chancery Court
  </dc:title>
  <dcterms:created>
    1925-11-01
  </dcterms:created>
  <dcterms:issued>
    1925-11-02
  </dcterms:issued>
  <dcterms:available>
  </dcterms:available>
  <dc:subject>
    Probation, The Notre Dame Lawyer, Law Reviews, Lindsey, Ben B., 1900-2000, Criminal
  </dc:subject>
  <dcterms:abstract>
    The principle of probation, as applied to offenders against the state--whether such offenders be adults or minors--was originally applied in a limited, way to proceedings in criminal courts. As with all reforms, it came first in a rather limited fashion-generally as to misdemeanors and first offenders; gradually it was extended to more serious offenses.
  </dcterms:abstract>
  <dc:publisher>
    University of Notre Dame
  </dc:publisher>
  <dcterms:bibliographicCitation>
    Ben B. Lindsey, The Trial of Criminal Cases and Adult Probation in the Chancery Court, 01 The N. D. Lawyer 03 (1926).
  </dcterms:bibliographicCitation>
  <dc:source>
    The Notre Dame Lawyer: A Monthly Law Review. Volume 1, Number 1, November 1925. Pages 3-10.
  </dc:source>
  <dcterms:isPartOf>
    The Notre Dame Lawyer
  </dcterms:isPartOf>
  <dc:rights xsi:type="dcterms:URI">
    http://nd.edu/copyright/
  </dc:rights>
  <dcterms:accessRights>
    World
  </dcterms:accessRights>
  <dc:language>
    eng
  </dc:language>
  <dc:type>
    Article
  </dc:type>
  <dcterms:modified xsi:type="dcterms:W3CDTF">
    2001-07-18
  </dcterms:modified>
  <dc:format xsi:type="dcterms:IMT">
    text/html
  </dc:format>
  <dcterms:extent>
    14 Kbytes
  </dcterms:extent>
  <dcterms:requires>
  Adobe Reader
  </dcterms:requires>


  <dcterms:identifierOther>
    03_1NotreDameL[i](1925--1926)
  </dcterms:identifierOther>
  <dcterms:identifierDOI>
    Doi: 123456
  </dcterms:identifierDOI>
  <dcterms:identifierURI xsi:type="dcterms:URI">
    URI of record
  </dcterms:identifierURI>
  <dcterms:creatorAuthor>
    Author: Lindsey, Ben B.
  </dcterms:creatorAuthor>
  <dcterms:dateDigitized>
    2012-01-01
  </dcterms:dateDigitized>
  <dcterms:dateAccessioned>
    2012-01-02
  </dcterms:dateAccessioned>
  <dcterms:publisherRepository>
    <![CDATA[
    University of Notre Dame. Kresege Law Library & Technology
    ]]>
  </dcterms:publisherRepository>
  <dcterms:publisherDigital>
    <![CDATA[
    University of Notre Dame. Kresege Law Library & Technology
    ]]>
  </dcterms:publisherDigital>
  <dcterms:publisherInstitution>
    University of Notre Dame
  </dcterms:publisherInsititution>
  <dcterms:equipmentDigitizing>
    Adobe Acrobat X
  </dcterms:equipmentDigitizing>
  <dcterms:isPartOf.ISSN>
    1234-5678
  </dcterms:isPartOf.ISSN>

</metadata>
)