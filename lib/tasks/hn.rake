namespace :hn do

  desc 'Import Hacker News frontpage for development'
  task import: :environment do
    result = Unirest.get 'http://api.ihackernews.com/page'

    result.body['items'].each do |post|
      Post.create({
        title: post['title'],
        url: post['url'],
        user_id: User.first.id
      })
    end
  end

end
