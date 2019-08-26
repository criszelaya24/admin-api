class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    has_many :time_records, dependent: :delete_all
    def to_token_payload
        {
            sub: id,
            email: email
        }
    end
end
