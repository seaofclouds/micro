atom_feed(:url => formatted_posts_url(:atom)) do |feed|
  feed.title title
  feed.updated((@posts.first.created_at))
  
  for post in @posts
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content("#{post.excerpt} #{post.body}", :type => "html")
      entry.author do |author|
        author.author(post.author)
      end
    end
  end
end