# frozen_string_literal: true

Rails.application.routes.draw do
  get '/projects' => 'projects#index', defaults: { format: :json }
  patch 'projects/:project_id/todos/:todo_id' => 'todos#checked', defaults: { format: :json }
  post '/todos' => 'todos#create', defaults: { format: :json }
end
