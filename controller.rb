require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/miniwhizz')
require_relative('./models/house')
also_reload('./models/*')

  get '/mini-whizz' do #index
    @all_students = MiniWhizz.all()
    erb(:index)
  end

  get '/mini-whizz/new' do #new
    erb(:new)
  end

  post '/mini-whizz/' do
    @all_students = MiniWhizz.new(params)
    @all_students.save()
    erb(:create)
  end
