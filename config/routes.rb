# == Route Map
#
#            Prefix Verb   URI Pattern                       Controller#Action
#              root GET    /                                 pages#welcome
#     organizations GET    /organizations(.:format)          organizations#index
#                   POST   /organizations(.:format)          organizations#create
#  new_organization GET    /organizations/new(.:format)      organizations#new
# edit_organization GET    /organizations/:id/edit(.:format) organizations#edit
#      organization GET    /organizations/:id(.:format)      organizations#show
#                   PATCH  /organizations/:id(.:format)      organizations#update
#                   PUT    /organizations/:id(.:format)      organizations#update
#                   DELETE /organizations/:id(.:format)      organizations#destroy
#            people GET    /people(.:format)                 people#index
#                   POST   /people(.:format)                 people#create
#        new_person GET    /people/new(.:format)             people#new
#       edit_person GET    /people/:id/edit(.:format)        people#edit
#            person GET    /people/:id(.:format)             people#show
#                   PATCH  /people/:id(.:format)             people#update
#                   PUT    /people/:id(.:format)             people#update
#                   DELETE /people/:id(.:format)             people#destroy
#             posts GET    /posts(.:format)                  posts#index
#                   POST   /posts(.:format)                  posts#create
#          new_post GET    /posts/new(.:format)              posts#new
#         edit_post GET    /posts/:id/edit(.:format)         posts#edit
#              post GET    /posts/:id(.:format)              posts#show
#                   PATCH  /posts/:id(.:format)              posts#update
#                   PUT    /posts/:id(.:format)              posts#update
#                   DELETE /posts/:id(.:format)              posts#destroy
#

Rails.application.routes.draw do
  root :to => "pages#welcome"
  get "/organizations/list/:page" => "organizations#list" 
  resources :organizations
  resources :people
  resources :posts



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
