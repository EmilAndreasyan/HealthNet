class User < ActiveRecord::Base
    has_secure_password
    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true
    has_many :patients
    has_many :diseases, through: :patients
    has_many :drugs, through: :patients
end