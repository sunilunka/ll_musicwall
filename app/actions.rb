# Homepage (Root path)
get '/' do
  erb :index
end

get '/upload' do
  @song = Song.new
  erb :'upload/index'
end

post '/upload' do
  @song = Song.new(
      songtitle: params[:songtitle],
      author: params[:author],
      url: params[:url]
    )
  if @song.save
    redirect '/'
  else
    erb :'upload/index'
  end
end

get '/user' do
  @user = User.new
  erb :'user/index'
end

post '/user' do
  @user = User.new(
    username: params[:username], 
    email: params[:email],
    password: params[:password]

    )
  if @user.save
    redirect '/'
  else
    erb :'user/index'
  end
end

get '/user/login' do
  erb :'user/login'
end

post '/user/login' do
  @user = User.where(email: params[:email], password: params[:password])
    if @user[0].nil?
      erb :'user/login'
    else
      session['user'] = @user
      redirect '/'
    end
end

get '/user/logout' do
  session.clear
  redirect '/'
end

