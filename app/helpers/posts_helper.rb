module PostsHelper
  def join_tags(post)
    post.tags.map { |t| t.name }.join(", ")
  end
  
  def join_linkedtag(post)
    taglist =[]
    post.tags.each do |t|
      taglist << '<b>'+t.name+'</b>'
    end
    return taglist.join(", ")
  end
end
