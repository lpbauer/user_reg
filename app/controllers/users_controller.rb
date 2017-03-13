class UsersController < ApplicationController
  def index
    #  @user = User.all
  end

  def register
    # creates user for story 3
      @user = User.new
      @user.full_name = params[:full_name]
      @user.address = params[:address]
      @user.city = params[:city]
      @user.state = params[:state]
      @user.zip_code = params[:zip_code]
      @user.country = params[:country]
      @user.email = params[:email]
      @user.user_name = params[:user_name]
      @user.password = params[:password]
      if @user.save
        @phone = Phone.new
        @phone.homephone = params[:homephone]
        @phone.cellphone = params[:cellphone]
        @phone.workphone = params[:workphone]
        @phone.user_id = @user.id
        @phone.save
        # session[:user_id] = @user.id

        # TODO: Change this to redirect to game
        redirect_to '/confirmation'

      else
        # TODO Ask for name (maybe again)
        render text: 'Missing field'
      end
    end

  def confirmation
  end

  def log_in
    #User.find used to find the user in database and allows us to create a condition based on saved data
    @user = User.find_by_user_name(params[:user_name])
    # @phone = Phone.find_by_id(params[:user_name])

    # @user is the found username and is checking is the entered password is the same as the stored password if it is then send to login page
    if @user != nil
      if @user.password == params[:password]
        session[:user_check] = @user.id
        # session[:phone_check] = @phone.id
        redirect_to '/log_in_confirmation'
      end
      else
        redirect_to '/'
    end
  end

  def log_in_confirmation
    @user = User.find(session[:user_check])
    # @phone = Phone.find(session[:phone_check])
  end

end
