class App < Sinatra::Application
  post '/purchase' do
    p=Purchase.new
    b=Bidder.first(bidder_id: "#{params[:bidder_id]}")
    i=Item.first(item_id: "#{params[:item_id]}")
    p.item = i
    p.bidder = b
    p.price = params[:price]
    p.save
    redirect("/")
  end

  get '/purchase/:id' do
    haml :purchase, locals: {purchase: Purchase[params[:id]]}
  end

  post '/purchase/:id' do
    p=Purchase[params[:id]]
    b=Bidder.first(bidder_id: "#{params[:bidder_id]}")
    i=Item.first(item_id: "#{params[:item_id]}")
    p.item = i
    p.bidder = b
    p.price = params[:price]
    p.save
    redirect("/")
  end

  get '/purchase/delete/:id' do
    Purchase[params[:id]].delete
    redirect("/")
  end
end
