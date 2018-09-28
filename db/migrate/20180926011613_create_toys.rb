class CreateToys < ActiveRecord::Migration[5.2]
  def up
    create_table :toys do |t|

    	t.string :name
    	t.string :manufacturer
    	t.integer :serial_number
    	t.timestamps

    end
  end

  def down
  
  	drop_table :toys

  end

end
