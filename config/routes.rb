Rails.application.routes.draw do
  get '/home_page', to: 'tests#home_page'

  resources :tests do
    resources :questions, shallow: true
  end
end
