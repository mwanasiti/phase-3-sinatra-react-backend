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
      image_url: params[:image_url]
      name: params[:name],
    )
    send.to_json
  end

  post '/courses' do
    send = Course.create(
      name: params[:name],
      lecturer_id: params[:lecturer_id],
      student_id: params[:student_id]
    )
    send.to_json
  end
  

  #patch
  put '/students/:id' do
    fix = Student.find(params[:id])
    fix.update(
      name: params[:name],
      lecturer_id: params[lecturer_id],
      course_id: params[course_id]
    )
    fix.to_json
  end

  put '/lecturers/:id' do
    fix = Lecturer.find(params[:id])
    fix.update(
      name: params[:name],
      course: params[:course]
    )
    fix.to_json
  end

  put '/courses/:id' do
    fix = Course.find(params[:id])
    fix.update(
      name: params[:name],
      lecturer_id: params[lecturer_id],
      student_id: params[student_id],
    )
    fix.to_json
  end
  
  #delete
  delete '/students/:id' do
    deleted = Student.find(params[:id])
    deleted.destroy
    deleted.to_json
  end

  delete '/lecturers/:id' do
    deleted = Lecturer.find(params[:id])
    deleted.destroy
    deleted.to_json
  end

  delete '/courses/:id' do
    deleted = Course.find(params[:id])
    deleted.destroy
    deleted.to_json
  end
end




