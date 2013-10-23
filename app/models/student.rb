require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, on: :create
  validates_inclusion_of :age, in: 6..99
  validates_format_of :phone, with: /(\D*\d){10}/

  def name
    "#{first_name} #{last_name}"
   end

  def age
   present = DateTime.now
   ((present - self.birthday)/365.25).to_i
  end

end


    # v=Student.new(:first_name => 'Alex', :last_name => 'Froelich', :gender => 'M', :birthday => DateTime.new(1985,8,1))
    # p v.age
    # p v.name