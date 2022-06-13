Rails.application.routes.draw do
  resources :appointments
  resources :sections
  resources :classrooms
  resources :students
  resources :teachers do
    resources :teacher_subjects, shallow: true
  end
  resources :subjects
  root to: 'appointments#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
