Rails.application.routes.draw do

  resources :inscriptions do
    resources :scribbles, except: [:index]
  end

  resources :aliases, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  get '/*path' => "inscriptions#index", :code => 302, :via => [:get]

  root 'inscriptions#index'

end
