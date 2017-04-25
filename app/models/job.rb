class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_upper_bound, presence: true
  validates :require_num, presence: true
  validates :contact_email, presence: true
  validates :job_class, presence: true
  validates :wage_lower_bound, numericality: {greater_than: 0}
  validates :wage_upper_bound, numericality: {greater_than: 0}
  validates :wage_upper_bound, numericality: {greater_than: :wage_lower_bound}


  scope :published, -> {where(is_hidden: false)}

  def publish!
    self.is_hidden = false
    self.publish_at = Time.new
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
