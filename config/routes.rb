Rails.application.routes.draw do

  resources :posts
  devise_for :users, controllers:{
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  post "/custom_sign_up", to: "users/omniauth_callbacks#custom_sign_up"

  authenticated :user do
    root 'main#home', as: :authenticated_root
  end

  unauthenticated :user do
    root 'main#unregistered', as: :unauthenticated_root
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
