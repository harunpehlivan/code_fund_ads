class ReferralsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def new
    session[:referral_code] = params[:referral_code]
    IncrementReferralLinkClickCountJob.perform_later session[:referral_code]
    redirect_to publishers_path
  end
end
