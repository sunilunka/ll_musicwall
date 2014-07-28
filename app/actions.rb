# Homepage (Root path)
get '/' do
  erb :index
end

get '/upload' do
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
    erb :'/upload'
  end
end

