Rails.application.routes.draw do
  get "birth_stones/show"
  get "birth_stones/create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Birth stone application routes
  root "home#index"
  post "birth-stone", to: "birth_stones#create", as: :birth_stone
  get "birth-stone/:month", to: "birth_stones#show", as: :birth_stone_show
end
