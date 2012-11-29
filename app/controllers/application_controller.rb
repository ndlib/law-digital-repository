require 'common_repository_model/exceptions'
class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CommonRepositoryModel::ObjectNotFoundError do |exception|
    respond_to do |wants|
      wants.json { render json: {errors: [exception.message]}, status: 404 }
    end
  end
end
