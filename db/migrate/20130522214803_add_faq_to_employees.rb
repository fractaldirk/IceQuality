class AddFaqToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :faq, :text
  end
end
