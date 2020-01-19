class User < ActiveRecord::Base
    has_secure_password
    # validates :email, :password_digest, presence: true
    validates_presence_of :first_name, :last_name, :email, :password_digest
    # has_nested_attributes_for :patients, allow_destroy: true
    has_many :patients
    has_many :diseases, through: :patients
    has_many :drugs, through: :patients
end