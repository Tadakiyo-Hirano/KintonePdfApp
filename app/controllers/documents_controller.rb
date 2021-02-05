class DocumentsController < ApplicationController
  include AuthHelper

  APP_ID = ENV['APP_ID']
  DOMAIN = "https://#{ENV['SITE']}.cybozu.com"

  def new
  end

  def show
    # k = KintoneApp.find(1)
    # record_id = params[:id]
    # api = Kintone::Api.new("#{DOMAIN}.cybozu.com")
    # url = "https://#{DOMAIN}.cybozu.com/k/v1/record.json"
    # uri = URI.parse(url)
    # api_token = k.token
    # req = Net::HTTP::Get.new(uri.path)
    # req['X-Cybozu-API-Token'] = api_token
    # req['Content-Type'] = 'application/json'
    # req.body = JSON.generate({"app": KintoneApp.find(1).app_id, "id": record_id })

    # Net::HTTP.start(uri.host, uri.port, :use_ssl => true) {|http|
    #   res = http.request(req)
    #   res.code.to_i
    #   @post = JSON.parse(res.body)
    # }
    token = get_access_token

    if token
      record_id = params[:id]

      url = "https://akt-mac.cybozu.com/k/v1/record.json"
      uri = URI.parse(url)

      req = Net::HTTP::Get.new(uri.path)
      req['X-Cybozu-API-Token'] = ENV['API_TOKEN']
      req['Content-Type'] = 'application/json'
      req.body = JSON.generate({"app": 75, "id": record_id })

      Net::HTTP.start(uri.host, uri.port, :use_ssl => true) {|http|
        res = http.request(req)
        res.code.to_i
        @post = JSON.parse(res.body)
      }
    else
      redirect_to root_uri
    end
  end
end
