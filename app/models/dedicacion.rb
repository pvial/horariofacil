# == Schema Information
#
# Table name: dedicacions
#
#  id            :integer          not null, primary key
#  profesor_id   :integer
#  asignatura_id :integer
#  dedicacion    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Dedicacion < ApplicationRecord
    belongs_to :profesor
    belongs_to :asignatura
end
