class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :set_roles, only: [:edit,:update,:new,:create]
    before_filter :is_admin, only: [:show, :edit, :destroy, :index, :update, :create]

    # GET /users
    # GET /users.json
    def index
        @users = User.all.where(type: nil)
    end

    # GET /users/1
    # GET /users/1.json
    def show
    end

    # GET /users/new
    def new
        @user = User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    # POST /users.json
    def create
        @user = User.new(user_params)
        @user.roles = [Role.find_or_create_by(name: params[:role])]
        respond_to do |format|
            if @user.save
                format.html { redirect_to @user, notice: 'User was successfully created.' }
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new }
                flash[:notice] = "There is an error in the form."
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      @user.roles = [Role.find_or_create_by(name: params[:role])]
      respond_to do |format|
          if @user.update(update_params)
              format.html { redirect_to @user, notice: 'User was successfully updated.' }
              format.json { render :show, status: :ok, location: @user }
          else
              format.html { render :edit }
              flash[:notice] = "There is an error in the form."
              format.json { render json: @user.errors, status: :unprocessable_entity }
          end
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        @user.destroy
        respond_to do |format|
            format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
            format.json { head :no_content }
        end
    end


    private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
           @user = User.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
            params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
        end
        
        # Use reduced set of parameters for updating/editing users
        def update_params
            (params.require(:user).permit(:email, :first_name, :last_name))
        end

        # Define roles that can be assigned to a user
        def set_roles
            @roles = [Role.find_or_create_by(name: "admin"), Role.find_or_create_by(name: "posting_agent"),Role.find_or_create_by(name: "sales_agent")]
        end


end
