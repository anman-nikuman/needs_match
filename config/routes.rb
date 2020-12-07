Rails.application.routes.draw do

  scope module: :public do
    root "events#index"
    get "/searches" => "searches#index"
  end

end
