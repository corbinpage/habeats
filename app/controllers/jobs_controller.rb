class JobsController < ApplicationController
  skip_before_filter :only_proofreaders!, only: [:new, :create, :show, :update, :index]

  # Regular User methods

  # def new
  #   @user = User.find(params[:user_id])
  #   can_view_job?
  #   @job = Job.new
  #   message = @job.messages.build
  #   message.attachments.build
  # end

  # def create
  #   @job = Job.new(remove_attachements(job_params))
  #   can_view_job?
  #   @job.messages.first.attach_documents(job_params["messages_attributes"]["0"]["attachments_attributes"])
  #   @job.create_tasks
  #   @job.user = current_user
  #   if @job.save
  #     @job.email_on_job_creation # This probably isn't the best way to do this.
  #     # Message.notify_proofreaders
  #     redirect_to user_job_path(current_user, @job), :notice => "Job was successfully created."
  #   else
  #     redirect_to user_path(current_user), :alert => "Please fill in all of the required fields"
  #   end
  # end

  # def show
  #   @job = Job.find(params[:id])
  #   can_view_job?
  #   @job_types = Job::JOB_TYPES
  #   @job.user = current_user
  #   @message = Message.new
  # end

  # def update
  #   @job = Job.find(params[:id])
  #   can_view_job?
  #   @job.update_attributes(remove_attachements(job_params))
  #   @job.messages.first.attach_documents(job_params["messages_attributes"]["0"]["attachments_attributes"]) if job_params["messages_attributes"]
  #   if @job.save
  #     redirect_to user_job_path(current_user, @job), :notice => "The Proofreader has been notified"
  #   else
  #     render action: 'show', :alert => "There was an error with your submission"
  #   end
  # end

  # def index
  #   @jobs = current_user.jobs.paginate(:page => params[:page], :per_page => 10)
  #   @user = current_user
  # end

  # Proofreader only methods

  # def all_jobs
  #   @jobs = Job.all.paginate(:page => params[:page], :per_page => 20)
  #   @job = Job.new
  # end

  # def manage
  #   @job   = Job.find(params[:id])
  #   @job_types = Job::JOB_TYPES
  #   @tasks = @job.tasks
  #   @task  = Task.new
  # end

  # def manage_update
  #   @job = Job.find(params[:id])
  #   if @job.update_attributes(job_params)
  #     redirect_to job_manage_path(@job), :notice => "Job Type Updated"
  #   else
  #     render 'manage', alert: "Job_type was not updated"
  #   end
  # end

  # def send_client_email
  #   @job = Job.find(params[:id])
  #   email_attachments = params["job"]["messages_attributes"]["0"]["email_attachments"]
  #   if @job.send_complete_email(job_params, email_attachments)
  #     redirect_to job_manage_path(@job), :notice => "Email Sent"
  #   else
  #     redirect_to job_manage_path(@job), :alert  => "There was an error with sending your email"
  #   end
  # end

  private

    def job_params
      params.require(:job).permit(:id, :job_type, messages_attributes: [:id, :subject, :body, :location_submitted, attachments_attributes: [:id, :task_type, attachment: [] ]] )
    end

    def remove_attachements(job_params)
      if job_params["messages_attributes"]
        clean_attributes = job_params.except("messages_attributes")
        messages_no_attachements = Hash[job_params["messages_attributes"].map {|k,v| [k,(v.respond_to?(:except)?v.except("attachments_attributes"):v)] }]
        clean_attributes["messages_attributes"] = messages_no_attachements
        clean_attributes
      else
        job_params
      end
    end

    def can_view_job?
      if current_user.proofreader?
        true
      elsif params[:user_id] == current_user.id.to_s
        true
      else
        redirect_to root_path, notice: "You cannot view other user's profile"
      end
    end

end
