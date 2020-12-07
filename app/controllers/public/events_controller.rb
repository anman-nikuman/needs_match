class Public::EventsController < ApplicationController
  def index
    @events = Event.all
    @branchs = Branch.all
  end
end
