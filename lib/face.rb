require File.join(File.dirname(__FILE__), "mashape/mashape_client.rb")

class Face

  def initialize(publicKey, privateKey)
    @publicKey = publicKey
    @privateKey = privateKey
  end

  def detect(images, &mashape_callback)
    parameters = {
        "images" => images}

    response = MashapeClient::HTTP::HttpClient.do_request(
        :get,
        "https://lambda-face-detection-and-recognition.p.mashape.com/detect?images={images}",
        parameters,
        @publicKey,
        @privateKey,
        true,
        &mashape_callback)
    return response
  end
end
