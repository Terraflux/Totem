Rails.application.routes.draw do

  resources :inscriptions do
    resources :scribbles, except: [:index]
  end

  root to: 'inscriptions#index'

end