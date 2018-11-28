class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :author
      t.integer :star_rating
      t.text :comment
      t.integer :book_id
      t.timestamps
    end
  end
end
