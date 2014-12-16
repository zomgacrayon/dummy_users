enable :sessions

def login?
  if session[:user]
    return true
      else
    return false
  end
end

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/signup' do
  erb :index
end

post '/signup' do
  puts "================================================"
  puts params

  User.create(email: params[:email], password: params[:password])

  redirect '/'
end

get '/login' do
  erb :index
end

post '/login' do
 if @user = User.authenthicate(params[:user][:email], params[:user][password])
  session[:email] = @user.email
  redirect to ('/home')
end
end

post '/home' do
    if login?
    end
  erb :home
end

get '/error_page' do
  erb :error_page
end