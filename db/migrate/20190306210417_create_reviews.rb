class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :first_name
      t.string :last_name
      t.string :unit_id
      t.string :description
      t.integer :rating
    end
    add_index :reviews, :unit_id
  end
end
