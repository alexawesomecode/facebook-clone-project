module PostlikesHelper

  private

    def post_liked?(post)
      current_user.postlike.each do |pl|
        return true if pl.post.id == post.id
      end
      false
    end

    def find_postlike(post)
      current_user.postlike.each do |pl|
        return pl if pl.post == post
      end
    end
end
