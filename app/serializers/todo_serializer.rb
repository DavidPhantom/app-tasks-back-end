class TodoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :text, :isCompleted
end
