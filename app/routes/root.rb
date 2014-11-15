class App < Sinatra::Application
  get "/" do
    haml :index, locals: {purchases: Purchase.all} 
  end

  get "/receipts" do
  end
end
