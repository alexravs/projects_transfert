class Region < ActiveRecord::Base
  has_many :sightings
  
  validates :name, :presence => true
  validates :country, :presence => true
  validates :zipcode, :presence => true
  
  def getAnimalsAndSightings 
    result = []
    self.sightings.each do |t|
      result.push({ :species_name => t.species.name, :sighting => t })
    end
    result
  end
   
  scope :animalsAndSightings, lambda { |region_id|
    result = []
    region = where({:id => region_id})
    region[0].sightings.each do |t|
      result.push({ :species_name => t.species.name, :sighting => t })
    end
    result
    }
end