class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :board, optional: true
end
