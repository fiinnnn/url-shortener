# frozen_string_literal: true

class Link < ApplicationRecord
  validates :source, presence: true, uniqueness: true
  validates :target, presence: true
end
