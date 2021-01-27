class DeliveryPdf < Prawn::Document
  def initialize(delivery)
    super(page_size: 'A4', page_layout: :landscape) # 縦 = :portrait, 横 = :landscape
    @delivery = delivery

    font_families.update('jp_font' => { normal: 'vendor/fonts/ipaexm.ttf', bold: 'vendor/fonts/ipaexg.ttf' }) # 日本語フォント
    font 'jp_font', style: :normal
    
    body
    delivery_data

    def details
      @delivery['record']['use_quote_data']['value'].present? ? 'estimate_details' : 'contract_details'
    end

    @first_line = 0
    @second_line = 1
    @third_line = 2
    @fouth_line = 3
    @page_num = 1

    products_data
    # development
    ((@delivery['record'][details]['value'].count.to_f)).ceil.times do |i|
      if i % 4 == 0
        if i > 3
          @first_line = i
          @second_line = i + 1
          @third_line = i + 2
          @fouth_line = i + 3
          @page_num = (i / 4) + 1

          start_new_page
          body
          delivery_data
          products_data
        end
      end
    end
  end

  def body
    draw_text '別紙様式第３０－２', size: 10.3, at: [631, 478]
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
    draw_text @delivery['record']['company_address']['value'], size: 9, at: [78, 420]
    draw_text @delivery['record']['company_name']['value'], size: 10, at: [78, 405]
    draw_text "代表取締役 #{@delivery['record']['director']['value']}", size: 10, at: [78, 390]

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
    draw_text '品　　　　名', size: 10.4, at: [183, 303]
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

    draw_text '検', size: 10.4, at: [39, 155]
    draw_text '査', size: 10.4, at: [39, 113]
    draw_text '指令番号', size: 10.4, at: [68, 176.5]
    draw_text '方式', size: 10.4, at: [163, 176.5]
    draw_text '納入年月日', size: 10.3, at: [247, 176.5]
    draw_text '判定', size: 10.4, at: [320, 176.5]
    draw_text '種類', size: 10.4, at: [68, 153]
    draw_text '場所', size: 10.4, at: [163, 153]
    draw_text '検査年月日', size: 10.4, at: [247, 153]
    draw_text '所見', size: 10.4, at: [320, 152]
    draw_text '上記のとおり検査結果を報告する。', size: 10.5, at: [79, 128]
    draw_text '年', size: 10.5, at: [142, 117]
    draw_text '月', size: 9.5, at: [174, 117]
    draw_text '日', size: 9, at: [206, 117]
    draw_text '検査官所属', size: 10.5, at: [79, 106]
    draw_text '官職氏名', size: 10.5, at: [79, 95]
    draw_text "\u329e", size: 10.7, at: [257, 95]
    draw_text '受', size: 10.4, at: [386, 166.5]
    draw_text '入', size: 10.4, at: [386, 145.5]
    draw_text '・', size: 13, at: [384.5, 134]
    draw_text '受', size: 10.4, at: [386, 124.5]
    draw_text '領', size: 11, at: [386, 103]
    draw_text '検査結果及び物品管理官の受入命令（受領命令）により', size: 10.5, at: [425, 162.5]
    draw_text '受領した。', size: 10.5, at: [414, 152]
    draw_text '年', size: 10.5, at: [487.5, 130]
    draw_text '月', size: 9.5, at: [520, 130]
    draw_text '日', size: 9, at: [552, 130]
    draw_text '受', size: 10.5, at: [425, 119]
    draw_text '領', size: 10.5, at: [441, 119]
    draw_text '者', size: 10.5, at: [457, 119]
    draw_text '所　　属', size: 10.5, at: [425, 108]
    draw_text '官職氏名', size: 10.5, at: [425, 97]
    draw_text "\u329e", size: 10.7, at: [635, 97]
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

    draw_text 'ページ中の第　　　　ページ', size: 10.5, at: [559, 80]  
    bounding_box([503.5, 91], width: 700, height: 500) {
      table([
        [
          make_cell(rowspan: 3, width: 197.5, height: 15, border_width: 0.5)
        ]
      ]){
      }
    }

    draw_text '規格：Ａ列４番', size: 10.5, at: [622.5, 62.5]  
  end

  def delivery_data
    draw_text @delivery['record']['delivery_place']['value'], size: 11, at: [78, 462]
    draw_text @delivery['record']['request_number']['value'], size: 9, at: [267, 436]
    draw_text @delivery['record']['authorization_number']['value'], size: 9, at: [267, 412]
    draw_text @delivery['record']['contract_date']['value'], size: 9, at: [267, 388]
    draw_text @delivery['record']['contract_delivery_date']['value'], size: 9, at: [267, 364]
  end

  def standard_1
    @delivery['record']['use_quote_data']['value'].present? ? 'estimate_standard_1' : 'contract_standard_1'
  end

  def standard_2
    @delivery['record']['use_quote_data']['value'].present? ? 'estimate_standard_2' : 'contract_standard_2'
  end

  def product_name
    @delivery['record']['use_quote_data']['value'].present? ? 'estimate_product_name' : 'contract_product_name'
  end

  def unit
    @delivery['record']['use_quote_data']['value'].present? ? 'estimate_unit' : 'contract_unit'
  end

  def quantity
    @delivery['record']['use_quote_data']['value'].present? ? 'estimate_quantity' : 'contract_quantity'
  end

  def unit_price
    @delivery['record']['use_quote_data']['value'].present? ? 'estimate_unit_price' : 'contract_unit_price'
  end

  def subtotal_price
    @delivery['record']['use_quote_data']['value'].present? ? 'estimate_subtotal_price' : 'contract_subtotal_price'
  end

  def value_num_present?(value_num)
    @delivery['record'][details]['value'][value_num].present?
  end

  def products_data
    if value_num_present?(@first_line)
      draw_text @delivery['record'][details]['value'][@first_line]['value'][standard_1]['value'], size: 7, at: [65, 277]
      draw_text @delivery['record'][details]['value'][@first_line]['value'][product_name]['value'], size: 7, at: [170, 277]
      draw_text @delivery['record'][details]['value'][@first_line]['value'][standard_2]['value'], size: 6, at: [265, 277]
      draw_text @delivery['record'][details]['value'][@first_line]['value'][unit]['value'], size: 6, at: [388, 277]
    end

    if value_num_present?(@second_line)
      draw_text @delivery['record'][details]['value'][@second_line]['value'][standard_1]['value'], size: 7, at: [65, 252]
      draw_text @delivery['record'][details]['value'][@second_line]['value'][product_name]['value'], size: 7, at: [170, 252]
      draw_text @delivery['record'][details]['value'][@second_line]['value'][standard_2]['value'], size: 6, at: [265, 252]
      draw_text @delivery['record'][details]['value'][@second_line]['value'][unit]['value'], size: 6, at: [388, 252]
    end

    if value_num_present?(@third_line)
      draw_text @delivery['record'][details]['value'][@third_line]['value'][standard_1]['value'], size: 7, at: [65, 226]
      draw_text @delivery['record'][details]['value'][@third_line]['value'][product_name]['value'], size: 7, at: [170, 226]
      draw_text @delivery['record'][details]['value'][@third_line]['value'][standard_2]['value'], size: 6, at: [265, 226]
      draw_text @delivery['record'][details]['value'][@third_line]['value'][unit]['value'], size: 6, at: [388, 226]
    end

    if value_num_present?(@fouth_line)
      draw_text @delivery['record'][details]['value'][@fouth_line]['value'][standard_1]['value'], size: 7, at: [65, 200] 
      draw_text @delivery['record'][details]['value'][@fouth_line]['value'][product_name]['value'], size: 7, at: [170, 200]
      draw_text @delivery['record'][details]['value'][@fouth_line]['value'][standard_2]['value'], size: 6, at: [265, 200]
      draw_text @delivery['record'][details]['value'][@fouth_line]['value'][unit]['value'], size: 6, at: [388, 200]
    end

    def estimate_quantity(value_num)
      @delivery['record'][details]['value'][value_num]['value'][quantity]['value'].to_i.to_s(:delimited) if value_num_present?(value_num)
    end

    def estimate_unit_price(value_num)
      @delivery['record'][details]['value'][value_num]['value'][unit_price]['value'].to_i.to_s(:delimited) if value_num_present?(value_num)
    end

    def estimate_subtotal_price(value_num)
      @delivery['record'][details]['value'][value_num]['value'][subtotal_price]['value'].to_i.to_s(:delimited) if value_num_present?(value_num)
    end

    bounding_box([395, 288], width: 700, height: 700){
      table([
        [
          make_cell(content: estimate_quantity(@first_line), align: :right, size: 7, width: 54, height: 25),
          make_cell(content: estimate_unit_price(@first_line), align: :right, size: 7, width: 54),
          make_cell(content: estimate_subtotal_price(@first_line), align: :right, size: 7, width: 105)
        ],
        [
          make_cell(content: estimate_quantity(@second_line), align: :right, size: 7, width: 54, height: 25),
          make_cell(content: estimate_unit_price(@second_line), align: :right, size: 7, width: 54),
          make_cell(content: estimate_subtotal_price(@second_line), align: :right, size: 7, width: 105)
        ],
        [
          make_cell(content: estimate_quantity(@third_line), align: :right, size: 7, width: 54, height: 27),
          make_cell(content: estimate_unit_price(@third_line), align: :right, size: 7, width: 54),
          make_cell(content: estimate_subtotal_price(@third_line), align: :right, size: 7, width: 105)
        ],
        [
          make_cell(content: estimate_quantity(@fouth_line), align: :right, size: 7, width: 54, height: 23),
          make_cell(content: estimate_unit_price(@fouth_line), align: :right, size: 7, width: 54),
          make_cell(content: estimate_subtotal_price(@fouth_line), align: :right, size: 7, width: 105)
        ]
      ]){
        cells.borders = []
      }
    }

    # xページ中の第xページ
    draw_text (@delivery['record'][details]['value'].count / 4.to_f).ceil, size: 11, at: [530, 80]
    draw_text @page_num, size: 11, at: [640, 80]
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