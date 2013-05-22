class AddAboutToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :about, :text
  end
end
