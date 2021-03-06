class CreateWeatherstations < ActiveRecord::Migration[6.0]
  def change
    create_table :weatherstations do |t|
      t.integer "weatherStation"
      t.float "temperatures"
      t.float "humidity"
      t.float "voltageBattery"
      t.float "absolutePressure"
      t.float "relativePressure"
      t.float "dewPoint"  
      t.float "heatIndex"
      t.string "zambrettisWords"
      t.integer "accuracyInPercents"
      t.string "tendInWords"
      t.float "dewPointSpread"
      t.timestamps
    end
  end
end
