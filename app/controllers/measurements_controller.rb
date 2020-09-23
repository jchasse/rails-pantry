class MeasurementsController < ApplicationController

layout 'application'

  def index
    if params[:search]
      @measurements = Measurement.quantity_search(params[:search])
    else
      @measurements = Measurement.all
    end
  end

  def new
    # binding.pry
    if params[:item_id]
      @item = Item.find_by(id: params[:item_id])
      @measurement = @item.measurements.build
    else
      @measurement = Measurement.new
      @measurement.build_item
    end

    # @items = Item.all
    # @item = @measurement.build_item
  end

  def create
    m = Measurement.new(measurement_params)
    m.user = current_user
    m.item_id = params[:item_id]
    m.save
    redirect_to item_path(m.item)
  end

  private

  def measurement_params
    params.require(:measurement).permit(:unit, :quantity, :item_id, :item_name, item_attributes: [:name])
  end

end
