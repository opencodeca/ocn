xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title  "OCN Récent"
    xml.description "OCN Récent"
    xml.link newest_app_posts_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link app_post_url(post)
        xml.guid app_post_url(post)
      end
    end
  end
end