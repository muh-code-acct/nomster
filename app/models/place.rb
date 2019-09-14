class Place < ApplicationRecord
    belongs_to :user
    geocoded_by :address
    after_validation :geocode
    
    validates :name, presence: true, length: { minimum: 3}
    validates_presence_of :address, :description
    
end
