Rails.application.routes.draw do

  namespace :students do
    resources :textbooks, only: [:index, :show] do
      resources :students_textbooks, only: [:create, :destroy] do
        resources :progresses, only: [:new, :create]
      end
    end
  end

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
  resources :students, only: [:show]
  resources :teachers, only: [:show]

  devise_scope :student do
    post 'students/students_guest_sign_in', to: 'students/sessions#students_guest_sign_in'
  end
  
  devise_scope :teacher do
    post 'teachers/teachers_guest_sign_in', to: 'teachers/sessions#teachers_guest_sign_in'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
