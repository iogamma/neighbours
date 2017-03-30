class User < ApplicationRecord
  has_secure_password

  belongs_to :unit
  has_many :meetings
  has_many :notices
  has_many :events
  has_many :assistances
  has_many :assistance_comments
  has_many :attendees
  has_many :event_comments
  has_many :votes

  def self.authenticate_with_credentials(email, password)
    user = User.arel_table
    email_filtered = email.strip
    #prepend('%').concat('%')
    @user = User.where(user[:email].matches(email_filtered))[0]
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end

  def self.search(search)
    if search
      where('last_name LIKE ? OR first_name LIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

end
