Cocktaildepot::Application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root :to => 'main#index'
  match 'api/categories' => 'api#get_categories'
  match 'api/tags' => 'api#get_tags'
  match 'api/ingredients' => 'api#get_ingredients'
  match 'api/recipes' => 'api#get_recipes'
  match 'api/version' => 'api#get_api_version'
end
