require 'rubygems'
require 'bundler/setup'

require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require( 'pry-byebug' )
require_relative('../models/product')
require_relative('../models/manufacturer')
also_reload( '../models/*' )

# index
get '/products' do
  @products = Product.all()
  @all_products = @products
  @manufacturers = Manufacturer.all()
  erb( :"/products/index" )
end

# new
get '/products/new' do
  @manufacturers = Manufacturer.all()
  erb( :'/products/new')
end

# this is not a restful route, should be able to merge and use conditional clause with the main products view
get '/products/filter' do
  @all_products = Product.all
  @products = Product.filter_by_description( params[:description])
  erb( :'/products/index')
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
  redirect to '/products'
end
# delete
post '/products/:id/delete' do
  product = Product.find( params[:id] )
  product.delete()
  redirect to '/products'
end
