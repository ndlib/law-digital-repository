class JournalVolumesController < ApplicationController
  respond_to :json

  def index
    if params[:journal_id]
      @journal_volumes = journal.volumes
    else
      @journal_volumes = JournalVolume.find(:all)
    end
    respond_with(@journal_volumes) do |format|
      format.json {
        render(json: {journal_volumes: @journal_volumes.collect(&:id)}.to_json)
      }
    end
  end

  def show
    @journal_volume = JournalVolume.find(params[:id])
    respond_with(@journal_volume)
  end

  def create
    journal
    @journal_volume = JournalVolume.new(params[:journal_volume])
    @journal_volume.save
    @journal_volume.journals << journal
    @journal_volume.save
    respond_with(@journal_volume)
  end

  def update
    @journal_volume = JournalVolume.find(params[:id])
    @journal_volume.update_attributes(params[:journal_volume] || {})
    respond_with(@journal_volume)
  end

  protected
  def journal
    @journal ||= Journal.find(params[:journal_id])
  end
end
