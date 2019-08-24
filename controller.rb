require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/product')
require_relative('./models/manufacturer')
also_reload( './models/*' )

# index
get '/manufacturers' do
  @manufacturers = Manufacturer.all()
  erb( :index )
end

# show

# new

# create

# edit

# update

# delete
