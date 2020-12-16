class Public::SearchesController < ApplicationController

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true)
  end

  private
  def search_params
    params.require(:q).permit(:evaluation_gteq, :area_cont)
  end

end
