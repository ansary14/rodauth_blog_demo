# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :account
end
