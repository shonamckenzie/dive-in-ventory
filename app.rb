require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/manufacturer_controller')
require_relative('controllers/product_controller')

also_reload('./models/*')

get '/' do
  erb( :index )
end
