class PagesController < ApplicationController
 skip_before_action :authenticate_user!
  # load_and_authorize_resource except: [ :about, :contact]
  def home
  end

  def about
  end

  def contact
  end
end
