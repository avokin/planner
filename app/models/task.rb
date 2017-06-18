class Task < ApplicationRecord
  belongs_to :day

  def update_and_create_day_if_needed(attributes)
    Task.transaction do
      if attributes[:day_id] != day.id
        new_day = Day.find_by_id(attributes[:day_id])
        unless new_day
          Day.create(id: attributes[:day_id])
        end
      end

      update(attributes)
    end
  end
end
