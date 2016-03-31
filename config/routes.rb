# == Route Map
#
#        Prefix Verb   URI Pattern                              Controller#Action
#          root GET    /                                        pages#home
#         login GET    /login(.:format)                         session#new
#               POST   /login(.:format)                         session#create
#               GET    /organizations/list/:page(.:format)      organizations#list
#               GET    /organizations/:id/headteacher(.:format) organizations#headteacher
# organizations GET    /organizations(.:format)                 organizations#index
#  organization GET    /organizations/:id(.:format)             organizations#show
#               DELETE /organizations/:id(.:format)             organizations#destroy
#        people POST   /people(.:format)                        people#create
#    new_person GET    /people/new(.:format)                    people#new
#   edit_person GET    /people/:id/edit(.:format)               people#edit
#        person PATCH  /people/:id(.:format)                    people#update
#               PUT    /people/:id(.:format)                    people#update
#               DELETE /people/:id(.:format)                    people#destroy
#          post DELETE /posts/:id(.:format)                     posts#destroy
#         users GET    /users(.:format)                         users#index
#          user GET    /users/:id(.:format)                     users#show
#               PATCH  /users/:id(.:format)                     users#update
#               PUT    /users/:id(.:format)                     users#update
#               DELETE /users/:id(.:format)                     users#destroy
#

Rails.application.routes.draw do
  root :to => "session#new"
  get '/login' => "session#new"
  post '/login' => "session#create"
  delete '/login' => "session#destroy"
  get "/organizations/list/:page" => "organizations#list"
  get "/organizations/:id/headteacher" => "organizations#headteacher"
  get "/home" => "pages#home"
  resources :organizations, except: [:create, :new, :delete] do
    get 'new' => 'people#new' # Nested resource
  end
  resources :people, except: [:show, :index]
  resources :posts, except: [:index, :create, :show, :new, :edit, :update, :delete]
  resources :users, :only => [:index, :show, :update, :destroy]
  resources :institution_details, :only => [:edit, :update]




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
