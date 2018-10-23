class AddPriceToBooks < ActiveRecord::Migration[5.2]

  def up
  	
  	add_column(:books,:price,:decimal)

  end

  def down

  	remove_column(:books,:price)

  end

end