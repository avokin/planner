class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :finished
      t.references :day, foreign_key: true

      t.timestamps
    end
  end
end