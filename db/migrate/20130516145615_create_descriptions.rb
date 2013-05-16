class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.text :job_description
      t.references :employee

      t.timestamps
    end
    add_index :descriptions, :employee_id
  end
end
