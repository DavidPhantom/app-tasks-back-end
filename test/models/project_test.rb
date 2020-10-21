require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = Project.new(title: "Family")
  end

  test "should be valid" do
    assert @project.valid?
  end

  test "title should be present" do
    @project.title = "     "
    assert_not @project.valid?
  end

  test "title should not be too long" do
    @project.title = "a" * 16
    assert_not @project.valid?
  end

  test "associated todos should be destroyed" do
    @project.save
    @project.todos.create!(text: "To buy products")
    assert_difference 'Todo.count', -1 do
      @project.destroy
    end
  end
end
