class JournalsController < ApplicationController
  respond_to :json

  def index
    @journals = Journal.find(:all)
    respond_with(@journals) do |format|
      format.json { render(json: {journals: @journals.collect(&:id)}.to_json) }
    end
  end

  def show
    @journal = Journal.find(params[:id])
    respond_with(@journal)
  end

  def create
    @journal = Journal.new(params[:journal])
    @journal.save
    respond_with(@journal)
  end

  def update
    @journal = Journal.find(params[:id])
    @journal.update_attributes(params[:journal])
    respond_with(@journal)
  end

end