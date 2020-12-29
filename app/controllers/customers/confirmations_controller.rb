# frozen_string_literal: true

class Customers::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   if params[:confirmation_token].present?
  #     @original_token = params[:confirmation_token]
  #   elsif params[resource_name].try(:[], :confirmation_token).present?
  #     @original_token = params[resource_name][:confirmation_token]
  #   end

  #   self.resource = resource_class.find_by_confirmation_token Devise.token_generator.
  #     digest(self, :confirmation_token, @original_token)

  #   super if resource.nil? or resource.confirmed?
  # end

  def show
    self.resource = resource_class.find_by_confirmation_token(params[:confirmation_token])
    super if resource.nil? || resource.confirmed?
  end

  # def confirm
  #   @original_token = params[resource_name].try(:[], :confirmation_token)
  #   digested_token = Devise.token_generator.digest(self, :confirmation_token, @original_token)
  #   self.resource = resource_class.find_by_confirmation_token! digested_token
  #   resource.assign_attributes(permitted_params) unless params[resource_name].nil?

  #   if resource.valid? && resource.password_match?
  #     self.resource.confirm!
  #     set_flash_message :notice, :confirmed
  #     sign_in_and_redirect resource_name, resource
  #   else
  #     render :action => 'show'
  #   end
  # end

  def confirm
    confirmation_token = confirmation_params[:confirmation_token]
    self.resource = resource_class.find_by_confirmation_token!(confirmation_token) if confirmation_token.present?
  
    if resource.update_attributes(confirmation_params) && resource.password_match?
      self.resource = resource_class.confirm_by_token(confirmation_token)
      set_flash_message :notice, :confirmed
      sign_in_and_redirect resource_name, resource
    else
      render :show
    end
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end

  private
  def confirmation_params
    params.require(resource_name).permit(:confirmation_token, :password, :password_confirmation)
  end

  # def permitted_params
  #   params.require(resource_name).permit(:confirmation_token, :password, :password_confirmation)
  # end
end
