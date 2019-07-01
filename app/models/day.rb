# == Schema Information
#
# Table name: days
#
#  id         :integer          not null, primary key
#  nombre     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Day < ApplicationRecord
    has_many :modulos, :foreign_key => "dia_id"
    has_many :hora_lectivas, :foreign_key => "dia_id", :dependent => :destroy
end
