module IssuePatch
  def self.included(base)
    base.send(:include, InstanceMethods)
  end

  module ClassMethods
  end

  module InstanceMethods
    def status_on date

      self.journals.where("created_on > ?", date).order(:created_at => :ASC).each do |journal|
        (value = journal.details.find do |details|
          details.prop_key == "status_id"
        end.try(:old_value)) and return value
      end
      return self.status_id

    end
  end
end