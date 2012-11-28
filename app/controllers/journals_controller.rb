class JournalsController < ApplicationController
  respond_to :xml, :json, :html

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