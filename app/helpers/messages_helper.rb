module MessagesHelper

  def sender(message)
    if Message::CLIENT_EMAIL_LOCATIONS.include?(message.location_submitted)
      "Client"
    elsif Message::PROOFREADER_EMAIL_LOCATIONS.include?(message.location_submitted)
      "Proofreader"
    end
  end

end
