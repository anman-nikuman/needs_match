class Admins::EventsController < ApplicationController
  def new
    @branchs = Branch.all
    @events = Event.all
    # @branch = Branch.find(1)
    # @event = Event.find(1)
  end

  def import
    Branch.import(params[:file])
    Event.import(params[:file])
    redirect_to admins_events_new_path
  end
end
