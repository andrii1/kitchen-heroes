class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.string :first_name, :last_name
      t.boolean :owner
    end
  end
end
