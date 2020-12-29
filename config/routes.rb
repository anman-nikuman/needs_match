Rails.application.routes.draw do
  devise_for :staffs, controllers: {
    registrations: 'staffs/registrations',
    sessions: 'staffs/sessions',
    passwords: 'staffs/passwords'
  }

  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    confirmations: 'customers/confirmations'
  }

  devise_scope :customer do
    patch "customers/confirmation", to: "customers/confirmations#confirm"
  end
  
  scope module: :public do
    root 'events#index'
    get '/searches' => 'searches#index'
  end

  namespace :staffs do
    resources :events, only: [:index, :edit, :update, :destroy]
  end

  namespace :admins do
    get 'events/new' => 'events#new'
    post 'events/import' => 'events#import'
    post 'staffs/import' => 'staffs#import'
    get 'staffs' => 'staffs#index'
  end
end
