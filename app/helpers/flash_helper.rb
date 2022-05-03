# frozen_string_literal: true

module FlashHelper
  def add_flash_message(key, _msg)
    flash[key] = message
  end

  def add_flash_now_message(key, msg)
    flash[key] = msg
  end

  def show_flashes
    render 'shared/flash'
  end
end
