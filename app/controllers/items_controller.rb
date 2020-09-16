class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
    @item.measurements.build
    # @item.measurements.build
    # @item.measurements.build
  end

  def create
    # binding.pry
    @item = Item.create(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      @errors = @item.errors.full_messages
      render :new
    end
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    @item = Item.find_by(id: params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      @errors = @item.errors.full_messages
      render :edit
    end
  end

  def destroy
    item = Item.find_by(id: params[:id])
    item.destroy
    redirect_to items_path
  end

  private

  # def item_params(*args)
  #   params.require(:item).permit(args)
  # end

  def item_params
    params.require(:item).permit(:name, measurements_attributes: [:unit, :quantity, :id])
  end

end

# {"name"=>"Brown Sugar", "measurements_attributes"=>{"0"=>{"quantity"=>"2", "unit"=>"Boxes"}}}
#
# def initialize(hash)
#   hash.each do |k, v|
#       self.send("#{k}=", v)
#   end
# end
