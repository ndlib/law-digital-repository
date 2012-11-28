require 'spec_helper'

describe JournalSerializer do
  subject { JournalSerializer.new(journal) }
  let(:journal) { FactoryGirl.build(:journal).tap(&:assign_area!) }
  let(:json) { JSON.parse(subject.to_json) }
  let(:root) { json.fetch('journal') }
  it 'should be JSON' do
    root.fetch('pid')
    root.fetch('area').should == journal.area.pid
  end
end
