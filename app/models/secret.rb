# == Schema Information
#
# Table name: secrets
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  author_id    :integer          not null
#  recipient_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Secret < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  belongs_to :recipient, :class_name => "User"

  has_many :secret_tags
  has_many(
    :tags,
    through: :secret_tags,
    source: :tag
  )

  validates :author_id, :recipient_id, :title, :presence => true


end
