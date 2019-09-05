class Question < ApplicationRecord
    has_many :comments, as: :commentable, dependent: :destroy

    validates :title, presence: true, allow_blank: false
end
