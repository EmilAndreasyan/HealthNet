class Disease < ActiveRecord::Base
    has_many :patients
end