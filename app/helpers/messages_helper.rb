module MessagesHelper
  require 'open-uri'
  require 'nokogiri'

  def set_ogp(url)
    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end

    doc = Nokogiri::HTML.parse(html, charset)
  end

  def tumbnaill_image(url)
    doc = set_ogp(url)
    if doc.css('//meta[property="og:image"]/@content').blank?
      p '/assets/noimage.png'
    else
      p doc.css('//meta[property="og:image"]/@content').to_s
    end
  end

  def tumbnaill_title(url)
    doc = set_ogp(url)
    if doc.css('//meta[property="og:site_name"]/@content').present?
      p doc.css('//meta[property="og:site_name"]/@content').to_s
    elsif doc.css('//meta[property="og:title"]/@content').present?
      p doc.css('//meta[property="og:title"]/@content').to_s
    elsif doc.css('//title').present?
      p doc.css('//title').inner_text
    else
      p 'リンク先へ'
    end
  end

  def tumbnaill_content(url)
    doc = set_ogp(url)
    if doc.css('//meta[property="og:description"]/@content').present?
      p doc.css('//meta[property="og:description"]/@content').to_s
    else doc.css('//meta[name="description"]/@content').present?
      p doc.css('//meta[name="description"]/@content').to_s
    end
  end
end

  
