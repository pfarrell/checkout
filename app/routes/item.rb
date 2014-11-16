class App < Sinatra::Application
  get '/items' do
    haml :items, locals: {items: Item.order(:item_id).all}
  end

  post '/item/new' do
    item = Item.new
    item.name = params[:name]
    item.item_id = params[:item_id]
    item.save
    redirect('/items')
  end

  get '/item/:id' do
    haml :item, locals: {item: Item[params[:id]]}
  end

  post '/item/:id' do
    item = Item[params[:id]]
    item.name = params[:name]
    item.item_id = params[:item_id]
    item.save
    redirect('/items')
  end
end
