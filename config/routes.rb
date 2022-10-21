Rails.application.routes.draw do
  resources :monsters
  resources :tweets, exlude: [:edit, :update, :destroy]
  root "tweets#index" # / is the same as /tweets
  resolve("new_tweet_path") {route_for(:new)}
  resolve("new_monster_path ") {route_for(:new)}
  #post '/tweets/new', to: 'tweets#create'
end
