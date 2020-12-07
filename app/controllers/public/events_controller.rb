class Public::EventsController < ApplicationController
  def index
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

end
