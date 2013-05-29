require 'sidekiq/web'

require_dependency 'admin_constraint'
require_dependency 'homepage_constraint'
require_dependency 'offi_constraint'

BSH::Application.routes.draw do


  get "/404", to: "exceptions#not_found_404"

  mount Sidekiq::Web => '/sidekiq', constraints: AdminConstraint.new
     
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
