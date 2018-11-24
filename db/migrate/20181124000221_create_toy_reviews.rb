class CreateToyReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :toy_reviews do |t|
      t.string :author
      t.integer :star_rating
      t.text :comment
      t.integer :toy_id

      t.timestamps
    end
  end
end
