# == Schema Information
#
# Table name: musts
#
#  id          :integer          not null, primary key
#  curso_id    :integer
#  profesor_id :integer
#  creador     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Must < ApplicationRecord
    belongs_to :profesor
    belongs_to :curso
end
