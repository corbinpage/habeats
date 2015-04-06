Paperclip::Attachment.default_options.update({
  :storage => :fog,
  :fog_credentials => {
    :provider => 'Google',
    :google_storage_access_key_id     => ENV['google_storage_access_key_id'],
    :google_storage_secret_access_key => ENV['google_storage_secret_access_key']
  },
  :fog_public => true,
  :fog_directory => ENV['google_storage_bucket']
})