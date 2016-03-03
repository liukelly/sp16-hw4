class DogsController < ApplicationController
  # The controller for dogs.  Makes an implicit call to render
    # "views/dogs/method_name.html.erb" at the end of every method.

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    if @dog.save
      redirect_to @dog
    else
      render "Add new dog!"
    end
  end

  def show
    begin
      @dog = Dog.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to :controller => "dogs", :action => "index"
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age)
  end
end
