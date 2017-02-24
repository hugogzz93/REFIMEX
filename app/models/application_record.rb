class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.by_date(date, scope)
    where(created_at: date.method("beginning_of_#{scope}").call..
                      date.method("end_of_#{scope}").call)
  end
end
