# frozen_string_literal: true

class Account < ApplicationRecord
  include Rodauth::Rails.model
  enum :status, unverified: 1, verified: 2, closed: 3

  has_many :posts, dependent: :destroy
  has_one :profile, dependent: :destroy
end
