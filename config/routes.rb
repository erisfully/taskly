Rails.application.routes.draw do
  root "task_lists#index"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
  get "about" => "about#about"
  get "task_lists/new" => "task_lists#new"
  post "task_lists/new" => "task_lists#create"
end
