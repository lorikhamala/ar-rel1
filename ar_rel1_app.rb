 require "sinatra"
 require "sinatra/reloader"
 require "sinatra/activerecord"
  
set :database, { adapter: "sqlite3", database: "mydb.db" }

require './models/user'
require './models/team'

get '/' do
	@users = User.all
	@teams = Team.all
	erb :admin
end 

get '/viewteams' do
	@users = User.all
	@teams = Team.all
	erb :viewteams
end 

get '/viewusers' do
	@users = User.all
	@teams = Team.all
	erb :viewusers
end 

get '/lookup' do
	@users = User.all
	@teams = Team.all
	erb :lookup
end 

post '/lookupuser' do
	@user = User.find_by(name: params[:name])
	if @user.nil?
		return "Member not found"
	end 
	erb :displayuser 
end

post '/lookupteam' do
	@team = Team.find_by(name: params[:name])
	if @team.nil?
		return "Team not found"
	end 
	erb :displayteam
end

get '/displayuser/:id' do   #this finds the id number of the user
   @user = User.find(params[:id]) #finds the user id that corresponds to that parameter
   if @user.nil?
      return "User not found"
   end 
  
   erb :displayuser
   
end 