class SplashScreensController < ApplicationController
  before_action :set_splash_screen, only: %i[show edit update destroy]

  # GET /splash_screens or /splash_screens.json
  def index; end

  # GET /splash_screens/1 or /splash_screens/1.json
  def show; end

  # GET /splash_screens/new
  def new
    @splash_screen = SplashScreen.new
  end

  # GET /splash_screens/1/edit
  def edit; end

  # POST /splash_screens or /splash_screens.json
  def create
    @splash_screen = SplashScreen.new(splash_screen_params)

    respond_to do |format|
      if @splash_screen.save
        format.html { redirect_to splash_screen_url(@splash_screen), notice: 'Splash screen was successfully created.' }
        format.json { render :show, status: :created, location: @splash_screen }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @splash_screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /splash_screens/1 or /splash_screens/1.json
  def update
    respond_to do |format|
      if @splash_screen.update(splash_screen_params)
        format.html { redirect_to splash_screen_url(@splash_screen), notice: 'Splash screen was successfully updated.' }
        format.json { render :show, status: :ok, location: @splash_screen }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @splash_screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /splash_screens/1 or /splash_screens/1.json
  def destroy
    @splash_screen.destroy

    respond_to do |format|
      format.html { redirect_to splash_screens_url, notice: 'Splash screen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_splash_screen
    @splash_screen = SplashScreen.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def splash_screen_params
    params.fetch(:splash_screen, {})
  end
end
