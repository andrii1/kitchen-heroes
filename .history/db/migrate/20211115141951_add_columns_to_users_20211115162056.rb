class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    first_name: string,
    last_name: string
    owner: boolean
  end
end
