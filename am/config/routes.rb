Am::Application.routes.draw do

  resources :sessions, :only => [:new, :create, :destroy]
 # resources :people
  resources :people,        :controller => 'people',    :type => 'person'
  resources :admins,        :controller => 'people',    :type => 'admin'
  resources :users,         :controller => 'people',    :type => 'user'

  resources :personalgroups

  resources :rights

  resources :groups

  resources :comments, :only => [:create, :index, :new]

  resources :videoitems do
      resources :comments, :only => [:create, :index, :new]
  end

  match '/signin',          :to     => 'sessions#new',          :via => 'get'
  match '/sessions',        :to     => 'sessions#create',       :via => 'post'
  match '/signout',         :to     => 'sessions#destroy',      :via => 'delete'


  #match '/management',      :to     => 'groups#management',     :via => 'get'

  root 'sessions#new'
  #match '/home',            :to     => 'sessions#home'
  #match 'setting',          :to     => 'sessions#setting'



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
end
