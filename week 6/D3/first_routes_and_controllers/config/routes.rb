Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :update, :destroy, :show, :create]

  resources :artworks, only: [:index, :show, :create, :update, :destroy]

  # get 'users', to: 'users#index', as: 'all_users'
  # get 'users/new', to: 'users#new', as: 'new_user' # get HTML form
  # get 'users/:id', to: 'users#show', as: 'find_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # post 'users', to: 'users#create', as: 'create_user' # HTML form -> update + create
  # patch 'users/:id', to: 'users#update', as: 'patch_user' # update user
  # put 'users/:id', to: 'users#update', as: 'update_user'
  # delete 'users/:id', to: 'users#destroy', as: 'delete_user'
end
