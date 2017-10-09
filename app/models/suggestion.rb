class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :bicycle

  default_scope { order(created_at: :desc) }
end
