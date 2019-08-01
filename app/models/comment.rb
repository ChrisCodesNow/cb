class Comment < ApplicationRecord
    validates :comment, presence: true, length: { minimum: 5 }
end
