module MessagesHelper
  require 'open-uri'
  require 'nokogiri'

  def set_ogp(url)
    begin
      charset = nil
      html = open(url) do |f|
        charset = f.charset # 文字種別を取得
        f.read # htmlを読み込んで変数htmlに渡す
      end
      doc = Nokogiri::HTML.parse(html, charset)
      return doc, url
    rescue
      doc = ""
      return doc, request.url
    end
  end

  def tumbnaill_image(doc)
    begin
      doc.css('//meta[property="og:image"]/@content').to_s
    rescue
      '/assets/noimage.png'
    end
  end

  def tumbnaill_title(doc)
    begin
      doc.css('//meta[property="og:site_name"]/@content').to_s
    rescue
      begin
        doc.css('//meta[property="og:title"]/@content').to_s
      rescue
        doc.css('//title').inner_text rescue title = 'リンク先へ'
      end
    end
  end

  def tumbnaill_content(doc)
    begin
      doc.css('//meta[property="og:description"]/@content').to_s
    rescue
      begin
        doc.css('//meta[name="description"]/@content').to_s rescue "サイト情報を読み込めませんでした。"
      end
    end
  end
end
  
