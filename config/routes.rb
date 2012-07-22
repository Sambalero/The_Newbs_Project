Newbies::Application.routes.draw do

 # root to: "public/index"
  root :controller => 'static', :action => '/public/index.html.erb'

  get "visitors/welcome"

  get "visitors/how_it_works"

  get "visitors/thank_you"

  get "visitors/help_wanted"

  match '/visitors' => "visitors#home"

  match '/join' => 'comments#join'

  match '/hire' => 'comments#hire'

  resources :comments

  resources :users

  match '/admin' => 'comments#admin'

#             root        /                            visitors#welcome
#     visitors_home GET    /visitors/home(.:format)     visitors#home
#    visitors_page2 GET    /visitors/page2(.:format)    visitors#page2
# visitors_thankYou GET    /visitors/thankYou(.:format) visitors#thank_you
#          comments GET    /comments(.:format)          comments#index
#                   POST   /comments(.:format)          comments#create
#       new_comment GET    /comments/new(.:format)      comments#new
#      edit_comment GET    /comments/:id/edit(.:format) comments#edit
#           comment GET    /comments/:id(.:format)      comments#show
#                   PUT    /comments/:id(.:format)      comments#update
#                   DELETE /comments/:id(.:format)      comments#destroy
#             users GET    /users(.:format)             users#index
#                   POST   /users(.:format)             users#create
#          new_user GET    /users/new(.:format)         users#new
#         edit_user GET    /users/:id/edit(.:format)    users#edit
#              user GET    /users/:id(.:format)         users#show
#                   PUT    /users/:id(.:format)         users#update
#                   DELETE /users/:id(.:format)         users#destroy

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

