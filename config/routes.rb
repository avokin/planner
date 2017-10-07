Rails.application.routes.draw do
  resources :sprints do
    resources :goals
  end
  resources :days do
    resources :tasks do
    end
    get 'overdue', to: :overdue, controller: 'tasks'
  end
end
