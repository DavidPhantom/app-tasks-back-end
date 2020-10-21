class TodosController < ApplicationController
  def checked
    todo = Todo.find_by(id: params[:todo_id])
    if todo
      todo.update_attribute(:isCompleted, !todo.isCompleted)
    end
  end

  def new
    @todo = Todo.new
    render json: params
  end

  def create
    if params[:title]
      @project = Project.new(project_params)
      if @project.save
        @todo = Todo.new(params[:text])
        @todo.project_id = @project.id
        if @todo.save
          serialize(@todo, :created)
        end
      end
    else
      @todo = Todo.new(todo_params)
      if @todo.save
        serialize(@todo, :created)
      end
    end
  end

  private

  def serialize(todos, status)
    render json: ProjectSerializer.new(todos).serialized_json, status: status
  end

  def todo_params
    params.require(:todo).permit(*allowed_parameters_todo)
  end

  def project_params
    params.require(:project).permit(*allowed_parameters_project)
  end

  def allowed_parameters_todo
    [
        :project_id,
        :text
    ]
  end

  def allowed_parameters_project
    [
        :title
    ]
  end
end
