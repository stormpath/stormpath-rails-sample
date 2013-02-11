StormpathRailsSample::Application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users
  end

  root :to => 'admin::users#index'
end
