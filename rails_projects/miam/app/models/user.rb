class User < ActiveRecord::Base
  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password

  
  has_many :reviews
  has_many :user_followings, :foreign_key => :user_a_id, :dependent => :destroy
  has_many(:reverse_user_followings, :class_name => :UserFollowing,
      :foreign_key => :user_b_id, :dependent => :destroy)  
  has_many :users, :through => :user_followings, :source => :user_b
  has_many :visits
  has_many :establishments, :through => :visits
  
  has_attached_file :avatar,:styles => { :small => "150x150>", :exsmall => "50x50>" }, :url  => "/assets/users/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  
  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
  def self.authenticate(email, password)
  end
  
  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def is_a_follower?(other_user)
    self.users.include?(other_user)
  end
  def starts_to_be_followed_by(follower)
    result = false
    if self.users.include?(follower).!()
      self.users.push(follower)
      result = true
    end
    result
  end
  
end