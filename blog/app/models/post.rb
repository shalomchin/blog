class Post < ApplicationRecord
  has_many :comments
  accepts_nested_attributes_for :comments
  validates :title, presence: true,
                    length: { in: 15..75 } 
  validates_uniqueness_of :title, :case_sensitive => false
  validates :author, presence: true,
                    length: { minimum: 5 }
  validates_format_of :author, :with => /[a-z]/   
  validates :text, presence: true,
                    length: { in: 0..2000 }         

end


	