class Staffs::EventsController < ApplicationController
  def index
    basis_day = Date.current.since(4.days).change(hour: 0, min: 0, sec: 0)
    # my_branch = current_user.affiliation_branches
    my_branch = Staff.find(1).affiliation_branches
    p Event.find(1).prefecture_name
    @events = Event.where("date >= ?", basis_day).where(branch_id: my_branch).order(:date).page(params[:page]).per(50)
  end
  
  def edit
    # @branch = current_user.affiliation_branches
    @branch = Staff.find(1).affiliation_branches
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    flash[:success] = "編集を保存しました"
    redirect_to staffs_events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:succress] = "イベント情報を削除しました"
    redirect_to staffs_events_path
  end

  private
  def event_params
    params.require(:event).permit(
      :branch_id,
      :date,
      :station1,
      :station2,
      :postal_code,
      :prefecture_code,
      :address
    )
  end
  
end
