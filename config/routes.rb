Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/command_center/super_admin', as: 'rails_admin'

  authenticated :user do
    get '/admin', to: 'admins#index', as: 'admin_root'
    get '/member', to: 'members#index', as: 'member_root'
  end


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
