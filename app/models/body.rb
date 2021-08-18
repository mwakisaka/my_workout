class Body < ApplicationRecord
  validates :weight, {presence: true}
  validates :user_id, {presence: true}
  validates :start_time, {presence: true}
end
