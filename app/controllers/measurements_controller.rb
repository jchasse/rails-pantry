class MeasurementsController < ApplicationController

  def index
    if params[:search]
      @measurements = Measurement.quantity_search(params[:search])
    else
      @measurements = Measurement.all
    end
  end

  def new
    @measurement = Measurement.new
    # @items = Item.all
    @item = @measurement.build_item
  end

  def create
    m = Measurement.create(measurement_params)
    redirect_to item_path(m.item)
  end

  private

  def measurement_params
    params.require(:measurement).permit(:unit, :quantity, :item_id, :item_name, item_attributes: [:name])
  end

end
