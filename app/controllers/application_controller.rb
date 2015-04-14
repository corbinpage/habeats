class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_filter :authenticate_user!

  def update_day
    @day = Day.find(params[:day_id])
    if(params[:commit]=="Add")
      @day.range_color = "#bbb"
      @day.score+=1
    elsif(params[:commit]=="Subtract")
      @day.score-=1
    end

    respond_to do |format|
      if @day.save
        format.json   { render json: @day, status: :created }
      else
        format.json { render json: @day, status: :unprocessable_entity }
      end
    end

  end




end