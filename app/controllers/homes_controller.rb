class HomesController < ApplicationController
  def top
    @post = Post.limit(6).order(" created_at DESC ")
  end
end
