module MessagesHelper
  require 'open-uri'
  require 'nokogiri'

  def set_ogp(url)
    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)
  end

  def tumbnaill_image(url)
    doc = set_ogp(url)
    p doc.css('//meta[property="og:image"]/@content').to_s
  end

  def tumbnaill_title(url)
    doc = set_ogp(url)
    if doc.css('//meta[property="og:site_name"]/@content').empty?
      p doc.title.to_s
    else
      p doc.css('//meta[property="og:site_name"]/@content').to_s
    end
  end

  def tumbnaill_content(url)
    doc = set_ogp(url)
    if doc.css('//meta[property="og:description"]/@content').empty?
      p doc.css('//meta[name$="escription"]/@content').to_s
    else
      p doc.css('//meta[property="og:description"]/@content').to_s
    end
  end
end

  
