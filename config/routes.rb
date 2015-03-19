SistemaVyp::Application.routes.draw do
  
resources :products
resources :users
resources :sessions, only: [:new, :create, :destroy]
resources :carts
resources :pdf
resources :order_items, only: [:new, :create, :update, :destroy]

root to: 'static_pages#home'
match '/help',to: 'static_pages#help'
match '/signup',to: 'users#new'
match '/orders', to: 'carts#new'
match '/order_items', to: 'order_items#new'
match '/pdf', to: 'pdf#new'
match '/create_pdf', to: 'pdf#create'
match '/sell_order', to: 'carts#new_sell_order'
match '/quotation', to: 'carts#new_quotation'
match '/create_sell_order', to: 'carts#create_sell_order'
match '/create_quotation', to: 'carts#create_quotation'
match '/signin', to: 'sessions#new'
match '/signout', to: 'sessions#destroy', via: :delete

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
