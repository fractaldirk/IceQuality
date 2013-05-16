class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :employee

      t.timestamps
    end
    add_index :comments, :employee_id
  end
end
