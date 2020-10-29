# frozen_string_literal: true

Rails.application.routes.draw do
  patch 'projects/:project_id/todos/:id' => 'todos#checked', defaults: { format: :json }
  post 'projects/:project_id/todos' => 'todos#create', defaults: { format: :json }
  get 'projects/:project_id/todos' => 'todos#new', defaults: { format: :json }

  resources :projects, only: %i[index new create], defaults: { format: :json }
end
