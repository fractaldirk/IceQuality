class Milestone < ActiveRecord::Base
  belongs_to :employee
  attr_accessible :accepted_entries, :cost, :entries_entered, :payment, :status,
                  :title, :total_entries, :employee_id

  include ActionView::Helpers::NumberHelper

  def percentage_done
    a = entries_entered.to_f
    b = total_entries.to_f
    c = a / b
    d = c * 100
    d
  end
  def percentage_accepted
    a = accepted_entries.to_f
    b = entries_entered.to_f
    c = a / b
    d = c * 100
    d
  end
  def currently_earned
    a = cost.to_f
    b = accepted_entries.to_f
    c = a * b
    d = "#{number_to_currency(c)}"
  end
  def status_output
    if status == 1
      "Untouched"
    elsif status == 2
      "In progress"
    elsif status == 3
      "Finished"
    else
      "Untouched"
    end
  end
end
