# == Route Map (Updated 2013-05-30 11:20)
#
#      Prefix Verb   URI Pattern                 Controller#Action
# jasminerice        /jasmine                    Jasminerice::Engine
#             GET    /404(.:format)              exceptions#not_found_404
# sidekiq_web        /sidekiq                    Sidekiq::Web
#       posts GET    /posts(.:format)            posts#index
#             POST   /posts(.:format)            posts#create
#    new_post GET    /posts/new(.:format)        posts#new
#   edit_post GET    /posts/:id/edit(.:format)   posts#edit
#        post GET    /posts/:id(.:format)        posts#show
#             PATCH  /posts/:id(.:format)        posts#update
#             PUT    /posts/:id(.:format)        posts#update
#             DELETE /posts/:id(.:format)        posts#destroy
#       users GET    /users(.:format)            users#index
#             POST   /users(.:format)            users#create
#    new_user GET    /users/new(.:format)        users#new
#   edit_user GET    /users/:id/edit(.:format)   users#edit
#        user GET    /users/:id(.:format)        users#show
#             PATCH  /users/:id(.:format)        users#update
#             PUT    /users/:id(.:format)        users#update
#             DELETE /users/:id(.:format)        users#destroy
#      groups GET    /groups(.:format)           groups#index
#             POST   /groups(.:format)           groups#create
#   new_group GET    /groups/new(.:format)       groups#new
#  edit_group GET    /groups/:id/edit(.:format)  groups#edit
#       group GET    /groups/:id(.:format)       groups#show
#             PATCH  /groups/:id(.:format)       groups#update
#             PUT    /groups/:id(.:format)       groups#update
#             DELETE /groups/:id(.:format)       groups#destroy
#     members GET    /members(.:format)          members#index
#             POST   /members(.:format)          members#create
#  new_member GET    /members/new(.:format)      members#new
# edit_member GET    /members/:id/edit(.:format) members#edit
#      member GET    /members/:id(.:format)      members#show
#             PATCH  /members/:id(.:format)      members#update
#             PUT    /members/:id(.:format)      members#update
#             DELETE /members/:id(.:format)      members#destroy
#             GET    /robots.txt(.:format)       crawlers#robots
#        root GET    /                           pages#index
#
# Routes for Jasminerice::Engine:
#            GET /spec/:spec_id/fixtures/*filename(.:format) jasminerice/spec#fixtures
# spec_index GET /spec(.:format)                             jasminerice/spec#index
#            GET /fixtures/*filename(.:format)               jasminerice/spec#fixtures
#            GET /(:suite)(.:format)                         jasminerice/spec#index
#

require 'sidekiq/web'

require_dependency 'admin_constraint'
require_dependency 'homepage_constraint'
require_dependency 'offi_constraint'

BSH::Application.routes.draw do


  get "/404", to: "exceptions#not_found_404"

  mount Sidekiq::Web => '/sidekiq', constraints: AdminConstraint.new
     
  resources :pages do
  end

  resources :users do
  end

  resources :groups do
  end

  resources :members do
  end

  namespace :forum do
  
  end

  get 'robots.txt' => 'crawlers#robots'

  root to: 'pages#index'
end
