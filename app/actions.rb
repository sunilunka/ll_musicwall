# Homepage (Root path)
get '/' do
  @songs = Song.all
  @songs_ordered = @songs.sort_by{ |song| song.upvotes.count}.reverse 
  erb :index
 
end

post '/index' do
  @voted = Upvote.where("song_id = ? AND user_id = ?", params[:song_id],  session['user'][0].id)

  if @voted[0].nil?
    @upvote = Upvote.create(song_id: params[:song_id], user_id: session['user'][0].id)
    @message = "Great, you vote has been added!"
    erb :index
  else
    @message = "Sorry, you've already voted for this song!"
    erb :index
  end
end  

get '/upload' do
  @song = Song.new
  erb :'upload/index'
end

post '/upload' do
  @song = Song.new(
      songtitle: params[:songtitle],
      author: params[:author],
      url: params[:url],
      user_id: session['user'][0].id
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

get '/upvote' do
  erb :'/upvote/index'
end

# post '/upvote' do
#   @upvote = Upvote.create(song_id: params[:song_id], user_id: session['user'][0].id)
#   erb :'/upvote/index'
# end


