class EstimatePdf < Prawn::Document
  def initialize(estimate)
    super(page_size: 'A4', page_layout: :portrait) # 縦 = :portrait, 横 = :landscape
    @estimate = estimate

    font_families.update('jp_font' => { normal: 'vendor/fonts/ipaexm.ttf', bold: 'vendor/fonts/ipaexg.ttf' }) # 日本語フォント
    font 'jp_font', style: :normal

    body
    data
    development
  end

  def body
    draw_text '見 　　　　積 　　　　書', size: 12, at: [194, 667]

    draw_text '件名リスト一連番号', size: 11, at: [32, 614]
    bounding_box([26, 629], width: 700, height: 90
      ) {
        table([
          [
            make_cell(width: 111, height: 23),
            make_cell(width: 119)
          ]
        ]){
  
        }
      }

      draw_text '金　　額', size: 11, at: [29, 574]
      draw_text '￥', size: 12, at: [80, 573]
      draw_text '(', size: 9, at: [259, 575.5]
      draw_text '消', size: 9, at: [273, 575.5]
      draw_text '費', size: 9, at: [288, 575.5]
      draw_text '税', size: 9, at: [303, 575.5]
      draw_text '及', size: 9, at: [318, 575.5]
      draw_text 'び', size: 9, at: [333, 575.5]
      draw_text '地', size: 9, at: [349, 575.5]
      draw_text '方', size: 9, at: [364, 575.5]
      draw_text '税', size: 9, at: [379, 575.5]
      draw_text 'を', size: 9, at: [394, 575.5]
      draw_text '含', size: 9, at: [409, 575.5]
      draw_text 'ま', size: 9, at: [424, 575.5]
      draw_text 'な', size: 9, at: [439, 575.5]
      draw_text 'い', size: 9, at: [454, 575.5]
      draw_text '。', size: 9, at: [469, 575.5]
      draw_text ')', size: 9, at: [490, 575.5]
      stroke_horizontal_line 26, 255.5, at: 569
      stroke_horizontal_line 26, 255.5, at: 567

      bounding_box([26, 556], width: 700, height: 700
        ) {
          table([
            [
              make_cell(width: 111, height: 23),
              make_cell(width: 89),
              make_cell(width: 59),
              make_cell(width: 54),
              make_cell(width: 54),
              make_cell(width: 100)
            ]
          ]){
    
          }
        }
  end

  def data
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