class ApartmentsController < ApplicationController
  # add controller methods
  set :views, 'app/views/apartments'

  get '/apartments' do
    @apartments = Apartment.all
    erb :index
  end

  get '/apartments/new' do
    @tenants = Tenant.all
    erb :new
  end
  
  get '/apartments/:id' do
    @apartment = Apartment.find(params[:id])
    erb :show
  end

  post '/apartments' do
    apartment= Apartment.create(params[:apartment])
    # binding.pry
    # unless params[:apartment][:address].empty?
    #   new_apartment = Apartment.create(params[:apartment])
    #   Apartment.apartment = new_apartment
    # end
    # Apartment.save
    redirect "/apartments/#{apartment.id}"
  end

  patch '/apartments/:id' do
    apartment = Apartment.find(params[:id])
    apartment.update(params[:apartment])
    # unless params[:apartment][:address].empty?
    #   new_apartment = Apartment.create(params[:apartment])
    #   Apartment.update(apartment: new_apartment)
    # end
    redirect "/apartments/#{apartment.id}"
  end

  get '/apartments/:id/edit' do
    @apartment = Apartment.find(params[:id])
    # @apartments = Apartment.all
    #binding.pry
    erb :edit
  end
  
  delete '/apartments/:id' do
    apartment = Apartment.find(params[:id])
    apartment.destroy
    redirect "/apartments"
  end

end
