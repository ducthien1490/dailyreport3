Dailyreport3::Application.routes.draw do

  
  resources :users 
  resources :sessions, only: [:new, :create, :destroy]
  resources :catalogs do
    resources :answers
    end
  resources :groups #, only: [:new, :create, :destroy, :index, :edit]
  resources :answers, only: [:new, :create, :update]
  resources :managers

  root 'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/catalog', to: 'catalogs#new',         via: 'get'
  match '/excel',   to: 'users#excel',          via:'get'
  match '/managers/:id/show',to: 'managers#show',       via:'get' 
  match '/report_user' ,to: 'users#report_user', via:'get'
  match '/xuly' , to: 'users#xuly', via: 'post'
  match '/managers/:id/show',to: 'managers#show',       via:'post'
  match '/managers/:id',to: 'managers#show',       via:'post'  
  match '/answers/create', to: 'answers#create' ,via: 'post'
  match '/users/:id/edit_current_user',to: 'users#edit_current_user',via: 'get'

 # match '/edit' ,   to: 'users#edit',         via: 'get'
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

end
