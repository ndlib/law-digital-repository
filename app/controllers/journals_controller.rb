class JournalsController < ApplicationController
  respond_to :xml, :json, :html
  def create
    @journal = Journal.new(params[:journal])
    @journal.save
    respond_with(@journal)
  end
end
