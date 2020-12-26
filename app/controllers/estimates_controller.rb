class EstimatesController < ApplicationController
  include AuthHelper

  APP_ID = ENV['APP_ID']
  DOMAIN = "https://#{ENV['SITE']}.cybozu.com"

  def show
    token = get_access_token
    if token
      record_id = params[:id]

      url = "https://#{ENV['SITE']}.cybozu.com/k/v1/record.json"
      uri = URI.parse(url)

      req = Net::HTTP::Get.new(uri.path)
      req['X-Cybozu-API-Token'] = 'vltS2Jbm8GgWlrck1oUR88eLmmvTx3IvafBAXEVC'
      req['Content-Type'] = 'application/json'
      req.body = JSON.generate({"app": 75, "id": record_id })

      Net::HTTP.start(uri.host, uri.port, :use_ssl => true) {|http|
        res = http.request(req)
        res.code.to_i
        @participation = JSON.parse(res.body)
      }

      respond_to do |format|
        format.html
        format.pdf do
          pdf = EstimatePdf.new(@estimate)
    
          # disposition: "inline" によりPDFはダウンロードではなく画面に表示される
          send_data pdf.render,
            filename:    "見積書#{@participation['record']['serial_number']['value']}.pdf",
            type:        "application/pdf",
            disposition: "inline"
        end
      end
    end
  end
end
