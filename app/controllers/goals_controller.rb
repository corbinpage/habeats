class GoalsController < ApplicationController

  def update_day
    @goal = Goal.find_one(params[:id])

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.js   {}
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_title
    @goal = Goal.find(params[:id])
    @goal.name = params[:value]

    respond_to do |format|
      if @goal.save
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.js   {}
        format.json { render json: @goal, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
