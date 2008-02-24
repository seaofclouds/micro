atom_feed(:authorurl => formatted_post_comments_url(:atom)) do |feed|
  feed.title title
  feed.updated((@posts.first.created_at))
  
  for comment in @comments
    feed.entry(comment) do |entry|
      entry.title([@post.title])
      entry.content(comment.body, :type => "html")
      entry.author do |author|
        author.author(comment.author)
      end
    end
  end
end