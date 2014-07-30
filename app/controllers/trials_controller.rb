class TrialsController < ApplicationController
  before_filter :authenticate_user!, :include_stripe_js

  def include_stripe_js
    @needs_stripe = true
  end

  def index
  end

  def new
  end
  
end
