Rails.application.routes.draw do
  root "task_lists#index"

  get "signin" => "sessions#new", as: :signin

  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout

  get "about" => "about#about"

  get "task_lists/new" => "task_lists#new"

  post "task_lists/new" => "task_lists#create"

  get "task_lists/:id/edit" => "task_lists#edit"

  patch "task_lists/:id/edit" => "task_lists#update"

  get "task_lists/:id/tasks/new" => "tasks#new"

  resources :task_lists

  resources :tasks

  patch "/task/:id/complete" => "tasks#complete"
  delete "/task_lists/task/:id/delete" => "tasks#delete"

end
