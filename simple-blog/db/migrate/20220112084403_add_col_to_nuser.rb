class AddColToNuser < ActiveRecord::Migration[5.2]
  def change
    add_column :nusers, :password_digest, :string
    remove_column :nusers , :password
  end
end
