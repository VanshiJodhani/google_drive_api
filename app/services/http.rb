require 'http'
class HttpRequest
  attr_writer :image
  
  def initialize
    image = image
  end

  def request
    HTTP.auth("Bearer ya29.A0AVA9y1v-1ugLpyBNvTrPwNzaa9g6yWOM3aC0guFI1MWl9yKDiEYLh23LdHBKb45D38TcpXH2KoR-fifZygjHI2QjMvFr7zfipyuRS38JWE9fZ-rlA60uIveqVMgRbJvLFrlvmv8sdDUzlAMkyDc9K-Uvmz1GcQYUNnWUtBVEFTQVRBU0ZRRTY1ZHI4bk1Jd2Y2aTQ1dDNmdUpMUFhNREJHdw0165").post("https://www.googleapis.com/upload/drive/v3/files", :body => "mimeType=image/jpeg")
  end
end

# :json => { :image => "image" }
