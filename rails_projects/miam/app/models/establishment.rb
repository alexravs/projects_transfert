class Establishment < ActiveRecord::Base
  belongs_to :city
  has_many :reviews
  has_many :visits
  has_many :users, :through => :visits
  
  has_attached_file :logo, :styles => { :medium => "300x300>", :small => "150x150>", :exsmall => "50x50>" }, :url  => "/assets/users/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png']
  
  def score
    total_score = 0
    counter = 0
    self.reviews.each do |review|
      total_score = total_score + review.rate
      counter = counter + 1
    end
    if total_score != 0 and counter != 00
      score_to_return = total_score / counter
    else
      score_to_return = nil
    end
    score_to_return
  end
  
  def has_been_visited_by(follower)
    result = false
    if self.users.include?(follower).!()
      self.users.push(follower)
      result = true
    end
    result
  end
end