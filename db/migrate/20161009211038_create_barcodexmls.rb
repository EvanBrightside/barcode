class CreateBarcodexmls < ActiveRecord::Migration
  def change
    create_table :barcodexmls do |t|
      t.string :title
      t.integer :inn, limit: 8
      t.integer :zipcode
      t.integer :month
      t.integer :start
      t.integer :end

      t.timestamps null: false
    end
    add_attachment :barcodexmls, :xml
  end
end
