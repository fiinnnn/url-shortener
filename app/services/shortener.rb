# frozen_string_literal: true

class Shortener
  def self.call(target, source = '')
    # return existing shortened link if it already exists and no custom source
    # was specified
    if source.blank?
      link = Link.find_by(target: target)
      return link if link
    end

    # create new shortened link otherwise
    source = source.presence || SecureRandom.urlsafe_base64(6)
    Link.new(source: source, target: target)
  end
end
