# frozen_string_literal: true

# Controller for Supplies, like "Twine"
class SuppliesController < ApplicationController
  before_action :set_supply, only: %i[show edit update destroy]

  # GET /supplies
  def index
    @supplies = Supply.all
  end

  # GET /supplies/1
  def show; end

  # GET /supplies/new
  def new
    @supply = Supply.new
  end

  # GET /supplies/1/edit
  def edit; end

  # POST /supplies
  def create
    @supply = Supply.new(supply_params)

    if @supply.save
      redirect_to @supply, notice: 'Supply was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /supplies/1
  def update
    if @supply.update(supply_params)
      redirect_to @supply, notice: 'Supply was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /supplies/1
  def destroy
    @supply.destroy
    redirect_to supplies_url, notice: 'Supply was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_supply
    @supply = Supply.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def supply_params
    params.require(:supply).permit(:name, :slug, :description, :source)
  end
end
