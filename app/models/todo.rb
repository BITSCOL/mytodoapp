class Todo < ApplicationRecord
  validates :title, presence: true

  def self.total_items
    Todo.count
  end

  def self.completed_items
    Todo.where(completed: true).count
  end

  def self.percent_completed
    return 0 if total_items.zero?

    (completed_items * 100 / total_items).round(2)
  end
end
