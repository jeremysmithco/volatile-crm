class ApplicationComponent < ViewComponent::Base
  private

  def debug
    params[:debug] == "true"
  end
end
