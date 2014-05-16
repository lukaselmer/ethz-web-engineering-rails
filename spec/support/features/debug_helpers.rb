module Features
  module DebugHelpers
    def take_screenshot(filename = 'screenshot')
      filename = "#{Rails.root}/tmp/#{filename}.png"
      page.driver.save_screenshot filename
      %x{open "#{filename}"}
    end
  end
end
