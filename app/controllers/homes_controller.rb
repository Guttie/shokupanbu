class HomesController < ApplicationController
  def top
    @post = Post.limit(3).order(" created_at DESC ")
  end
end
