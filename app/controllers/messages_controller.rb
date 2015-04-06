class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:mailgun_receive_email]
  skip_before_filter :authenticate_user!,        only: [:mailgun_receive_email, :contact_us]
  skip_before_filter :only_proofreaders!,        only: [:mailgun_receive_email, :contact_us]

  def contact_us
    @message = Message.new
    if @message.receive_from_site(message_params)
      redirect_to root_path+"#contact", :notice => "Your message was successfully sent."
    else
      redirect_to root_path+"#contact", :alert => "Please fill in all of the required fields"
    end
  end

  # def mailgun_receive_email
  #   @message = Message.new
  #   if @message.receive_from_mailgun(params)
  #      @message.job.email_on_job_creation
  #     render nothing: true, :status => 200, :content_type => 'text/html'
  #   else
  #     render nothing: true, :status => 404, :content_type => 'text/html'
  #   end
  # end

  # def index
  #   @messages = Message.where(job_id: nil).client
  # end

  private

    def message_params
      params.require(:message).permit(:name, :email, :subject, :telephone, :body, :location_submitted, attachment: [])
    end

end