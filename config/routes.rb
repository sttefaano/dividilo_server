Rails.application.routes.draw do
  resources :rooms do
    get 'index', to: 'rooms#index'
    get 'show', to: 'rooms#show'
    post 'create', to: 'rooms#create'
    patch 'update', to: 'rooms#update'
    delete 'delete', to: 'rooms#delete'
  end

  resources :users do
    get 'index', to: 'users#index'
    get 'show', to: 'users#show'
    post 'create', to: 'users#create'
    patch 'update', to: 'users#update'
    delete 'delete', to: 'users#delete'
  end

  resources :transactions do
    get 'index', to: 'transactions#index'
    get 'show', to: 'transactions#show'
    post 'create', to: 'transactions#create'
    patch 'update', to: 'transactions#update'
    delete 'delete', to: 'transactions#delete'
  end
end
