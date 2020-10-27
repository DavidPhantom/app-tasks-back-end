# frozen_string_literal: true

Rails.application.routes.draw do
  patch 'projects/:project_id/todos/:id' => 'todos#checked', defaults: { format: :json }
  post 'projects/:project_id/todos' => 'todos#create', defaults: { format: :json }

  resources :projects, only: %i[index create], defaults: { format: :json }
end
