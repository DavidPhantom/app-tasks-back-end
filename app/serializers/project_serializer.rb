class ProjectSerializer
  include FastJsonapi::ObjectSerializer

  attributes :project, :id, :text, :isCompleted
end
