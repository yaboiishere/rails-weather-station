Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  scope "/#{ENV["DIY_API_KEY"]}" do
    resources :weather_stations
  end

  post '/authenticate', to: 'authentication#authenticate'
  get '/current_user', to: 'users#current_user'
  get '/get_last_lock_user', to: 'opts#last_lock_user'
  post '/update_last_lock_user', to: "opts#update_last_lock_user"
  post "/#{ENV["DIY_API_KEY"]}" => "weather_stations#create"
  root to: "weather_stations#index"
  post "/getAll" => "weather_stations#getAll"
  resources :people, only: [:index, :show, :update]
  get "/approved" => "people#approved_people"
  get "/unapproved" => "people#unapproved_people"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
