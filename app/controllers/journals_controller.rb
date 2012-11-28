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

end