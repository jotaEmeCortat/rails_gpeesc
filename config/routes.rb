Rails.application.routes.draw do
  root 'pages#index'
  get 'membros', to: 'pages#members'
  get 'publicacoes', to: 'pages#publications'
  get 'livros', to: 'pages#books'
end
