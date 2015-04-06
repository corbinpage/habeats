class TasksController < ApplicationController

  # def create_timer
  #   @task = Task.find(params[:id])
  #   if @task.start_timer(current_user)
  #     redirect_to job_manage_path(@task.job), notice: "Timer started"
  #   else
  #     redirect_to job_manage_path(@task.job), alert: "There was a problem with the timer"
  #   end
  # end

  # def upload_files
  #   @task = Task.find(params[:id])
  #   if params["task"] && @task.attach_documents(task_params)
  #     redirect_to job_manage_path(@task.job), notice: "Files Uploaded"
  #   else
  #     redirect_to job_manage_path(@task.job), alert: "There was a problem with the file upload"
  #   end
  # end

  # def mark_complete
  #   @task = Task.find(params[:id])
  #   if @task.mark_complete
  #     redirect_to job_manage_path(@task.job), notice: "Task marked as complete"
  #   else
  #     redirect_to job_manage_path(@task.job), alert: "Task failed to be marked complete"
  #   end
  # end

  private

    def task_params
      params.require(:task).permit( attachment: [])
    end

end
