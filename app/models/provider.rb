class Provider < ApplicationRecord
  validates :external_id, :numericality => {:only_integer => true}
  validates :external_id, uniqueness: true
end
