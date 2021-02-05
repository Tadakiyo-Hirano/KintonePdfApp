class ParticipationsController < ApplicationController
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
      req['X-Cybozu-API-Token'] = ENV['API_TOKEN']
      req['Content-Type'] = 'application/json'
      req.body = JSON.generate({"app": ENV['APP_ID'], "id": record_id })

      Net::HTTP.start(uri.host, uri.port, :use_ssl => true) {|http|
        res = http.request(req)
        res.code.to_i
        @participation = JSON.parse(res.body)
      }

      respond_to do |format|
        format.html
        format.pdf do
          pdf = ParticipationPdf.new(@participation)
    
          # disposition: "inline" によりPDFはダウンロードではなく画面に表示される
          send_data pdf.render,
            filename:    "参加申込書#{@participation['record']['serial_number']['value']}.pdf",
            type:        "application/pdf",
            disposition: "inline"
        end
      end
    end
  rescue
    redirect_to root_url
  end
end
