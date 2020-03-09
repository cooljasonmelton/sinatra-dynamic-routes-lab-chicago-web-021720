require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end 

  get '/square/:number' do 
    @number = params[:number]
    "#{@number.to_i ** 2}"
  end 

  get '/say/:number/:phrase' do 
    @number = params[:number]
    @phrase = params[:phrase]
    #"#{@number.to_i.times { @phrase }}"
    erb :saynumberphrase
  end 

  get '/say/:word1/:word2/:word3/:word4/:word5' do 
    "#{params[:word1] + " " + params[:word2] + " " + params[:word3] + " " + params[:word4] + " " + params[:word5]}." 
  end 

  get '/:operation/:number1/:number2' do 
    "#{
    case params[:operation] 
    when "add"
      params[:number1].to_i + params[:number2].to_i
    when "subtract"
      params[:number1].to_i - params[:number2].to_i
    when "multiply"
      params[:number1].to_i * params[:number2].to_i
    when "divide"
      params[:number1].to_i / params[:number2].to_i
    end 
    }"

  

  end 

end





# Create a dynamic route at get '/:operation/:number1/:number2' that accepts an operation 
# (add, subtract, multiply or divide) and performs the operation on the two numbers provided,
#  returning a String. For example, going to /add/1/2 should render 3 as a String.