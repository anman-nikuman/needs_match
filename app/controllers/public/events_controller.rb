class Public::EventsController < ApplicationController

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true)
    basis_day = Date.current.since(4.days).change(hour: 0, min: 0, sec: 0)
    @events = Event.where("date >= ?", basis_day).order(:date).page(params[:page]).per(50)
  end

  private
  def event_params
    params.require(:event).permit(
      :branch_id,
      :date,
      :station,
      :postal_code,
      :prefecture_code,
      :city,
      :street,
      :building,
      :prefecture_name
    )
  end

  def search_params
    params.require(:q).permit(:evaluation_gteq, :area_cont)
  end

end
