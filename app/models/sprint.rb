class Sprint < ApplicationRecord
  validates_presence_of :from, :to
  has_many :goals
end
