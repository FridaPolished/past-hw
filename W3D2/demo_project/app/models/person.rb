class People < ActiveRecord::Base
    validates :name, presence: true

    belongs_to :house,
    primary_key: :id,
    foregin_key: :house_id,
    class_name: :House
end