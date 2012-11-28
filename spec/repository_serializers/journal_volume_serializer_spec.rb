require 'spec_helper'

describe JournalVolumeSerializer do
  subject { JournalVolumeSerializer.new(journal_volume) }
  let(:journal_volume) { FactoryGirl.build(:journal_volume) }
  let(:json) { JSON.parse(subject.to_json) }
  let(:root) { json.fetch('journal_volume') }
  it 'should be JSON' do
    root.fetch('pid')
    root.fetch('journals').sort.should == journal_volume.
      journals.collect(&:pid).sort
  end
end
