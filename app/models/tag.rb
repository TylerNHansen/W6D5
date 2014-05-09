# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  has_many :secret_tags
  has_many(
    :secrets,
    through: :secret_tags,
    source: :secret
  )

  def to_s
    self.body
  end
end
