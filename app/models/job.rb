class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, :category, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.group_by_city
    group_by(:city).sort.to_h
  end

  def self.group_by_interest
    collection = group_by(:level_of_interest).sort.reverse.to_h
    tag_keys(collection)
  end
private
    def self.group_by(key_sym)
      Job.distinct.pluck(key_sym).map do |key|
        {key => Job.where("#{key_sym.to_s} = ?", key)}
      end.inject(:merge)
    end

    def self.tag_keys(hash)
      hash.transform_keys{ |key| "Interest Level #{key}" }
    end
end
