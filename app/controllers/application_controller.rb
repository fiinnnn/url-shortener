# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActionController::ParameterMissing do |e|
    head :bad_request
  end
end
