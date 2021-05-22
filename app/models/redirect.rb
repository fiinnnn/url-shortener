# frozen_string_literal: true

class Redirect < ApplicationRecord
  validates :source, presence: true, uniqueness: true
  validates :target, presence: true, uniqueness: true
end
