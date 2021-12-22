class HomesController < ApplicationController
  def top
    @shop = Shop.limit(3).order(" created_at DESC ")
    @toast = Toast.limit(3).order(" created_at DESC ")
    @sandwich = Sandwich.limit(3).order(" created_at DESC ")
  end
end
