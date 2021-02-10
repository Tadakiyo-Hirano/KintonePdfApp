class AuthController < ApplicationController
  include AuthHelper

  # 認可コードからアクセストークンを取得
  def gettoken
    record = $kintone_app_record.to_i
    token = get_token_from_code params[:code]
    session[:kintone_token] = token.to_hash
    if record.present?
      redirect_to document_url(record)
    else
      redirect_to documents_url
      flash[:alert] = 'アクセスエラーです、一度この画面を閉じてやり直してください。'
    end
  rescue
    flash[:alert] = 'ログインをキャンセルしました。'
    redirect_to root_url
  end
end
