SecretShareAjax::Application.routes.draw do

  resources :users, :only => [:index, :create, :new, :show] do
    resources :secrets, only: [:new]
  end
  resource :session, :only => [:create, :destroy, :new]
  resource :secret, only: [:create]

  resource :friendship, only: [:create]
  root :to => "users#show"
end
