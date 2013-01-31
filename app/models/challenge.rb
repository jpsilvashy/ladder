class Challenge < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :owner, :class_name => 'User'

  has_many :challenge_users, :dependent => :destroy

  has_many :users, :through => :challenge_users
end
