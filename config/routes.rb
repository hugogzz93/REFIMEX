Rails.application.routes.draw do
  root 'welcome#index'

  get '/modifiers/find', to: 'modifiers#find', as: 'find_modifier'
  get '/orders/:product_id/new', to: 'orders#new', as: 'new_order'
  get 'product_prices/:product_id/new', to: 'product_prices#new',
                                        as: 'new_product_price'
  post 'products/:id/prices', to: 'product_prices#create', as: 'product_price'
  get 'products/:id/tax_history/', to: 'products#tax_history', as: 'product_tax_history'
  delete 'product_prices/:id', to: 'product_prices#destroy', as: 'delete_product_price'
  get 'product_price_taxes/', to: 'product_prices#tax_index', as: 'product_tax'

  delete '/sign_out', to: 'sessions#log_out', as: 'sign_out'

  resources :modifiers, :products, :product_prices
  resources :orders, only: [:create, :index, :destroy, :show]
  resources :users, only: [:index, :edit, :update, :destroy]
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
