# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'date'
class Cat < ApplicationRecord
    COLORS = ['red', 'orange', 'yellow', 'gold', 'white', 'black', 'grey']
    validates :color, inclusion: {in: COLORS}
    validates :sex, inclusion: {in: ['M', 'F']}
    validates :birth_date, :description, :sex, :color, :name, presence: true
    
    has_many :rentals,
    dependent: :destroy
    def age
        Date.today - self.birth_date
    end

    def self.colors
        COLORS
    end
end
