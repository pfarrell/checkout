class App < Sinatra::Application
  get '/bidders' do
    haml :bidders, locals: {bidders: Bidder.all}
  end

  get '/bidder/:id' do
    haml :bidder, locals: {bidder: Bidder[params[:id]]}
  end

  post '/bidder/new' do
    bidder = Bidder.new
    bidder.name=params[:name]
    bidder.bidder_id=params[:bidder_id]
    bidder.save
    redirect "/bidders"
  end

  post '/bidder/:id' do
    bidder = Bidder[params[:id]]
    bidder.name=params[:name]
    bidder.bidder_id=params[:bidder_id]
    bidder.save
    redirect "/bidders"
  end

  get '/bidder/:id/receipt' do
  end
end
