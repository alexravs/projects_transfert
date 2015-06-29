class Sighting < ActiveRecord::Base
  belongs_to :species #species même chose au pluriel et singulier avec un s
  belongs_to :region #au singulier car ça n'appartient qu'à UNE seule region
  
  validates :latitude, :presence => true
  validates :longetitude, :presence => true
  validates :date, :presence => true
  
  scope :between, lambda { |first_selected_date, second_selected_date|   
    date_result = where(:date => first_selected_date..second_selected_date)
  }
  
  scope :between_and_located, lambda { |first_selected_date, second_selected_date, region_id|   
    date_result = where(:date => first_selected_date..second_selected_date, :region_id => region_id)
  }
  
  
  
  
  
end