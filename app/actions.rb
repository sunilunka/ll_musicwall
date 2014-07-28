# Homepage (Root path)
get '/' do
  erb :index
end

get '/upload' do
  erb :'upload/index'
end
