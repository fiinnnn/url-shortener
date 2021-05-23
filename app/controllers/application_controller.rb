# frozen_string_literal: true

#:nodoc:
class ApplicationController < ActionController::Base
  rescue_from ActionController::ParameterMissing do |_e|
    head :bad_request
  end
end
