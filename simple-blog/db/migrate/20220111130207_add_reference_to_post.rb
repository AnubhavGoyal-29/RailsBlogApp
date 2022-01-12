class AddReferenceToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :comment, :user, foreign_key: true
  end
end
