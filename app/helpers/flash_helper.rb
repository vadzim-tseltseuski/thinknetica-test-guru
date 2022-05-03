module FlashHelper
    def add_flash_message(key, msg)
        flash[key] = message
    end

    def add_flash_now_message(key, msg)
        flash[key] = msg
    end

  def show_flashes
    render 'shared/flash'
  end
end