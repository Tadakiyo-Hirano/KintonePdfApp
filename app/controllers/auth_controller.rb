class AuthController < ApplicationController
  include AuthHelper

  # 認可コードからアクセストークンを取得
  def gettoken
    token = get_token_from_code params[:code]
    session[:kintone_token] = token.to_hash
    redirect_to document_url($kintone_app_record)
  rescue
    flash[:alert] = 'ログインをキャンセルしました。'
    redirect_to root_url
  end
end
