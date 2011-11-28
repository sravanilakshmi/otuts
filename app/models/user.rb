class User < ActiveRecord::Base
  acts_as_authentic
  validates_presence_of :password, :on => :create
  validates_presence_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_length_of :password, :minimum => 4, :allow_blank => true
  validates_confirmation_of :password
  validates_uniqueness_of :username, :email
end
