class PagesController < ApplicationController
  
  def adminhome
    if current_user.admin?
      flash[:notice] = "Welcome Mateo!"
    else 
      redirect_to notes_path
      flash[:notice] = 'Access denied'
    end
  end
  
  def wait
  end
  
  def home
  end

  def about
  end
  
  def gettingstarted
  end
  
  private 
  
end
