class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
    
    def total_price
        $base_url = "https://openapi.etsy.com/v2/listings/"
        $new_url = $base_url << (product.id_num).to_s << "?api_key=euc76lq36mpa202y6f8m5zwm"
        #uri = URI.parse("https://openapi.etsy.com/v2/listings/161929749?api_key=euc76lq36mpa202y6f8m5zwm")
        uri = URI.parse($new_url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)
        data = response.body
        @hash = JSON.parse(data)
        price = @hash["results"][0]["price"].to_i
        price * quantity
    end
end
