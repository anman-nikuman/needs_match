class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    @search = Event.ransack(params[:q])
    @search_events = @seach
  end
end
