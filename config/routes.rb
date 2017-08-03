Rails.application.routes.draw do
  get 'sessions/new'

   post 'sessions/create'
  # post '/sessions/create' => '/sessions/create'

  get 'sessions/obtain_page'

  post  'sessions/obtain'
  # post '/sessions/obtain' => '/sessions/obtain'

  get 'users/new'

  # post  'users/create'
  post '/users/create' => 'users#create'

  get  'users/index'

  resources :wzxes
  get '/find' => 'wzxes#find'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
