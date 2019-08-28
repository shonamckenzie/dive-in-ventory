require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/product')
require_relative('../models/manufacturer')
also_reload( '../models/*' )

# index
get '/inventory' do
  @products = Product.all()
  @manufacturers = Manufacturer.all()
  @pdesc = []
  @products.each do |product|
    @pdesc << product.description
  end
  @pdesc.uniq!
  erb( :"/products/index" )
end

# new
get '/products/new' do
  @manufacturers = Manufacturer.all()
  erb( :'/products/new')
end

get '/products/filter' do
  @products = Product.all()
  erb( :'/products/filter')
end

# show
get '/products/:id' do
  @product = Product.find( params[:id] )
  @manufacturer = Manufacturer.all()
  erb( :'/products/show')
end

# create
post '/products' do
  @product = Product.new( params )
  @product.save()
  erb( :'/products/create')
end
# edit
get '/products/:id/edit' do
  @product = Product.find( params[:id] )
  @manufacturer = Manufacturer.all()
  erb( :'/products/edit')
end
# update
post '/products/:id' do
  Product.new( params ).update
  redirect to '/inventory'
end
# delete
post '/products/:id/delete' do
  product = Product.find( params[:id] )
  product.delete()
  redirect to '/inventory'
end
