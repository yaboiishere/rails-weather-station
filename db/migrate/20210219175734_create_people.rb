class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :owner
      t.integer :weather_station
      t.boolean :approved, :default => false

      t.timestamps
    end
  end
end
