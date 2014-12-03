Rails.application.routes.draw do
  resources :availibilities
  resources :jobs

  devise_for :contractors
  devise_for :admins
  devise_for :customers

  devise_for :customers, controllers: { registrations: "customers/registrations" }, as: :customer
  devise_for :contractors, controllers: { registrations: "contractors/registrations" }, as: :contractor

  resources :customers do
    resources :jobs
  end

  resources :contractors do
    resources :availibilities
    resources :jobs, :only => [:index]
  end

  resources :admins

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  authenticated :customer do
    root :to => "pages#customer_home", as: :authenticated_customer_root
  end

  authenticated :admin do
    root :to => "pages#admin_home", as: :authenticated_admin_root
  end

  authenticated :contractor do
    root :to => "pages#contractor_home", as: :authenticated_contractor_root
  end

  unauthenticated do
    root 'pages#home'
  end

  get '/set_availability' => "pages#set_availability"
  get '/show_contractors' => "pages#show_contractors"
  get '/update_resource' => "pages#update_resource"

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
end
