class People < ActiveRecord::Base
   def full_name
     return first_name + " " + last_name
   end
  def describe
    return "#{first_name} #{last_name} is #{age} year old and is #{hair_color}"
  end
end
