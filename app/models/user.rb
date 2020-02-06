class User < ActiveRecord::Base
    has_secure_password
    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true
    has_many :patients
    has_many :diseases, through: :patients
    has_many :drugs, through: :patients


#     attr_accessor :password
#   EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
#   validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
#   validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
#   validates :password, :confirmation => true #password_confirmation attr
#   validates_length_of :password, :in => 6..20, :on => :create
    # validates :first_name, length: {min: 5}
    # validates :last_name, length: {max: 5}
    # validates :password, length: {in: 6..20}   // range 
    # validates :registration_nimber, length: {is: 6} // exact length
    # validates :not_a_robot, acceptance: true, message: "Humans only"
end