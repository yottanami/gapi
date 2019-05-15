module ModelCollector

  def self.models_list
    Rails.application.eager_load!
    #ActiveRecord::Base.descendants
    ApplicationRecord.descendants
  end

end
