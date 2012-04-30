module FlashMessageHelper
  # Render the flash messages
  def flash_messages(only = nil)
    render 'layouts/flash_message', only: only
  end
end