if ENV['RAILS_ENV'] == "production"
  Paperclip::Attachment.default_options[:url] = 'opimas-production.s3.amazonaws.com'
else
  Paperclip::Attachment.default_options[:url] = 'opimas.s3.amazonaws.com'
end
Paperclip::Attachment.default_options[:url] = 'reports/:id/:filename'
Paperclip::Attachment.default_options[:path] = 'reports/:id/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'
