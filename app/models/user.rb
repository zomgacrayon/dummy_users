class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  # e.g., User.authenticate('josh@codedivision.com', 'apples123')
  def self.authenticate(email, password)
    user = User.find_by_email(email)

    if user && user.password == password
      return user
    end

    return nil
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
  end
end