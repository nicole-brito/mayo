class User < ApplicationRecord
    has_secure_password
    has_many :articles

    validates :password, presence: true, confirmation: true, length: { minimum: 8 }
    validate :password_complexity

    private
    def password_complexity
        if password.present? && !password.match(/(?=.*[A-Z])(?=.*\d)/)
            errors.add :password, 'Your password must include at least one uppercase letter and one digit'
        end
    end
end
