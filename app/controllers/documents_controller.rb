class DocumentsController < ApplicationController
  include AuthHelper

  APP_ID = ENV['APP_ID']
  DOMAIN = "https://#{ENV['SITE']}.cybozu.com"

  def index
  end

  def show
    token = get_access_token

    if token
      record_id = params[:id]

      url = "https://akt-mac.cybozu.com/k/v1/record.json"
      uri = URI.parse(url)

      req = Net::HTTP::Get.new(uri.path)
      req['X-Cybozu-API-Token'] = ENV['API_TOKEN']
      req['Content-Type'] = 'application/json'
      req.body = JSON.generate({"app": ENV['APP_ID'], "id": record_id })

      Net::HTTP.start(uri.host, uri.port, :use_ssl => true) {|http|
        res = http.request(req)
        res.code.to_i
        @document = JSON.parse(res.body)
      }
    else
      redirect_to root_uri
    end
  rescue
    redirect_to root_url
  end
end
