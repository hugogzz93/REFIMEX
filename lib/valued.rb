module Valued
  module ClassMethods
    def chart_digest(date, scope)
      objects = by_date(date, scope)
      {
        labels: objects.map { |x| x.labels_helper },
        datasets:[{
          label: label,
          data: objects.map(&:value)
        }]
      }.to_json
    end

    def label
      "must define a label method"
    end

    def labels_helper
      self.created_at.strftime("%d/%m")
    end
  end
  
  module InstanceMethods
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end