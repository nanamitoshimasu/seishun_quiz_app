Rails.application.routes.draw do
  root 'staticpages#top'
  get 'staticpages/top'

  resources :questions, only: [:index, :show] do
    collection do
      post :answer
      get :result
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
