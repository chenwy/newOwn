class Job < ApplicationRecord

  #校验规则
  validates :title, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_upper_bound, presence: true
  validates :require_num, presence: true
  validates :contact_email, presence: true
  validates :job_class, presence: true
  validates :wage_lower_bound, numericality: {greater_than: 0}
  validates :wage_upper_bound, numericality: {greater_than: 0}
  validates :wage_upper_bound, numericality: {greater_than: :wage_lower_bound}

  #
  scope :published, -> {where(is_hidden: false)}

  #映射关系
  has_many :resumes

  #方法

  #发布招聘信息
  def publish!
    self.is_hidden = false
    self.publish_at = Time.new
    self.save
  end

  #隐藏招聘信息
  def hide!
    self.is_hidden = true
    self.save
  end
end
