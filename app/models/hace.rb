# == Schema Information
#
# Table name: haces
#
#  id          :integer          not null, primary key
#  profesor_id :integer
#  nivel_id    :integer
#  hace        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Hace < ApplicationRecord
    belongs_to :profesor
    belongs_to :nivel
end
