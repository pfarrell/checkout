class App < Sinatra::Application
  get '/reports' do
    haml :reports
  end

  get '/reports/items' do
    props={}
    props["Item ID"]= lambda{|x| x.item.item_id} 
    props["Item Description"] = lambda{|x| x.item.name} 
    props["Purchaser ID"]= lambda{|x| x.bidder.bidder_id} 
    props["Purchaser"]= lambda{|x| x.bidder.name} 
    props["Price"]= lambda{|x| x.purchase_price} 

    data=Purchase.all
    total=data.inject(0.0){|sum,p| sum + p.price}

    haml :report, locals:{header: props, data: data, total:total }
  end

  get '/reports/bidders' do
    props={}
    props["Bidder ID"]= lambda{|x| x.bidder_id} 
    props["Bidder "] = lambda{|x| x.name} 
    props["Purchases"]= lambda{|x| x.purchases.size} 
    props["Total Price"]= lambda{|x| '%0.2f' % x.purchases.inject(0.0){|sum,p| sum + p.price}} 

    data=Bidder.all
    total='%0.2f' % data.inject(0.0){|sum,b| sum + b.purchases.inject(0.0){|sum2,p| sum2 + p.price}}

    haml :report, locals:{header: props, data: data, total:total }
  end

end

