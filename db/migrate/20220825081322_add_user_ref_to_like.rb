class AddUserRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, references: :users, index: true
    add_foreign_key :likes, :users, column: :author_id
  end
end
