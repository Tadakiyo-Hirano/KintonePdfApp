class DeliveryPdf < Prawn::Document
  def initialize(delivery)
    super(page_size: 'A4', page_layout: :landscape) # 縦 = :portrait, 横 = :landscape
    @delivery = delivery

    font_families.update('jp_font' => { normal: 'vendor/fonts/ipaexm.ttf', bold: 'vendor/fonts/ipaexg.ttf' }) # 日本語フォント
    font 'jp_font', style: :normal

    body
    development
    # start_new_page
    # body
    # (1..100).each{|n|
    #   if n % 4 == 0
    #     print "(#{n-3}～#{n})"
    #   end
    # }
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

    draw_text '契', size: 10.5, at: [44, 427]
    draw_text '約', size: 10.5, at: [44.5, 406]
    draw_text '者', size: 10.5, at: [44.5, 385]

    draw_text '住所、会社名、代表者印', size: 10.6, at: [78, 447]

    draw_text '調達要求番号', size: 10.6, at: [267, 448]
    draw_text '確認番号', size: 10.5, at: [264, 424]
    draw_text '(認証番号)', size: 10.5, at: [313, 424]
    draw_text '契約年月日', size: 10.5, at: [267, 400]
    draw_text '納期', size: 10.4, at: [267.5, 376]

    draw_text '発送年月日', size: 10.4, at: [373, 448]
    draw_text '輸送方法', size: 10.4, at: [373, 424]
    draw_text '発送駅', size: 10.4, at: [373, 400]
    draw_text '分割納入', size: 10.4, at: [373, 376]
    draw_text '物品管理官命令印', size: 10.4, at: [478, 447]
    draw_text '命令年月日', size: 10.4, at: [583, 448]
    draw_text '管理簿登記年月日', size: 10.4, at: [583, 424]
    draw_text '証書番号', size: 10.4, at: [583, 400]
    draw_text '同上付与年月日', size: 10.4, at: [583, 376]
    bounding_box([262, 458], width: 700, height: 500) {
      table([
        [
          make_cell(width: 105, height: 24, border_width: 0.5),
          make_cell(width: 105, border_width: 0.5)
        ],
        [
          make_cell(height: 24, border_width: 0.5),
          make_cell(border_width: 0.5)
        ],
        [
          make_cell(height: 24, border_width: 0.5),
          make_cell(border_width: 0.5)
        ],
        [
          make_cell(height: 24, border_width: 0.5),
          make_cell(border_width: 0.5)
        ]
      ]){
      }
    }

    bounding_box([577, 458], width: 700, height: 500) {
      table([
        [
          make_cell(width: 124, height: 24, border_width: 0.5)
        ],
        [
          make_cell(height: 24, border_width: 0.5)
        ],
        [
          make_cell(height: 24, border_width: 0.5)
        ],
        [
          make_cell(height: 24, border_width: 0.5)
        ]
      ]){
      }
    }

    draw_text '資料種別', size: 10.6, at: [36, 351]
    draw_text '相手方番号', size: 10.4, at: [100, 351]
    draw_text '処', size: 10.6, at: [173, 351]
    draw_text '理', size: 10.6, at: [191, 351]
    draw_text '年', size: 10.6, at: [209, 351]
    draw_text '月', size: 10, at: [228, 351]
    draw_text '日', size: 9.5, at: [247, 351]
    draw_text '物品区分', size: 10.6, at: [267, 351]
    draw_text '要 求 番 号', size: 10.6, at: [320, 351]
    draw_text '証 書 番 号', size: 10.6, at: [383, 351]
    draw_text '記録区分', size: 10.6, at: [445.5, 351]
    draw_text '納　　　期', size: 10.6, at: [498, 351]
    draw_text '分納区分', size: 10.6, at: [562, 351]
    draw_text '備考', size: 10.6, at: [614, 351]
    draw_text '・', size: 14, at: [507, 322.5]
    draw_text '・', size: 14, at: [528, 322.5]
    draw_text '1', size: 10.5, at: [568.5, 335]
    draw_text '2', size: 10.5, at: [590, 335]
    draw_text '3', size: 10.5, at: [568.5, 324]
    draw_text 'X', size: 10.5, at: [589.5, 324]
    bounding_box([31, 362], width: 700, height: 500) {
      table([
        [
          make_cell(width: 52.5, height: 15, border_width: 0.5),
          make_cell(width: 84, border_width: 0.5),
          make_cell(width: 94.5, border_width: 0.5),
          make_cell(width: 52.5, border_width: 0.5),
          make_cell(width: 63, border_width: 0.5),
          make_cell(width: 63, border_width: 0.5),
          make_cell(width: 52.5, border_width: 0.5),
          make_cell(width: 63, border_width: 0.5),
          make_cell(width: 52.5, border_width: 0.5),
          make_cell(rowspan: 2, width: 92.5, border_width: 0.5),
        ],
        [
          make_cell(height: 28, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ]
      ]){
      }
    }

    draw_text '番号', size: 10.4, at: [36, 303]
    draw_text '物　品　番　号', size: 10.4, at: [79, 303]
    draw_text '品　　　　名', size: 10.4, at: [183, 304]
    draw_text '会 社 部 品 番 号', size: 10, at: [267, 309]
    draw_text '又　は　規　格', size: 10.6, at: [267, 298]
    draw_text '程度', size: 10.3, at: [352, 304]
    draw_text '単位', size: 10.3, at: [383, 304]
    draw_text '数　量', size: 10.3, at: [415, 304]
    draw_text '単　価', size: 10.3, at: [462, 304]
    draw_text '金　　　　　額', size: 10.5, at: [519, 303]
    draw_text '受　領', size: 10.5, at: [614, 309]
    draw_text '数　量', size: 10.5, at: [614, 298]
    draw_text '処　　置', size: 10, at: [656, 309]
    draw_text 'コ ー ド', size: 11.3, at: [656, 298]
    bounding_box([31, 319], width: 700, height: 500) {
      table([
        [
          make_cell(width: 31.5, height: 24, border_width: 0.5),
          make_cell(width: 105, border_width: 0.5),
          make_cell(width: 94.5, border_width: 0.5),
          make_cell(width: 84, border_width: 0.5),
          make_cell(width: 31.5, border_width: 0.5),
          make_cell(width: 31.5, border_width: 0.5),
          make_cell(width: 41.5, border_width: 0.5),
          make_cell(width: 53, border_width: 0.5),
          make_cell(width: 105, border_width: 0.5), 
          make_cell(width: 42, border_width: 0.5), 
          make_cell(width: 50.5, border_width: 0.5) 
        ],
        [
          make_cell(height: 27.5, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ],
        [
          make_cell(height: 24.5, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ],
        [
          make_cell(height: 28.5, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ],
        [
          make_cell(height: 28, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5)
        ]
      ]){
      }
    }

    bounding_box([31, 186.5], width: 700, height: 500) {
      table([
        [
          make_cell(rowspan: 3, width: 31.5, border_width: 0.5),
          make_cell(width: 94.5, height: 23.5, border_width: 0.5),
          make_cell(width: 84, border_width: 0.5),
          make_cell(width: 73.5, border_width: 0.5),
          make_cell(width: 63, border_width: 0.5),
          make_cell(rowspan: 3, width: 31.5, border_width: 0.5),
          make_cell(rowspan: 3, width: 292, border_width: 0.5)
        ],
        [
          make_cell(height: 24, border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(border_width: 0.5),
          make_cell(rowspan: 2, border_width: 0.5)
        ],
        [
          make_cell(colspan: 3, height: 48, border_width: 0.5)
        ]
      ]){
      }
    }

    bounding_box([503.5, 91], width: 700, height: 500) {
      table([
        [
          make_cell(rowspan: 3, width: 197.5, height: 15, border_width: 0.5)
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