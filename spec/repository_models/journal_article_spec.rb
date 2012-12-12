# Generated via
#  `rails generate common_repository_model::collection JournalArticle`
require 'spec_helper'
require 'common_repository_model/test_support'

describe JournalArticle do
  include CommonRepositoryModel::TestSupport

  describe 'factories (meta)', slow: true, factory: true do
    it 'should have a create(:journal_article_with_volume)' do
      article = FactoryGirl.create(:journal_article_with_volume)
      article = article.class.find(article.id)
      article.volumes.count.should == 1
    end
  end

  describe 'meta_data' do
    before(:all) do
      @article = FactoryGirl.create(:journal_article_with_volume)
    end
    it { @article.title.should be_kind_of(String) }
    it { @article.issn.should be_kind_of(String) }
    it { @article.abstract.should be_kind_of(String) }
    it { @article.recommended_citation.should be_kind_of(String) }

  end

  it 'should have well formed relations between volume/article' do
    volume = FactoryGirl.build(:journal_volume)
    with_persisted_area(volume.name_of_area_to_assign) do |area|
      volume.save!
      article = FactoryGirl.create(:journal_article)
      article.volumes << volume
      article.save!

      volume = volume.class.find(volume.pid)
      article = article.class.find(article.pid)

      assert_rels_ext(article, :is_article_of, [volume])
      assert_rels_ext(article, :is_member_of, [volume])
      assert_active_fedora_has_many(article, :volumes, [volume])

      assert_rels_ext(volume, :is_article_of, [])
      assert_rels_ext(volume, :is_member_of, [])
      assert_active_fedora_has_many(volume, :articles, [article])

    end
  end

end
