class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    serialize(@projects,:ok)
  end

  private

  def serialize(projects, status)
    render json: ProjectSerializer.new(projects).serialized_json, status: status
  end

end
