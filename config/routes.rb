Rails.application.routes.draw do
  namespace :v1 do
    post 'pessoas' => 'people#create'
    post 'vagas' => 'jobs#create'
    post 'candidaturas' => 'applications_for_job#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
