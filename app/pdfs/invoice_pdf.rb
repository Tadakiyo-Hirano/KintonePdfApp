class InvoicePdf < Prawn::Document
  def initialize(invoice)
    super(page_size: 'A4', page_layout: :portrait) # 縦 = :portrait, 横 = :landscape
    @invoice = invoice

    font_families.update('jp_font' => { normal: 'vendor/fonts/ipaexm.ttf', bold: 'vendor/fonts/ipaexg.ttf' }) # 日本語フォント
    font 'jp_font', style: :normal

    body
    development
  end

  def body
    draw_text '請 　　　求 　　　書', size: 11, at: [233, 677]
    self.line_width = 0.5
    stroke_horizontal_line 181.5, 373.5, at: 669
    stroke_horizontal_line 181.5, 373.5, at: 668

    self.line_width = 0.8
    stroke_horizontal_line 59.5, 239.5, at: 586

    bounding_box([55, 699], width: 700, height: 700) {
      table([
        [
          make_cell(width: 462, height: 660, border_width: 0.5)
        ]
      ]){
      }
    }

    bounding_box([139, 508], width: 700, height: 700) {
      table([
        [
          make_cell(width: 59, height: 38.5, border_width: 0.5),
          make_cell(width: 229, border_width: 0.5)
        ]
      ]){
      }
    }

    bounding_box([55, 404.5], width: 700, height: 700) {
      table([
        [
          make_cell(width: 120, height: 33, border_width: 0.5),
          make_cell(width: 96, border_width: 0.5),
          make_cell(width: 36, border_width: 0.5),
          make_cell(width: 60, border_width: 0.5),
          make_cell(width: 48, border_width: 0.5),
          make_cell(width: 102, border_width: 0.5)
        ],
        [
          make_cell(height: 33, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ],
        [
          make_cell(height: 33, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ],
        [
          make_cell(height: 33, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ],
        [
          make_cell(height: 33, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ],
        [
          make_cell(height: 33, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ],
        [
          make_cell(height: 33, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ],
        [
          make_cell(height: 33, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ],
        [
          make_cell(height: 33, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ],
        [
          make_cell(height: 33, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ]
      ]){
      }
    }
    
    self.line_width = 0.5
    stroke_horizontal_line 55, 517, at: 73.5
  end

  def development
    if Rails.env.development?
      line_width 1
      stroke_color "ff0000"
      dash 3 # 点線
      stroke_axis # 目盛りの表示
      stroke_circle [0,0], 10 # 原点
  
      stroke_vertical_line 0, 760, at: 0
      stroke_vertical_line 0, 760, at: 260 # 縦中心
      stroke_vertical_line 0, 760, at: 520

      stroke_horizontal_line 0, 520, at: 0
      stroke_horizontal_line 0, 520, at: 380 # 横中心
      stroke_horizontal_line 0, 520, at: 760
    end
  end
end