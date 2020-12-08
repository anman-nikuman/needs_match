class Admins::EventsController < ApplicationController
  def new
  end

  def import
    Branch.import(params[:file])
    Event.import(params[:file])
    redirect_to root_path
  end
end
