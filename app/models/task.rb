class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :board, optional: true
  has_many :comments, dependent: :destroy
end
