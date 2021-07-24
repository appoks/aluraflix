Rails.application.routes.draw do

  constraints :subdomain => 'api', constraints: { format: :json } do
    namespace :api, path: nil, defaults: {format: :json} do
      scope module: :v1, constraints: { format: :json } do
        resources :videos, constraints: { format: :json }
      end
    end
  end

  scope :admin do
    resources :videos
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
