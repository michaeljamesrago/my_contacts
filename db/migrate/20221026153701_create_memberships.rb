class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.integer :contact_id
      t.integer :category_id

      t.timestamps
    end

    add_index :memberships, :contact_id
    add_index :memberships, :category_id
    add_index :memberships, [:contact_id, :category_id], unique: true
  end
end
