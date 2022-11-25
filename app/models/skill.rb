class Skill < ApplicationRecord
  validates :label, presence: true
  validates :value, presence: true, uniqueness: true
end
