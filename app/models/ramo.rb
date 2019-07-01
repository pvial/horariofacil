# == Schema Information
#
# Table name: ramos
#
#  id         :integer          not null, primary key
#  nombre     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ramo < ApplicationRecord
has_many :asignaturas, :dependent => :destroy
has_many :requerimientos, :dependent => :destroy

end
