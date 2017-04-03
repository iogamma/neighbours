class User < ApplicationRecord
  has_secure_password

  belongs_to :unit
  has_many :attendees, dependent: :delete_all
  has_many :event_comments, dependent: :delete_all
  has_many :events, dependent: :destroy
  has_many :assistance_comments, dependent: :delete_all
  has_many :assistances, dependent: :destroy
  has_many :votes, dependent: :delete_all

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
      where("lower(last_name) LIKE lower(?) OR lower(first_name) LIKE lower(?)", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
            presence: true,
            format: { without: /\s/ },
            uniqueness: { case_sensitive: false, message: "This email has already been registered!" }
  validates :password,
            presence: true,
            length: { in: 5..20 }

end
