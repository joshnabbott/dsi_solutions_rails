DsiSolutions::Application.routes.draw do
  root :to => "distributors#index"

  resources :distributors do
    resources :offers
    resources :users do
      resources :interests
    end
  end

  resources :pages
end
