# frozen_string_literal: true

require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @todo = todos(:todo_1)
    @project = projects(:family)
  end

  test 'PATCH #checked ok' do
    patch "/projects/#{@todo.project_id}/todos/#{@todo.id}"
    assert_response :created
  end

  test 'PATCH #checked not_found' do
    patch '/projects/100/todos/100'
    assert_response :not_found
  end

  test 'POST #create new todo with existing project ok' do
    post '/todos', params: { todo: { project_id: @project.id, text: 'To buy products' } }, as: :json
    assert_response :created
  end

  test 'POST #create new todo with existing project not_found' do
    post '/todos', params: { todo: { project_id: @project.id, text: '' } }, as: :json
    assert_response :not_found
  end

  test 'POST #create new todo with not existing project with right title and with right text ok' do
    post '/todos', params: { title: 'University',
                             todo: { project_id: 1, text: 'To do homework' } }, as: :json
    assert_response :created
  end

  test 'POST #create new todo with not existing project with wrong title and with right text not_found' do
    post '/todos', params: { title: '',
                             todo: { project_id: 1, text: 'To do homework' } }, as: :json
    assert_response :not_found
  end

  test 'POST #create new todo with not existing project with right title and with wrong text ok' do
    post '/todos', params: { title: 'University',
                             todo: { project_id: 1, text: '' } }, as: :json
    assert_response :not_found
  end
end
