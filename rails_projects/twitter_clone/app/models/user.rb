class User < ActiveRecord::Base
  
  has_many :tweets
  
  has_many :user_followings, :foreign_key => :user_a_id, :dependent => :destroy
  has_many(:reverse_user_followings, :class_name => :UserFollowing,
      :foreign_key => :user_b_id, :dependent => :destroy)  
  has_many :users, :through => :user_followings, :source => :user_b
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
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
  def delete_follower(follower)
     @followed = self
    follower_to_delete = @followed.users.find(follower.id)

    if follower_to_delete
        @followed.users.delete(follower_to_delete)
     end
    #if self.users.include?(follower)
     # self.users.find(follower).destroy
    #end
  end
  
end