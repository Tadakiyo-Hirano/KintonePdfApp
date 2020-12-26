module AuthHelper
  CLIENT_ID = ENV['CLIENT_ID']
  CLIENT_SECRET = ENV['CLIENT_SECRET']
  SITE = "https://#{ENV['SITE']}.cybozu.com"
  AUTHORIZE_URL = '/oauth2/authorization'
  TOKEN_URL = '/oauth2/token'
  SCOPES = ['k:app_record:read','k:app_record:write']
  STATE = SecureRandom.alphanumeric

  # ログインURLの生成
  def get_login_url
    client = OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, site: SITE, authorize_url: AUTHORIZE_URL, token_url: TOKEN_URL)
    login_url = client.auth_code.authorize_url(redirect_uri: authorize_url, scope: SCOPES.join(' '), state: STATE)
  end

  # アクセストークン取得のための認可コードを送信
  def get_token_from_code(auth_code)
    client = OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, site: SITE, authorize_url: AUTHORIZE_URL, token_url: TOKEN_URL)
    token = client.auth_code.get_token(auth_code, redirect_uri: authorize_url, scope: SCOPES.join(' '))
  end

  # アクセストークンの取得
  def get_access_token
    # セッションから現在のアクセストークンハッシュを取得
    token_hash = session[:kintone_token]

    client = OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, site: SITE, authorize_url: AUTHORIZE_URL, token_url: TOKEN_URL)
    token = OAuth2::AccessToken.from_hash(client, token_hash)

    # アクセストークンが期限切れの場合、リフレッシュトークンからアクセストークンを取得
    if token.expired?
      new_token = token.refresh!
      # 新アクセストークンをセッションへ保存
      session[:kintone_token] = new_token.to_hash
      access_token = new_token
    else
      access_token = token
    end
  end
end
