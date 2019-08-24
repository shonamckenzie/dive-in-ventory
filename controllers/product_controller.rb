require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/product')
require_relative('../models/manufacturer')
also_reload( '../models/*' )

# index
get '/products' do
  @products = Product.all()
  @manufacturers = Manufacturer.all()
  erb( :"/products/index" )
end

# show

# new

# create

# edit

# update

# delete
