# frozen_string_literal: true

class ProjectSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :title, :todos
end
