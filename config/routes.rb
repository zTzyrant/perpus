Rails.application.routes.draw do
  resources :pinjams
  get 'welcome/index'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
