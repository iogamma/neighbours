class User < ApplicationRecord
  has_secure_password

  belongs_to :unit
  has_many :meetings
  has_many :notices
  has_many :events
  has_many :assistances

  def self.authenticate_with_credentials(params)
    user = User.arel_table
    email_filtered = params[:email].strip
    #prepend('%').concat('%')
    @user = User.where(user[:email].matches(email_filtered))[0]
    if @user && @user.authenticate(params[:password])
      return @user
    else
      return nil
    end
  end

end
