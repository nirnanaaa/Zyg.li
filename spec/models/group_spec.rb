# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  automatic  :boolean          default(FALSE), not null
#  name       :string(255)      not null
#  user_count :integer          default(0), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Group do
  pending "add some examples to (or delete) #{__FILE__}"
end
