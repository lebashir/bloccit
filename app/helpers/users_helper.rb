module UsersHelper

  def user_has_comments_posts?(user)
    user.posts.count > 0 || user.comments.count > 0
  end
end
