class ProjectSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :title, :todos
end
