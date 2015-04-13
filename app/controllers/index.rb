get '/' do
  @all_notes = Note.all
  # don't need this because we made order by default in the model
  # (:order => [ :id.desc ], :limit => 20)
  @only_display = true

  erb :index
end

post '/new' do
  @note = Note.create!(content: params[:content])

  redirect '/'
end

get '/notes/:index/edit' do
  @all_notes = Note.all
  @only_display = false
  @note = @all_notes[params[:index].to_i]
  erb :index
end

put '/notes/:index/edit' do
  @all_notes = Note.all
  @note = @all_notes[params[:index].to_i]

  @note.update(content: params[:content])
  redirect '/'
end

delete '/notes/:index/edit' do
  @all_notes = Note.all
  @note = @all_notes[params[:index].to_i]

  @note.destroy
  redirect '/'
end
