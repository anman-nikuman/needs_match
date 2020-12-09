class Admins::StaffsController < ApplicationController

  def import
    Staff.import(params[:file])
    redirect_to root_path
  end

end
