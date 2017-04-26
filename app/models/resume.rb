class Resume < ApplicationRecord

  #校验规则
  validates :content, presence: true

  #映射关系
  belongs_to :user
  belongs_to :job

  mount_uploader :attachment, AttachmentUploader #Tells rails to user this uploader for this model.
end
