Rails.application.routes.draw do
  root 'pages#index'
  get 'publicacoes', to: 'pages#publications'
  get 'livros', to: 'pages#books'

  resources :authors, path: :membros
end
