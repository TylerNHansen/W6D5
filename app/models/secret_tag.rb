# == Schema Information
#
# Table name: secret_tags
#
#  id         :integer          not null, primary key
#  secret_id  :integer
#  tag_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class SecretTag < ActiveRecord::Base
  belongs_to :secret
  belongs_to :tag
end
