# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :project
  before_action :todo, only: [:checked]

  def checked
    @todo.update!(isCompleted: !@todo.isCompleted)

    serialize(@todo, :ok)
  end

  def new
    @todo = @proejct.todos.new(todo_params)

    render json: params
  end

  def create
    @todo = @project.todos.create!(todo_params)

    serialize(@todo, :created)
  end

  private

  def project
    @project ||= Project.find(params[:project_id])
  end

  def todo
    @todo ||= @project.todos.find(params[:id])
  end

  def serialize(todo, status)
    render json: TodoSerializer.new(todo).serialized_json, status: status
  end

  def todo_params
    params.permit(*allowed_parameters)
  end

  def allowed_parameters
    %i[
      text
    ]
  end
end
