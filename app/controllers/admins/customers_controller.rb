class Admins::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def import
    # Branch.import_customer(params[:file])
    Customer.import_customer(params[:file])
    Introduction.import_customer(params[:file])
    redirect_to admins_customers_path
  end

end
