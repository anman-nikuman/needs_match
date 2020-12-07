class Public::EventsController < ApplicationController
  def index
    @events = Event.order(:date).page(params[:page]).per(50)
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
