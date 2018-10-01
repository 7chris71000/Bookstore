class FixPassColumn < ActiveRecord::Migration[5.2]
  def up

  	rename_column :users, :pass, :password

  end

  def down
  
  	rename_column :users, :password, :pass

  end

end
