require_relative '../spec_helper'
require 'common_repository_model/test_support'

describe Journal do
  include CommonRepositoryModel::TestSupport
  subject { FactoryGirl.build(:journal) }

  it 'should require :name' do
    with_persisted_area(subject.name_of_area_to_assign) do |area|
      subject.name = nil
      subject.valid?
      subject.errors[:name].join("|").should match(/be blank/)
    end
  end

  it 'should have volumes' do
    with_persisted_area(subject.name_of_area_to_assign) do |area|
      subject.save!
      volume = FactoryGirl.create(:journal_volume) do |jv|
        jv.journals << subject
        jv.save!
      end
      journal = subject.class.find(subject.pid)

      assert_rels_ext(volume, :is_volume_of, [journal])
      assert_rels_ext(volume, :is_member_of, [journal])
      assert_rels_ext(journal, :is_volume_of, [])
      assert_rels_ext(journal, :is_member_of, [])

      assert_active_fedora_has_many(journal, :volumes, [volume])
      assert_active_fedora_has_many(volume, :journals, [journal])
    end
  end

end
