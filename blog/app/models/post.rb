class Post < ApplicationRecord
	validates :title, presence: true,
                    length: { in: 15..75 } 
    validates_uniqueness_of :title, :case_sensitive => false
                    
end

	