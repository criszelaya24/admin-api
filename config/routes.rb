Rails.application.routes.draw do
  scope '/app/v1' do
    post 'user_token' => 'user_token#create'
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
