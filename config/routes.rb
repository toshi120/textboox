Rails.application.routes.draw do
  namespace :students do
    resources :textbooks, only: [:index, :show] do
      resources :students_textbooks, only: [:create, :destroy] do
        resources :progresses, only: [:new, :create]
      end
    end
  end
  resources :students, only: [:show]

  namespace :teachers do
    resources :textbooks
  end
  devise_for :teachers, controllers: {
    sessions:       'teachers/sessions',
    passwords:      'teachers/passwords',
    registrations:  'teachers/registrations'
  }
  devise_for :students, controllers: {
    sessions:       'students/sessions',
    passwords:      'students/passwords',
    registrations:  'students/registrations'
  }
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
