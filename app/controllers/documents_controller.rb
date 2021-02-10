class DocumentsController < ApplicationController
  include AuthHelper

  APP_ID = ENV['APP_ID']
  DOMAIN = "https://#{ENV['SITE']}.cybozu.com"

  def index
  end

  def show
    $kintone_app_record = params[:id]
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
        @document = JSON.parse(res.body)
      }

      app_url = "https://#{ENV['SITE']}.cybozu.com/k/v1/app.json"
      app_uri = URI.parse(app_url)

      app_req = Net::HTTP::Get.new(app_uri.path)
      app_req['X-Cybozu-API-Token'] = ENV['API_TOKEN']
      app_req['Content-Type'] = 'application/json'
      app_req.body = JSON.generate({"app": ENV['APP_ID'], "id": ENV['APP_ID'] })

      Net::HTTP.start(app_uri.host, app_uri.port, :use_ssl => true) {|http|
        app_res = http.request(app_req)
        app_res.code.to_i
        @app_data = JSON.parse(app_res.body)
      }
    end
  rescue
    redirect_to root_url
  end
end
