class LoginSignupsController < ApplicationController
  before_action :set_login_signup, only: %i[show edit update destroy]

  # GET /login_signups or /login_signups.json
  def index
    @login_signups = LoginSignup.all
  end

  # GET /login_signups/1 or /login_signups/1.json
  def show; end

  # GET /login_signups/new
  def new
    @login_signup = LoginSignup.new
  end

  # GET /login_signups/1/edit
  def edit; end

  # POST /login_signups or /login_signups.json
  def create
    @login_signup = LoginSignup.new(login_signup_params)

    respond_to do |format|
      if @login_signup.save
        format.html { redirect_to login_signup_url(@login_signup), notice: 'Login signup was successfully created.' }
        format.json { render :show, status: :created, location: @login_signup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @login_signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /login_signups/1 or /login_signups/1.json
  def update
    respond_to do |format|
      if @login_signup.update(login_signup_params)
        format.html { redirect_to login_signup_url(@login_signup), notice: 'Login signup was successfully updated.' }
        format.json { render :show, status: :ok, location: @login_signup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @login_signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /login_signups/1 or /login_signups/1.json
  def destroy
    @login_signup.destroy

    respond_to do |format|
      format.html { redirect_to login_signups_url, notice: 'Login signup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_login_signup
    @login_signup = LoginSignup.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def login_signup_params
    params.fetch(:login_signup, {})
  end
end
