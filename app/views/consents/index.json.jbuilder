json.array!(@consents) do |consent|
  json.extract! consent, :id, :user_id, :procedure_id, :indications_complete, :benefits_complete, :risks_complete, :alternatives_complete, :description_complete, :consent_complete
  json.url consent_url(consent, format: :json)
end
