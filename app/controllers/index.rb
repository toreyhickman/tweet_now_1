before do
  @message = nil
  @tweet = nil
end

get '/' do
  erb :index
end

post '/' do
  Twitter.update(params[:tweet_text])
  return "Your tweet, \"#{params[:tweet_text]}\" has been tweeted."
end
