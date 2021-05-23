# frozen_string_literal: true

class Link < ApplicationRecord
  validates :source, presence: true, uniqueness: true
  validates :target, presence: true, url: true

  before_validation :generate_source

  def generate_source
    self.source = SecureRandom.urlsafe_base64(6) if self.source.blank?
  end
end
