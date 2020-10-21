require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  def setup
    @project = projects(:family)
    @todo = @project.todos.build(text: "To buy products")
  end

  test "should be valid" do
    assert @todo.valid?
  end

  test "project id should be present" do
    @todo.project_id = nil
    assert_not @todo.valid?
  end

  test "text should be present" do
    @todo.text = "   "
    assert_not @todo.valid?
  end

  test "text should be at most 25 characters" do
    @todo.text = "a" * 26
    assert_not @todo.valid?
  end
end
