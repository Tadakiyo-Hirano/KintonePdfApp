module ApplicationHelper
  def title
    title = @app_data
    if title
      @app_data['name']
    else
      '認証'
    end
  end
end
