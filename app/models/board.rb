class Board < ApplicationRecord
  belongs_to :user, optional: true
  has_many :tasks, dependent: :destroy
end
