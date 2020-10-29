# frozen_string_literal: true

class TodoSerializer < BaseSerializer
  attributes :id, :text, :isCompleted
end
