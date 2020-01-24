module CommentlikeHelper

  private

    def comment_liked?(comment)
      current_user.comment_like.each do |pl|
        return true if pl.comment.id == comment.id
      end
      false
    end

    def find_commentlike(comment)
      current_user.comment_like.each do |pl|
        return pl if pl.comment == comment
      end
    end
end

