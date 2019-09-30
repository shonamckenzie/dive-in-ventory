require 'rubygems'
require 'bundler/setup'

require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require( 'pry-byebug' )
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
get '/manufacturers/:id/edit' do
  @manufacturer = Manufacturer.find( params[:id] )
  erb( :"/manufacturers/edit")
end

# update
post '/manufacturers/:id' do
  Manufacturer.new( params ).update
  redirect to '/manufacturers'
end
# delete
post '/manufacturers/:id/delete' do
  manufacturer = Manufacturer.find( params[:id] )
  manufacturer.delete()
  redirect to '/manufacturers'
end
