class DeliveryPdf < Prawn::Document
  def initialize(delivery)
    super(page_size: 'A4', page_layout: :landscape) # 縦 = :portrait, 横 = :landscape
    @delivery = delivery

    font_families.update('jp_font' => { normal: 'vendor/fonts/ipaexm.ttf', bold: 'vendor/fonts/ipaexg.ttf' }) # 日本語フォント
    font 'jp_font', style: :normal

    body
    development
  end

  def body
    draw_text '納入先', size: 10.5, at: [36.5, 462.5]
    draw_text '納', size: 10.5, at: [351, 464.5]
    draw_text '品', size: 10.5, at: [373, 464.5]
    draw_text '書', size: 10.5, at: [396, 464.5]
    draw_text '・', size: 10.5, at: [419, 464.5]
    draw_text '(', size: 10.5, at: [449, 464.5]
    draw_text '受', size: 10.5, at: [465, 464.5]
    draw_text '領', size: 10.5, at: [488, 464.5]
    draw_text ')', size: 10.5, at: [511, 464.5]
    draw_text '検', size: 10.5, at: [534, 464.5]
    draw_text '査', size: 10.5, at: [557, 464.5]
    draw_text '調', size: 10.5, at: [580, 464.5]
    draw_text '書', size: 10.5, at: [603, 464.5]
    bounding_box([31, 474], width: 700, height: 90) {
      table([
        [
          make_cell(width: 42, height: 16, border_width: 0.5),
          make_cell(width: 189, border_width: 0.5),
          make_cell(width: 439, border_width: 0.5)
        ]
      ]){
      }
    }

    bounding_box([31, 458], width: 700, height: 500) {
      table([
        [
          make_cell(width: 42, height: 96, border_width: 0.5),
          make_cell(width: 189, border_width: 0.5),
          make_cell(width: 439, border_width: 0.5)
        ]
      ]){
      }
    }
  end

  def development
    if Rails.env.development?
      line_width 1
      stroke_color "ff0000"
      dash 3 # 点線
      stroke_axis # 目盛りの表示
      stroke_circle [0,0], 10 # 原点
  
      stroke_vertical_line 0, 540, at: -35
      stroke_vertical_line 0, 540, at: 70
      stroke_vertical_line 0, 540, at: 175
      stroke_vertical_line 0, 540, at: 280
      stroke_vertical_line 0, 540, at: 385 # 真ん中
      stroke_vertical_line 0, 540, at: 490
      stroke_vertical_line 0, 540, at: 595
      stroke_vertical_line 0, 540, at: 700
      stroke_vertical_line 0, 540, at: 805

      stroke_horizontal_line 0, 770, at: -35
      stroke_horizontal_line 0, 770, at: 38.75
      stroke_horizontal_line 0, 770, at: 112.5
      stroke_horizontal_line 0, 770, at: 186.25
      stroke_horizontal_line 0, 770, at: 260 # 真ん中
      stroke_horizontal_line 0, 770, at: 333.75
      stroke_horizontal_line 0, 770, at: 407.5
      stroke_horizontal_line 0, 770, at: 481.25
      stroke_horizontal_line 0, 770, at: 555
    end
  end
end