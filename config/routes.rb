Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/command_center/super_admin', as: 'super_admin_root'

  authenticated :user do
    get '/admins', to: 'admins#index', as: 'admin_root'
  end


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
