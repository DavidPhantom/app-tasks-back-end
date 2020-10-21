Rails.application.routes.draw do
  get '/projects' => 'projects#index', defaults: { format: :json }
  patch 'projects/:project_id/todo/:todo_id' => 'todos#checked'
  post '/todos' => 'todos#create'
end
