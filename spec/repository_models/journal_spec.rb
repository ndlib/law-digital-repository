require_relative '../spec_helper'
require 'common_repository_model/test_support'

describe Journal do
  include CommonRepositoryModel::TestSupport
  subject { FactoryGirl.build(:journal, area: nil) }

  it 'should require :name' do
    subject.name = nil
    subject.valid?
    subject.errors[:name].join("|").should match(/be blank/)
  end

  it 'should assign an area on :new' do
    with_persisted_area(Journal::AREA_NAME) do |area|
      subject.assign_area!
      subject.area.name.should == Journal::AREA_NAME
      subject.area.persisted?.should == true
    end
  end
end
