# frozen_string_literal: true

class AddIsCompletedToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :isCompleted, :boolean, default: false
  end
end
