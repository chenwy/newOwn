class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #校验规则
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  #虚拟属性，可作为用户名或者邮箱进行验证
  attr_accessor :login


  #映射关系
  has_many :resumes
  has_many :companies

  #方法
  def self.find_for_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", {:value => login.downcase}]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end
end
