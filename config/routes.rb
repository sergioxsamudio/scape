Rails.application.routes.draw do
  get "juego_play/show_sala"
  get "juego_play/resultado"
  root "busquedas#new" # Página principal será la búsqueda

  resources :busquedas, only: [:new, :create]
  resources :juegos
  resources :usuarios
  resources :salas

  devise_for :admins
  resources :usuarios do
  get  'juego/:sala_index',  to: 'juego_play#show_sala',    as: :jugar
  post 'juego/:sala_index',  to: 'juego_play#validar',      as: :jugar_validar
end

get 'resultado/:resultado', to: 'juego_play#resultado', as: :resultado_juego_play
end