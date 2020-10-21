class Todo < ApplicationRecord
  belongs_to :project
  validates :project_id, presence: true
  validates :text, presence: true, length: { maximum: 25 }
end
