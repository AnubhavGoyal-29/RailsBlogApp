class Nuser < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
end
