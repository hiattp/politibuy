Politibuy::Application.routes.draw do

  authenticated :user do
    root :to => "campaigns#index"
  end

  devise_scope :user do
    root :to => "devise/registrations#new"
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  devise_for :users, :controllers => { :registrations => "registrations", :confirmations => "confirmations" }
  
  match 'users/bulk_invite/:quantity' => 'users#bulk_invite', :via => :get, :as => :bulk_invite
  
  match 'users/unzip' => "users#unzip_code", :via => :get
  
  resources :users, :only => [:show, :index] do
    get 'invite', :on => :member
  end
  
  resources :campaigns do
    resources :updates
    resources :pledges
    resources :key_policy_makers
    resources :beneficiaries
  end

  resources :policy_makers
  # resources :recipients (deprecated in favor of 'key policy makers')
  resources :vehicles
  
  match "admin" => "admin#index"
  match "admin/campaigns" => "admin#campaigns"
  
  match "about" => "welcome#about"
  match "terms" => "welcome#terms"
  match "privacy" => "welcome#privacy"
  match "ethics" => "welcome#ethics"

  
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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

end
