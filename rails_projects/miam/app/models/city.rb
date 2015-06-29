class City < ActiveRecord::Base
  has_many :establishments
  validates :name, uniqueness: true
  
  def self.searchStartWith(inputSearch)
    result = self.where('LOWER(name) LIKE LOWER(?)',"#{inputSearch}%").limit(10)
    result
  end

end