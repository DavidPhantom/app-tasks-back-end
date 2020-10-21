class ProjectsController < ApplicationController
  def index
    @todos = Todo.all
    serialize(@todos, :ok)
  end

  private

  def serialize(projects, status)
    render json: ProjectSerializer.new(projects).serialized_json, status: status
  end

end
