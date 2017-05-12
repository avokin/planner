class CreateSprints < ActiveRecord::Migration[5.1]
  def change
    create_table :sprints do |t|
      t.integer :from
      t.integer :to

      t.timestamps
    end
  end
end
