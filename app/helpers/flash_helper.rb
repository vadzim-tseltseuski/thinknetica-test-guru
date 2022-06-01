# frozen_string_literal: true

module FlashHelper
  def add_flash_message(key, _msg)
    flash[key] = message
  end

  def add_flash_now_message(key, msg)
    flash[key] = msg
  end

  def flash_class(level)
    alert_class = { notice: 'alert-info',
                    success: 'alert-success',
                    error: 'alert-danger',
                    alert: 'alert-danger' }

    alert_class[level.to_sym] || 'alert-error'
  end

  def show_flashes
    render 'shared/flash'
  end
end
