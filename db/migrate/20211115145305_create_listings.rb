class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :location
      t.date :availability

      t.timestamps
    end
  end
end
