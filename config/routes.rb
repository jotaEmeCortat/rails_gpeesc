Rails.application.routes.draw do
  root 'pages#index'

  resources :authors, path: :membros
  resources :publications, path: :publicacoes
end
