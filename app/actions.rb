# Homepage (Root path)
helpers do
  def current_user
    @user = Account.find(session[:account_id]) if session[:account_id]
  end
end

get '/' do
  'You are home.'
end

get '/tracks' do
  @tracks = Track.all
  erb :index
end

get '/login' do
  erb :'sessions/new'
end

post '/login' do
  @user = Account.where(password: params[:password], email: params[:email]).first
  if @user
    session[:account_id]=@user.id
    redirect '/tracks'
  else
    erb :'sessions/new'
  end
end

get '/logout' do
  session[:account_id] = nil
  redirect '/tracks'
end

get '/accounts/new' do
  erb :'accounts/new'
end

post '/accounts' do
  if params[:password] == params[:confirmation]
    @account = Account.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
      )
    if @account.save
      session[:account_id] = @account.id
      redirect '/tracks'
    else
      erb :'accounts/new'
    end
  else
    redirect '/'
  end

end

post '/tracks/:id/votes' do
  @track = Track.find(params[:id]).id
  @user_id = session[:account_id]
  @vote = Vote.new(
    vote: params[:vote].to_i,
    track_id: @track,
    account_id: @user_id
    )
  @vote.save
end

post '/tracks' do
  @track = Track.new(
    url: params[:url],
    title: params[:title],
    author:  params[:author],
    account_id: session[:account_id]
  )
  if @track.save
    
    redirect '/tracks'
  else
    redirect '/tracks'
  end
end

get '/tracks/new' do
  erb :new

end

get 'tracks/:id' do #tracks/7 
  #id = params[:id] 
  #@track = Track.find(id)
  @track = Track.find(params[:id])
end




