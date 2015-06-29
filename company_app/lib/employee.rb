class Employee < ActiveRecord::Base
  belongs_to(:company)
  validates(:username, :presence => true)
  validates(:password, :presence => true)
  has_many(:projects)
end