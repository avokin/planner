Rails.application.routes.draw do
  resources :sprints do
    resources :goals
  end
end
