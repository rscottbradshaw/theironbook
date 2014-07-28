class AuthenticationsController < Devise::OmniauthCallbacksController
  respond_to :json
  def index
    @authentications = current_user.authentications if current_user
    render :json =>  @authentications
  end

  def all
    omniauth = request.env['omniauth.auth']['credentials']
    auth = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])

    if auth
      # if a the above auth method finds a user with a matching provider and uid
      # that user will be signed in.
      flash[:notice] = "Authentication Success"
      sign_in_and_redirect(:user, auth.user)
    elsif current_user
      # if a user is already logged in and the authentication does not exist,
      # an authentication is added to the current_user.
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication Successful"
      redirect_to authentications_path
    else
      user = User.new
      #TODO find better practice for extracting user info from twitter
      user.apply_omniauth(omniauth)

      if user.save
        flash[:notice] = "Sign in successfull"
        sign_in_and_redirect(:user, auth.user)
      else
        session['devise.user_attributes'] = user.attributes
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end

    end

  end
  alias_method :twitter, :all


  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    respond_to do |format|
      format.html { redirect_to authentications_url, notice: 'Authentication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
