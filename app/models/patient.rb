class Patient < ActiveRecord::Base
    belongs_to :disease
    belongs_to :user
    has_many :drugs
    validates_presence_of :name, :gender, :age, :condition
    # has_nested_attributes_for :drugs
end