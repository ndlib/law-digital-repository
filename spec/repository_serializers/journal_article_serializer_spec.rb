require 'spec_helper'

describe JournalArticleSerializer do
  subject { JournalArticleSerializer.new(journal_article) }
  let(:journal_article) { FactoryGirl.create(:journal_article) }
  let(:json) { JSON.parse(subject.to_json) }
  let(:root) { json.fetch('journal_article') }
  it 'should be JSON' do
    root.fetch('pid')
    root.fetch('area').should == journal_article.area.pid
    root.fetch('volumes').sort.should == journal_article.volumes.collect(&:pid).sort
  end
end
