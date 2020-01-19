class Drug < ActiveRecord::Base
    belongs_to :patient
    validates_presence_of :name, :dosage
end