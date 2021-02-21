class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.integer :weather_station
      t.boolean :approved, :default => false

      t.timestamps
    end
    add_reference :people, :users, foreign_key: true

  end
end
