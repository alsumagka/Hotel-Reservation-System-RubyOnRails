Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root "user#index"

  get "/user/main", to: "user#index"
  get "/user/register/:id", to: "user#new"
  post "/user/create", to: "user#create"

  get "/user/book", to: "user#book"



  get "/admin/home", to: "final#index"
  get "/admin/dash", to: "final#dash"

  get "/admin/register", to: "final#new"
  post "/admin/create", to: "final#create"

  get "/admin/approve/:id", to: "final#approve", as: :approve_record
  get "/admin/approved", to: "final#approved"
  get "/admin/reject/:id", to: "final#reject"

  get "/admin/rooms", to: "final#rooms"
  get "/admin/nroom", to: "final#nroom"
  post "/admin/nrooms", to: "final#nrooms"
  get '/admin/remove_reservation/:id', to: "final#remove_reservation", as: 'remove_reservation'

  get "/admin/history", to: "final#history"

  get "/admin/login", to: "final#log"
  post "/admin/log", to: "final#login"
end