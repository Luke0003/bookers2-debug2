class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :enrties, dependent: :destroy
end
