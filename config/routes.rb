Rails.application.routes.draw do
  get 'sessions/new'
  get '/create1' => 'sessions#create1'
  
  # get '/userslogin' => 'sessions#create'
  # post '/sessions/create' => '/sessions/create'

  get 'sessions/obtain_page'
  get 'sessions/obtainsuccess'
  get 'sessions/obtainerror1'

  post  'sessions/obtain'
  # post '/sessions/obtain' => '/sessions/obtain'

  get 'users/new'
  get 'users/registererror0'
  get 'users/registererror1'
  get 'users/registererror2'

  # post  'users/create'
  post '/users/create' => 'users#create'

  get  'users/index'

  resources :wzxes
  get '/find' => 'wzxes#find'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
