# frozen_string_literal: true

class RedirectController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def show
    link = Link.find_by!(source: params[:source])
    redirect_to link.target
  end

  private

  def render_not_found
    render 'not_found', status: :not_found
  end
end
