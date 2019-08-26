Rails.application.routes.draw do
  scope '/app/v1' do
    post 'user_token' => 'user_token#create'
    resources :users
    resources :time_records
    get 'time_records/users/:user_id' => 'time_records#find_user_time_record'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
