class OwnersController < InheritedResources::Base

  def show
    @owner = current_owner
    @pets = @owner.pets
  end
end
