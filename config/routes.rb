Rails.application.routes.draw do

  get 'pictures/index'

  get 'mypowners' => 'mypowners#index'
  get 'mypusers'   => 'mypusers#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'top#index'

  devise_for :owners, controllers: {
  sessions:      'owners/sessions',
  passwords:     'owners/passwords',
  registrations: 'owners/registrations',
  omniauth_callbacks: "owners/omniauth_callbacks"
  }

  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }

  resources :events, only: [:index, :new, :create, :edit, :update ,:destroy, :show] do
    member do
      get 'apply'
    end

    collection do
      post :confirm
    end
  end

  resources :mypusers, only: [:index, :new, :create, :edit, :update, :show] do
    collection do
      post :confirm
    end
  end

  resources :mypowners, only: [:index, :new, :create, :edit, :update, :show] do
    collection do
      post :confirm
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
