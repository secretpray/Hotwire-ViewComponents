class Message < ApplicationRecord
  validates :body, presence: true, length: { in: 4..200 }
end
