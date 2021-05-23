# frozen_string_literal: true

# Link from a shortened source to the original target
class Link < ApplicationRecord
  validates :source, presence: true, uniqueness: true
  validates :target, presence: true, url: true

  before_validation :generate_source

  def generate_source
    self.source = SecureRandom.urlsafe_base64(6) if source.blank?
  end
end
