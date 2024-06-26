Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get 'publicacoes', to: 'pages#publications'
  get 'livros', to: 'pages#books'
  resources :authors, path: :membros
  resources :publications, path: :publicacoes, only: [:show, :new, :edit, :create, :update, :destroy]
end
