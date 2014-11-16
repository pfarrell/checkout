class App < Sinatra::Application
  post '/purchase/new' do
    errors = {}
    errors[:bidder] = "bidder number was empty" if params[:bidder_id].nil? || params[:bidder_id] == ""
    errors[:item] = "item number was empty" if params[:item_id].nil? || params[:item_id] ==""
    errors[:price] = "price was empty" if params[:price].nil? || params[:price] == ""

    b=Bidder.first(bidder_id: "#{params[:bidder_id]}")
    errors["bidder"] = "bidder id #{params[:bidder_id]} does not exist" if b.nil?

    p=Purchase.new
    i=Item.first(item_id: "#{params[:item_id]}")
    if params[:create_item] == "on"
      if i.nil?
        i = Item.new
        i.item_id = params[:item_id]
        i.name = params[:item_name]
        i.save
      else
        errors["item"] = "item id #{params[:item_id]} already exists, cannot override"
      end
    elsif b.nil? || i.nil? || i.purchased?
      errors["item"] = "item id #{params[:item_id]} does not exist" if i.nil?
      errors["item"] = "item id #{params[:item_id]} has already been purchased" if !i.nil? && i.purchased?
    end

    if errors.size>0
      haml :index, locals: {purchases: Purchase.all, errors: errors}
    else
      p.item = i
      p.bidder = b
      p.price = params[:price].gsub('$', '')
      p.save
      redirect("/")
    end
  end

  get '/purchase/:id' do
    haml :purchase, locals: {purchase: Purchase[params[:id]]}
  end

  post '/purchase/:id' do
    p=Purchase[params[:id]]
    b=Bidder.first(bidder_id: "#{params[:bidder_id]}") 
    i=Item.first(item_id: "#{params[:item_id]}")
    if b.nil? || i.nil? || (i.purchased? && p.bidder != b)
      errors = {}
      errors["bidder"] = "bidder id #{params[:bidder_id]} does not exist" if b.nil?
      errors["item"] = "item id #{params[:item_id]} does not exist" if i.nil?
      errors["item"] = "item id #{params[:item_id]} has already been purchased" if i.purchased? && p.bidder != b
      haml :index, locals: {purchases: Purchase.all, error: errors}
    else
      p.item = i
      p.bidder = b
      p.price = params[:price].gsub('$', '')
      p.save
      redirect("/")
    end
  end

  get '/purchase/delete/:id' do
    Purchase[params[:id]].delete
    redirect("/")
  end
end
