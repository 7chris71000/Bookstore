class AddUrlAndYearToBooks < ActiveRecord::Migration[5.2]
  def up

  	add_column(:books,:image_url,:string)
  	add_column(:books,:published_year,:integer)

  end

  def down
  
  	remove_column(:books,:image_url)
  	remove_column(:books,:published_year)

  end

end