require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

get '/'  do
  @operator = params[:operator]
  if @operator
    @first = params[:first].to_f
    @second = params[:second].to_f
    
    @result = case @operator
    when '+' then @first + @second
    when '-' then @first - @second
    when '*' then @first * @second
    when '/' then @first / @second
    end
  end
  erb :home
end

get '/power' do
  @result = params[:first].to_f**params[:second].to_f
  erb :power
end 

get '/sqrt' do
  @result = Math.sqrt(params[:number].to_f)
  erb :sqrt
end

get '/trip_calc' do
  @result_hours = params[:distance].to_f/params[:speed].to_f
  @result_cost = (params[:distance].to_f/params[:speed].to_f)*params[:cost].to_f
  erb :trip_calc
end

get '/mortgage' do
  i = params[:interest].to_f / 100
  i /= 12
  x = (1+i)**params[:payments].to_f
  @result = params[:principal].to_f*i*x/(x-1)
  erb :mortgage
end 