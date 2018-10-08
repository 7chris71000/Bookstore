class AddUrlToToys < ActiveRecord::Migration[5.2]
  def up

  	add_column(:toys,:image_url,:string)

  end

  def down
  
  	remove_column(:toys,:image_url)


  end

end
