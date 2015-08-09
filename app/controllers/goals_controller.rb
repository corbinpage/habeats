class GoalsController < ApplicationController

  def create
    @goal = Goal.new(user_id: current_user.id,
                     name: "New Goal",
                     category: "New Category",
                     theme: "streaky-blue")
    @goal.initialize_empty_progresses
    @goal.save

    redirect_to root_path
  end

  def update_progress
    @progress = Progress.mark(params[:id],
                              Date.strptime(params[:date], '%m-%d-%Y'),
                              params[:button])
    @progress.save

    respond_to do |format|
      if @progress.save
        format.json   { render json: @progress, status: :created }
      else
        format.json { render json: @progress, status: :unprocessable_entity }
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
