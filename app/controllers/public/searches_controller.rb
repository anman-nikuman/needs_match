class Public::SearchesController < ApplicationController

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true)
  end

  private
  def search_params
    params.require(:q).permit(:evaluation_gteq, :area_cont, :event_staffs_family_name_eq, :event_staffs_given_name_eq)
  end

end
