class App < Sinatra::Application
  get "/" do
    haml :index#, locals: {msg: MyModel.new.hello(params[:name])} 
  end

  get "/receipts" do
  end
end
