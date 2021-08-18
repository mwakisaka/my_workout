Rails.application.routes.draw do

  post "/workout/create" => "trainings#create"

  get "/workout/addworkout"

  get "body/:id/delete" => "bodies#destroy"

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"

  get "users/:id/destroy" => "users#destroy"

  post "login" => "users#login"
  get "login" => "users#login_form"

  get "logout" => "users#logout"

  post "users/create" => "users#create"
  get "signup" => "users#new"
 
  get "body/:id/edit" => "bodies#edit"
  post "body/:id/update" => "bodies#update"

  get "workout/:id/edit" => "trainings#edit"
  post "workout/:id/update" => "trainings#update"

  get "/" => "home#top"
  get "/body/:id" => "bodies#top"
  get "/body/:id/bodyweights" => "bodies#new"
  post "/body/create" => "bodies#create"
  get "/workout/:id" => "trainings#top"
  get "/workout/:id/workoutweights" => "trainings#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

