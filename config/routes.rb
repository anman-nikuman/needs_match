Rails.application.routes.draw do

  scope module: :public do
    root "events#index"
  end

  namespace :admins do
    get 'events/new' => 'events#new'
    post 'events/import' => 'events#import'
  end
end
