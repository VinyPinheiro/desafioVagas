Rails.application.routes.draw do
  namespace :v1 do
    post 'people/create', 'people#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
