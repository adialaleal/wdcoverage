class CreateToners < ActiveRecord::Migration[5.2]
  def change
    create_table :toners do |t|
      t.string :client
      t.string :device
      t.string :serial_number
      t.string :part_number
      t.string :tcolor
      t.integer :tyield
      t.integer :count_ini
      t.integer :count_end
      t.float :nvl_ini
      t.float :nvl_end
      t.date :date_in
      t.date :date_out

      t.timestamps
    end
  end
end
