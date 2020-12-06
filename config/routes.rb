Rails.application.routes.draw do

  scope module: :public do
    root "events#index"
  end

end
