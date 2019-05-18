module ModelCollector

  def self.models_list
    Rails.application.eager_load!
    #ActiveRecord::Base.descendants
    ApplicationRecord.descendants
  end

  def self.belongs_tos model
    #model.reflect_on_all_associations(:has_many)
    model.reflect_on_all_associations(:belongs_to).map(&:name)
  end

  def self.belongs_tos model
    model.reflect_on_all_associations(:has_many).map(&:name)
  end

  def test_cat
    Types.const_set("CategoryType",
      Class.new(Types::BaseObject)  do
        field :id, Types::BaseObject::ID, null: false
      end
    )
  end
end
