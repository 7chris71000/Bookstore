class AddGenderAndPasswordToUsers < ActiveRecord::Migration[5.2]
  def change

  	add_column(:users,:gender,:string)
  	add_column(:users,:pass,:string)


  end
end