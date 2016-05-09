class User < ActiveRecord::Base
    has_secure_password
    # Uncomment line below to make user signup with invalid data test fail
    # attr_accessor :password, :password_confirmation
    has_many :pledges, dependent: :nullify

    # Comment lines below to make user signup with invalid data test fail
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true

    def full_name
      "#{first_name} #{last_name}"
    end

end
