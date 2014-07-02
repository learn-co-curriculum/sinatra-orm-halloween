class KidsController < HalloweenController

  get '/kids' do 
    @kids = Kid.all
    erb :'kids/index'
  end

  get '/kids/new' do
    @kid = Kid.new
    erb :'kids/new'
  end

  post '/kids' do
    @kid = Kid.create(params[:kid])
    @kid.bucket = Bucket.new
    redirect "/kids/#{@kid.id}"
  end

  get '/kids/:id' do
    @kid = Kid.find_by(:id => params[:id])
    erb :'kids/show'
  end

  post '/kids/:id/pig-out' do 
    @kid = Kid.find_by(:id => params[:id])
    @message = @kid.pig_out(params[:consumption].to_i)
    redirect "/kids/#{@kid.id}"
  end
end