module CommentlikeHelper
  private

  def comment_liked?(comment)
    current_user.comment_like.each do |cl|
      return true if cl.comment.id == comment.id
    end
    false
  end

  def find_commentlike(comment)
    current_user.comment_like.each do |cl|
      return cl if cl.comment == comment
    end
  end
end
