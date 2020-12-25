class Public::SearchesController < ApplicationController

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true)
    basis_day = Date.current.since(4.days).change(hour: 0, min: 0, sec: 0)
    @events = @events.where("date >= ?", basis_day).order(:date).page(params[:page]).per(50)
  end

  private
  def search_params
    params.require(:q).permit(:evaluation_gteq, :area_cont, :event_staffs_family_name_eq, :event_staffs_given_name_eq)
  end

end
