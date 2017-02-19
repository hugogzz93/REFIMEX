Rails.application.routes.draw do
  root 'welcome#index'
  resources :products, :modifiers
  resources :users, only: [:index, :edit, :update]
  devise_for :users, controllers: { registrations: 'registrations' } do
    # get 'index', to: 'users#index', as: 'users'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
