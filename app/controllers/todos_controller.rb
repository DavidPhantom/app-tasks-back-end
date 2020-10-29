# frozen_string_literal: true

class TodosController < ApplicationController
  def checked
    todo = Todo.find_by(id: params[:todo_id])
    if todo
      todo.update_attribute(:isCompleted, !todo.isCompleted)
      serializeTodo(todo, :created)
    else
      render_mistakes('There is no such todo!')
    end
  end

  def new
    @todo = Todo.new
    render json: params
  end

  def create
    mess = 'Fix your input data!'
    @todo = Todo.new(todo_params)
    if @todo.project_id == 1
      @project = Project.new(project_params)
      if @project.save
        @todo.project_id = @project.id
        if @todo.save
          serializeProj(@project, :created)
        else
          render_mistakes(mess)
        end
      else
        render_mistakes(mess)
      end
    else
      if @todo.save
        serializeTodo(@todo, :created)
      else
        render_mistakes(mess)
      end
    end
  end

  private

  def serializeTodo(todo, status)
    render json: TodoSerializer.new(todo).serialized_json, status: status
  end

  def serializeProj(proj, status)
    render json: ProjectSerializer.new(proj).serialized_json, status: status
  end

  def render_mistakes(mess)
    render json: { message: mess }, status: :not_found
  end

  def todo_params
    params.require(:todo).permit(*allowed_parameters_todo)
  end

  def project_params
    params.permit(*allowed_parameters_project)
  end

  def allowed_parameters_todo
    %i[
      project_id
      text
    ]
  end

  def allowed_parameters_project
    [
      :title
    ]
  end
end
