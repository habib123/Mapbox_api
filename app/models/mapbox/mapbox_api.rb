class Mapbox::MapboxApi
    include ActiveModel::Model
    attr_accessor :latitude, :longitude, :category
    validates :category, presence: true
    validates :latitude,:longitude, presence: true, numericality: { only_float: true }
end
