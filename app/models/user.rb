# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# The attr_accessor :name, :email is all done by ActiveRecord by looking at the
# columns in the Users table in the database.

class User < ActiveRecord::Base
  attr_accessible :name, :email
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name,  :presence => true,
                    :length   => { :maximum => 200 }
                    
  validates :email, :presence   => true,
                    :format     => { :with => email_regex},
                    :uniqueness => { :case_sensitive => false }
end
