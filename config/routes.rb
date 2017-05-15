Rails.application.routes.draw do
  resources :sprints do
    resources :goals
  end
  resources :days do
    resources :tasks
  end
end
