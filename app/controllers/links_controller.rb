# frozen_string_literal: true

class LinksController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    link = Shortener.call(link_params[:target], link_params[:source])

    render json: { errors: link.errors }, status: :unprocessable_entity unless link.save

    render json: link, status: :created
  end

  private

  def link_params
    params.require(:link).permit(:target, :source)
  end
end
