class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy
  
  
  def average_loi
    jobs.average(:level_of_interest).to_i
  end

  def self.rank_by_interest
   Job.joins(:company)
      .group(:company)
      .average(:level_of_interest)
      .transform_values{|v| v.to_i}
      .sort_by{|k, v| v}.pop(3).to_h 
  end
end
