# Homepage
class WelcomeController < ApplicationController
  # No login required here
  # before_filter :require_login, :only => :index

  def index
  end
end
