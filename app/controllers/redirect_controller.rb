class RedirectController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def show
    redirect = Redirect.find_by!(source: params[:source])
    redirect_to redirect.target
  end

  private

  def render_not_found
    render 'not_found', :status => :not_found
  end
end
