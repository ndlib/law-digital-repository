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
end
