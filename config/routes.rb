Rails.application.routes.draw do
  devise_for :clients, controllers: { registrations: "devisecontrollers/registrations", sessions: "devisecontrollers/sessions" }


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  post "messages/new" => "messages#create"

  get "/accountdashboard" => "accounts#show", as: :account
  get "/transactions" => "transactions#index", as: :transactions
  get "/transactions/new" => "transactions#new", as: :new_transaction
  post "/transactions/create" => "transactions#create", as: :create_transaction
  get  "/editinfo" => "accounts#edit", as: :edit_all



  #get "/choice" => "profiles#choice", as: :choice

  #get "newprofile/:type" => "profiles#new", as: :newprofile
  put "/profiles" => "profiles#update"
  patch "/profiles" => "profiles#update"


  put "/updatenumber" => "profiles#updatenum", as: :edit_number
  patch "/updatenumber" => "profiles#updatenum"

   put "/updateaccount" => "accounts#update", as: :edit_account
  patch "/updateaccount" => "accounts#update"

  resources :profiles



  # namespace :client do
  #    root :to => "test#test"
  # end

  # Example of regular route:
  # get 'products/:id' => 'catalog#view'

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
