# frozen_string_literal: true

class ProjectSerializer < BaseSerializer
  attributes :id, :title

  has_many :todos
end
