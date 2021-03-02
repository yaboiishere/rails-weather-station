Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  scope "/#{ENV["DIY_API_KEY"]}" do
    resources :weather_stations
  end

  post '/authenticate', to: 'authentication#authenticate'

  get '/current_user', to: 'users#current_user'

  get '/get_last_lock_user', to: 'opts#last_lock_user'
  post '/update_last_lock_user', to: "opts#update_last_lock_user"
  
  resources :people, only: [:index, :show, :update]
  get "/approved" => "people#approved_people"
  get "/unapproved" => "people#unapproved_people"

  post "/#{ENV["DIY_API_KEY"]}" => "weather_stations#create"
  post "/getAll" => "weather_stations#getAll"

  root to: "weather_stations#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
