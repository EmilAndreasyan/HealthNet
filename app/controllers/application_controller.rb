# ApplicationController
# =====================
#  - Represents the top-level controller for our application
#  - A controller will **inherit** from Sinatra::Base
class ApplicationController < Sinatra::Base

    # Since we are writing a non-standard Sinatra application
    # (a.k.a. we are writing it with folders and a modular pattern),
    # we need to say where the root is and where the app is supposed
    # to find its views.
    set :root, File.join(File.dirname(__FILE__), '..')
    set :views, File.join(root, "views")
    set :method_override, true

    get '/' do 
        erb :home
    end

    configure do
        enable :sessions
        set :session_secret, "enigma"
    end

    get '/users/:id/index' do
        @user = User.find_by(id: params[:id])
        erb :'users/index'
    end

    helpers do
        def logged_in?
            # !!session[:email] # double negation converts an object from its actual value to binary value of true or false
            !!current_user
        end

        def current_user
            # @user ||= User.find_by_id(session[:user_id])
            User.find_by(id: session[:user_id])
        end

        # this method wasn't used elsewhere
        def login(email, password)
            @user = User.find_by(:email => "email")
            if @user && @user.authenticate(password)
                session[:email] = @user.email
            else
                redirect '/login'
            end
            session[:email] = email
        end

        def require_login
            unless logged_in?
                redirect '/login'
            end
        end

        def logout
            session.clear
            redirect "/"
        end
    end
  end