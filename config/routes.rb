Rails.application.routes.draw do
  resources :student_sections
  resources :sections
  resources :students
  resources :classrooms
  resources :teachers do
    resources :teacher_subjects, shallow: true
  end
  resources :subjects
  root to: 'subjects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
