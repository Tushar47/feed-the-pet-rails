class PetsController < InheritedResources::Base
  def index
    @owner = Owner.find(params[:owner_id])
    @pets = @owner.pets
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @owner = Owner.find(params[:owner_id])
    @pet = @owner.pets.build
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def create
    @owner = Owner.find(params[:owner_id])
    @pet = @owner.pets.build(:name => params[:pet][:name], :picture => params[:pet][:picture])
    @pet.health = 50

      if @pet.save
         redirect_to @owner, notice: 'Pet was successfully created.'
      else
        render action: "new"
      end
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update_attributes(params[:pet])
       redirect_to @pet, notice: 'Pet was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to owner_path(current_owner)
  end

  def feed
    energy = params[:energy].to_i
    @pet = Pet.find(params[:pet_id])
    @pet.health += energy
    @pet.save!
    redirect_to owner_path(current_owner)
  end

end
