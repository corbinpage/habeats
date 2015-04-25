class GoalsController < ApplicationController

  def create
    @goal = Goal.new(user_id: 2,
                     name: "New Goal",
                     category: "New Category",
                     theme: "habeats-blue")
    @goal.initialize_days
    @goal.save

    redirect_to root_path
  end

  def update_day
    @day = Day.find(params[:day_id])

    if(params[:commit]=="+")
      @day.add_score
    elsif(params[:commit]=="-")
      @day.subtract_score
    end

    respond_to do |format|
      if @day.save
        format.json   { render json: @day, status: :created }
      else
        format.json { render json: @day, status: :unprocessable_entity }
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
