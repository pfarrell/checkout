class App < Sinatra::Application
  get "/" do
    haml :index, locals: {purchases: Purchase.order(Sequel.desc(:created_at)).all, errors:{}} 
  end

  get "/receipts" do
  end
end
