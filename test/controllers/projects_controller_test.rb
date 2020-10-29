# frozen_string_literal: true

require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test 'GET #index' do
    get '/projects'
    assert_response :ok
  end
end
