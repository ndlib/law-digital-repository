class JournalVolumesController < ApplicationController
  respond_to :xml, :json, :html

  def show
    @journal_volume = JournalVolume.find(params[:id])
    respond_with(@journal_volume)
  end

end