TvShows::Application.routes.draw do

  root to: 'television_shows#index'

  resources :television_shows, only: [:index, :show, :new, :create] do
    resources :characters
  end
end
