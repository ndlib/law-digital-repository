class JournalArticlesController < ApplicationController
  respond_to :json

  def index
    @journal_articles = find_journal_articles
    respond_with(@journal_articles) do |format|
      format.json {
        render(json: {journal_articles: @journal_articles.collect(&:id)}.to_json)
      }
    end
  end

  def find_journal_articles
    params[:volume_id] ? volume.articles : JournalArticle.find(:all)
  end
  protected :find_journal_articles

  def volume
    @journal ||= JournalVolume.find(params[:volume_id])
  end
  protected :volume

  def show
    @journal_article = JournalArticle.find(params[:id])
    respond_with(@journal_article)
  end

  def create
    volume
    @journal_article = JournalArticle.new(params[:journal_article])
    @journal_article.save
    @journal_article.volumes << volume
    @journal_article.save
    respond_with(@journal_article)
  end

  def update
    @journal_article = JournalArticle.find(params[:id])
    @journal_article.update_attributes(params[:journal_article] || {})
    respond_with(@journal_article)
  end


end
