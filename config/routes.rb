Rails.application.routes.draw do

  constraints :subdomain => 'api' do
    namespace :api, path: nil, defaults: {format: 'json'} do
      scope module: :v1 do #, constraints: ApiConstraints.new(version: 1, default: true) do
        resources :videos
      end
    end
  end

  scope :admin do
    resources :videos
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
