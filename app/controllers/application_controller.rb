class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  set :protection, :except => [:json_csrf]
  #get
  get '/' do
    "Fem-Pro Database"
  end

  get '/courses/:id' do
    course = Course.find(params[:id])
    course.to_json()
  end

  get "/courses" do
      courses = Course.all   
      courses.to_json
  end

  get "/authors" do
    authors = Author.all   
    authors.to_json
end

  get '/authors/:id' do
    authors = Author.find(params[:id])
    authors.to_json
  end  

  get "/topics" do
    topics = Topic.all   
    topics.to_json
end

  get '/topics/:id' do
    topic = Topic.find(params[:id])
    topic.to_json
  end 

  get '/feedbacks' do
    all_feedback = Feedback.all
    all_feedback.to_json(only: [:id, :name, :rating, :reason, :course_id], 
      include: {course: {only: [:id, :name]}})
  end

  #post
  post '/courses' do
    send = Course.create(
      image_url: params[:image_url],
      name: params[:name],
      topic_id: params[:topic_id],
      author_id: params[:author_id],
      link: params[:link]
    )
    send.to_json
  end

  post '/authors' do
    send = Author.create(
      image_url: params[:image_url],
      name: params[:name],
    )
    send.to_json
  end

  post '/topics' do
    send = Topic.create(
      name: params[:name],
    )
    send.to_json
  end
  
  post '/feedbacks' do
    send = Feedback.create(
      name: params[:name]
      rating: params[:rating]
      reason: params[:reason]
      course_id: params[:course_id]
    )
    send.to_json
  end

  #put
  put '/courses/:id' do
    fix = Course.find(params[:id])
    fix.update(
      image_url: params[:image_url],
      name: params[:name],
      topic_id: params[:topic_id],
      author_id: params[:author_id],
      link: params[:link]
    )
    fix.to_json
  end

  put '/authors/:id' do
    fix = Author.find(params[:id])
    fix.update(
      image_url: params[:image_url],
      name: params[:name],
    )
    fix.to_json
  end

  put '/topics/:id' do
    fix = Topic.find(params[:id])
    fix.update(
      name: params[:name],
    )
    fix.to_json
  end
  
  #delete
  delete '/courses/:id' do
    deleted = Course.find(params[:id])
    deleted.destroy
    deleted.to_json
  end

  delete '/authors/:id' do
    deleted = Author.find(params[:id])
    deleted.destroy
    deleted.to_json
  end

  delete '/topics/:id' do
    deleted = Topic.find(params[:id])
    deleted.destroy
    deleted.to_json
  end
end




