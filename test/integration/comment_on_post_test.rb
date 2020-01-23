class CommentOnPost < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
  
       
    test "valid comment posting" do
        @user = users(:player_two)
        @user_friend = users(:player_one)
        @post = posts(:post_one)
        sign_in @user_friend
        get new_post_comment_path(@post.id)
        post post_comments_path, params: { comment: { comment_content: 'one comment'}}
        assert_equal @post.comments.first.comment_content, 'one comment'
        assert_redirected_to root_path
        follow_redirect!
        
    end

    test "invalid comment posting without comment" do
        comment = Comment.new(comment_content:'', post_id: 1, comment_creator: 2)
        assert_not comment.valid?
        
    end

    test "invalid comment posting without post_id" do
        comment = Comment.new(comment_content:'Some content', post_id: nil, comment_creator: 2)
        assert_not comment.valid?
        
    end

    test "invalid comment posting without comment creator" do
        comment = Comment.new(comment_content:'Some content', post_id: 2, comment_creator: nil)
        assert_not comment.valid?
        
    end
end  