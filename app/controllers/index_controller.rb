require 'sinatra'


get '/:my_birthdate' do
    setup_index_view
end

get '/message/:number' do
    number = params[:number].to_i
    @message = Person.message_to(number)
    erb :index
end

get '/' do
    erb :form
end

post '/' do
    my_birthdate = params[:my_birthdate]#.gsub("-", "")
    if Person.valid_birthdate(my_birthdate)
        number = Person.get_number(my_birthdate)
    redirect "/message/#{number}"
    else
        @error = "Oops! You should enter a valid birthdate in the form of mmddyyyy. Try again!"
        erb :form
    end
end

helpers do
def setup_index_view
    my_birthdate = params[:my_birthdate]
    @number = Person.get_number(my_birthdate)
    @message = Person.message_to(@number)
    erb :index
end
end





