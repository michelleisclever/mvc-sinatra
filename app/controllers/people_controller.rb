get '/people' do
    @people = Person.all
    erb :"/people/index"
end
    
get '/people/new' do
    @person = Person.new
    erb :"/people/new"
end

post '/people' do
  if params[:birthdate].include?("-")
    birthdate = params[:birthdate]
  else
    birthdate = Date.strptime(params[:birthdate], "%m%d%Y")
  end
  
  person = Person.create(first_name: params[:first_name], last_name: params[:last_name], birthdate: birthdate)
  if @person.valid?
    @person.save
    redirect "/people/#{@person.id}"
  else
    @person.errors.full_messages.each do |msg|
      @errors = "#{@errors} #{msg}."
    end
    erb :"/people/new"
  end
end

get '/people/:id/edit' do
    @person = Person.find(params[:id])
    erb :"/people/edit"
end

put '/people/:id' do
    #get the record and update the first_name and last_name here...
    @person = Person.find(params[:id])
    @person.first_name = params[:first_name]
    @person.last_name = params[:last_name]
    @person.birthdate = params[:birthdate]
    if @person.valid?
    @person.save
    redirect "/people/#{@person.id}"
    else
        @person.errors.full_messages.each do |msg|
            @errors = "#{@errors} #{msg}."
        end
        erb :"/people/edit"
    end
end

get '/people/:id' do
    @person = Person.find(params[:id])
    birthdate_string = @person.birthdate.strftime("%m%d%Y")
    
    number = Person.get_number(birthdate_string)
    @message = Person.message_to(number)
    
    erb :"/people/show"
end

#this is the route to handle the delete request
delete '/people/:id' do
    person = Person.find(params[:id])
    person.delete
    redirect "/people"
end