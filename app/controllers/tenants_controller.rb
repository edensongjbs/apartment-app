class TenantsController < ApplicationController
  # add controller methods
  set :views, 'app/views/tenants'

  get '/tenants' do
    @tenants = Tenant.all
    erb :index
  end

  get '/tenants/new' do
    @apartments = Apartment.all
    erb :new
  end
  
  get '/tenants/:id' do
    @tenant = Tenant.find(params[:id])
    erb :show
  end

  post '/tenants' do
    tenant= Tenant.new(params[:tenant])
    unless params[:apartment][:address].empty?
      new_apartment = Apartment.create(params[:apartment])
      tenant.apartment = new_apartment
    end
    tenant.save
    redirect "/tenants/#{tenant.id}"
  end

  patch '/tenants/:id' do
    tenant = Tenant.find(params[:id])
    tenant.update(params[:tenant])
    unless params[:apartment][:address].empty?
      new_apartment = Apartment.create(params[:apartment])
      tenant.update(apartment: new_apartment)
    end
    redirect "/tenants/#{tenant.id}"
  end

  get '/tenants/:id/edit' do
    @tenant = Tenant.find(params[:id])
    @apartments = Apartment.all
    #binding.pry
    erb :edit
  end

  delete '/tenants/:id' do
    tenant = Tenant.find(params[:id])
    tenant.destroy
    redirect "/tenants"
  end


end
