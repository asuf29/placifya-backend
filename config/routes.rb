Rails.application.routes.draw do
  namespace :api do
    post 'register', to: 'register#create'
    post 'login', to: 'login#create'
  end
end
