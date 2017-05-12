class Goal < ApplicationRecord
  validates_presence_of :name
  belongs_to :sprint
end
