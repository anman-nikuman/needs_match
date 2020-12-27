class Admins::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def import
    Customer.import(params[:file])
    Brunch.import(params[:file])
    Introduction.import(params[:file])
    redirect_to admins_customers_path
  end

end
