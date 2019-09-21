class Place < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :photos
    
    geocoded_by :address
    after_validation :geocode
    
    validates :name, presence: true, length: { minimum: 3}
    validates_presence_of :address, :description
    
end
