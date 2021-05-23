# frozen_string_literal: true

# Shortener service
#
# Takes a target and optional source and creates a link from the source to the
# target.
# The created link is not automatically inserted into the database.
class Shortener
  def self.call(target, source = '')
    # return existing shortened link if it already exists and no custom source
    # was specified
    if source.blank?
      link = Link.find_by(target: target)
      return link if link
    end

    # create new shortened link otherwise
    Link.new(source: source, target: target)
  end
end
