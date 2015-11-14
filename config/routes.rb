Rails.application.routes.draw do

  resources :inscriptions do
    resources :scribbles, except: [:index]
  end

  get '/*path' => "inscriptions#index", :code => 302, :via => [:get]
  root to: 'inscriptions#index'

end
