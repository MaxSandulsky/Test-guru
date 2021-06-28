Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'

  resources :users, only: %i[create new]
  resources :sessions, only: %i[create new destroy]

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
