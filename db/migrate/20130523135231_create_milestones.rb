class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :title
      t.boolean :payment
      t.integer :total_entries
      t.integer :accepted_entries
      t.decimal :cost
      t.integer :status
      t.integer :entries_entered
      t.references :employee

      t.timestamps
    end
    add_index :milestones, :employee_id
  end
end
