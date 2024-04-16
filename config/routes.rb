Rails.application.routes.draw do
  root 'pages#index'

  resources :authors, path: :membros
  resources :publications, path: :publicacoes
  resources :books, path: :livros
end
