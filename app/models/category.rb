class Category < ActiveRecord::Base
    has_many :jobs
    validates :title, uniqueness: :true
end