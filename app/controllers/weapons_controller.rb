require 'mechanize'
require 'date'
require 'json'

class WeaponsController < ApplicationController
  before_action :set_weapon, only: [:show, :edit, :update, :destroy]

  # GET /weapons
  # GET /weapons.json
  def index
    @weapons = Weapon.all
  end

  # GET /weapons/1
  # GET /weapons/1.json
  def show
    # @usd = currency(@weapon.price)
  end

  # GET /weapons/new
  def new
    @weapon = Weapon.new
    # HardJob.perform_later(12)
  end

  # GET /weapons/1/edit
  def edit
  end

  # POST /weapons
  # POST /weapons.json
  def create
    @weapon = Weapon.new(weapon_params)

    respond_to do |format|
      if @weapon.save
        # HardJob.perform_later(@weapon.id)
        format.html { redirect_to @weapon, notice: 'Weapon was successfully created.' }
        format.json { render :show, status: :created, location: @weapon }
      else
        format.html { render :new }
        format.json { render json: @weapon.errors, status: :unprocessable_entity }
      end
    end
  end

    def get_user_versions
    u = User.find(57)
    render json: { user: u.versions }
  end

  # PATCH/PUT /weapons/1
  # PATCH/PUT /weapons/1.json
  def update
    respond_to do |format|
      if @weapon.update(weapon_params)
        format.html { redirect_to @weapon, notice: 'Weapon was successfully updated.' }
        format.json { render :show, status: :ok, location: @weapon }
      else
        format.html { render :edit }
        format.json { render json: @weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weapons/1
  # DELETE /weapons/1.json
  def destroy
    @weapon.destroy
    respond_to do |format|
      format.html { redirect_to weapons_url, notice: 'Weapon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weapon
      @weapon = Weapon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weapon_params
      params.require(:weapon).permit(:image, :description, :price)
    end
end
