Rails.application.routes.draw do

  devise_for :staffs, controllers: {
    sessions: 'staffs/sessions'
  }
  
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
