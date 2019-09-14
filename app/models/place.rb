class Place < ApplicationRecord
    belongs_to :user
    validates :name, presence: true, length: { minimum: 3}
    validates_presence_of :address, :description
    
end
