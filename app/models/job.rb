class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, :category, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.group_by_city
    Job.distinct.pluck(:city).map do |city|
      {city => Job.where('city = ?', city)}
    end.inject(:merge).sort_by{|k, v| k}
  end
end
