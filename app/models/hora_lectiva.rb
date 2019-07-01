# == Schema Information
#
# Table name: hora_lectivas
#
#  id          :integer          not null, primary key
#  dia_id      :integer
#  posicion    :string
#  activo      :boolean
#  profesor_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class HoraLectiva < ApplicationRecord
    belongs_to :profesor
    belongs_to :dia, :class_name => "Day"
end
