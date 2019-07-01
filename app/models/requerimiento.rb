# == Schema Information
#
# Table name: requerimientos
#
#  id            :integer          not null, primary key
#  nivel_id      :integer
#  ramo_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  requerimiento :integer
#

class Requerimiento < ApplicationRecord
    belongs_to :ramo
    belongs_to :nivel
end
