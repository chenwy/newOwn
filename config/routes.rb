Rails.application.routes.draw do

  resources :jobs

  namespace :company do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
    end
  end

  devise_for :users
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
