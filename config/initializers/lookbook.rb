if Rails.env.development?
  Rails.application.config.lookbook.preview_layout = "preview"
  Rails.application.config.lookbook.preview_paths = ["test/components/lookbook"]
end
