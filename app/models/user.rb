class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates_presence_of :name

  def first_name
    self.name.split.first.oops
  end

  def last_name
    self.name.split.last
  end
end


# When to use begin-rescue blocks, DEBUGGING last lesson
# def get_facebook_messages
#   begin
#     contacts_fb
#     @messages = retrieves_messages
#   rescue IOError => e
#     flash[:error] = "Error occured contacting facebook #{e}"
#   end
# end
