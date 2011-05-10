DsiSolutions::Application.routes.draw do
  devise_for :users

  root :to => "distributors#index"

  resources :distributors do
    resources :offers
    resources :users do
      resources :interests
    end
  end

  resources :pages
end
