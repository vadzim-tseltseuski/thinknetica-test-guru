# frozen_string_literal: true

module FlashHelper
  BOOTSTRAP_ALERT_CLASS = { notice: 'alert-info',
                            success: 'alert-success',
                            error: 'alert-danger',
                            alert: 'alert-danger' }.freeze

  def add_flash_message(key, _msg)
    flash[key] = message
  end

  def add_flash_now_message(key, msg)
    flash[key] = msg
  end

  def flash_class(level)
    BOOTSTRAP_ALERT_CLASS[level.to_sym] || 'alert-error'
  end

  def show_flashes
    render 'shared/flash'
  end

  def flash_message(key)
    content_tag :div, flash[key].html_safe, class: "alert #{flash_class(key)} text-center", role: 'alert' if flash[key]
  end
end
