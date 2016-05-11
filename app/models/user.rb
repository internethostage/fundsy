class User < ActiveRecord::Base
    has_secure_password
    # Uncomment line below to make user signup with invalid data test fail
    # attr_accessor :password, :password_confirmation
    has_many :pledges, dependent: :nullify
    has_many :campaigns, dependent: :nullify

    # Comment lines below to make user signup with invalid data test fail
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true

    before_create :generate_api_key

    def full_name
      "#{first_name} #{last_name}"
    end

    private

    def generate_api_key
      begin
        self.api_key = SecureRandom.hex(32)
      end while User.exists?(api_key: api_key)
    end

end
