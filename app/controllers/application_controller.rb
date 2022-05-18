class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    user_path(current_user)
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end

  def ensure_user
    if current_user.id != params[:id].to_i
      flash[:alert] = "The account is different."
      redirect_to user_path(current_user)
    end
  end

  def ensure_books_user
    book = Book.find(params[:id])
    if current_user.id != book.user_id
      flash[:alert] = "The account is different."
      redirect_to books_path
    end
  end

end
