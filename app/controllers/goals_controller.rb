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

    if(params[:button]=="add")
      @day.add_score
    elsif(params[:button]=="subtract")
      @day.subtract_score
    end

    @progress = Progress.mark(@day.goal_id, @day.date, params[:button])
    @progress.save

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
