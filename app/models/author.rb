class Author < ActiveRecord::Base
    has_many :courses
    has_many :topics, through: :courses
end