class Admins::StaffsController < ApplicationController

  def index
    @staffs = Staff.all
  end

  def import
    Staff.import(params[:file])
    redirect_to admins_staffs_path
  end

end
