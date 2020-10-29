# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :projects, only: [:index]

  def index
    serialize(@projects, :ok)
  end

  def new
    @project = Project.new(project_params)

    render json: params
  end

  def create
    @project = Project.create!(project_params)

    serialize(@project, :created)
  end

  private

  def projects
    @projects ||= Project.all
  end

  def serialize(projects, status)
    render json: ProjectSerializer.new(projects, include: [:todos]).serialized_json, status: status
  end

  def project_params
    params.permit(*allowed_params)
  end

  def allowed_params
    %i[
      title
    ]
  end
end
