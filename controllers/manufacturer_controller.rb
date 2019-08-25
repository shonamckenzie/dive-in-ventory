require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/product')
require_relative('../models/manufacturer')
also_reload( '../models/*' )

# index
get '/manufacturers' do
  @manufacturers = Manufacturer.all()
  erb( :"/manufacturers/index" )
end

# new
get '/manufacturers/new' do
  erb( :"/manufacturers/new")
end

# show
get '/manufacturers/:id' do
  @manufacturer = Manufacturer.find( params[:id] )
  erb( :"/manufacturers/show")
end

# create
post '/manufacturers' do
  @manufacturer = Manufacturer.new( params )
  @manufacturer.save()
  erb( :"/manufacturers/create" )
end

# edit

# update

# delete
