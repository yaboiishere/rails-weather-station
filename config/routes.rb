Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  scope "/#{ENV["DIY_API_KEY"]}" do
    resources :weather_stations
  end

   post "/#{ENV["DIY_API_KEY"]}" => "weather_stations#create"
   root to: "weather_stations#index"
   post "/getAll" => "weather_stations#getAll"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
