Rails.application.routes.draw do
  scope '/app/v1' do
    get 'users/admin' => 'users#users_admin'
    post 'user_token' => 'user_token#create'
    resources :users
    resources :time_records
    get 'time_records/users/:user_id' => 'time_records#find_user_time_record'
    # normal users can access to their information
    get 'current_user/details' => 'users#current_user_details'
    get 'current_user/time_record' => 'time_records#current_user_time_records_details'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
