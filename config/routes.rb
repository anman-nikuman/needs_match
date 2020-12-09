Rails.application.routes.draw do

  devise_for :staffs

  scope module: :public do
    root "events#index"
  end

  namespace :staffs do
    resources :events, only: [:index, :edit, :update, :destroy]
  end

  namespace :admins do
    get 'events/new' => 'events#new'
    post 'events/import' => 'events#import'
  end
end
