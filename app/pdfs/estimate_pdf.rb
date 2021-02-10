class EstimatePdf < Prawn::Document
  def initialize(estimate)
    super(page_size: 'A4', page_layout: :portrait) # 縦 = :portrait, 横 = :landscape
    @estimate = estimate
    @table_data = @estimate['record']['estimate_details']['value']

    font_families.update('jp_font' => { normal: 'vendor/fonts/ipaexm.ttf', bold: 'vendor/fonts/ipaexg.ttf' }) # 日本語フォント
    font 'jp_font', style: :normal

    body
    data
    @estimate['record']['use_breakdown']['value'].blank? ? products_data : use_breakdown_data
    development
  end

  def body
    draw_text '見 　　　　積 　　　　書', size: 12, at: [194, 667]

    draw_text '件名リスト一連番号', size: 11, at: [32, 614]
    bounding_box([26, 629], width: 700, height: 90) {
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
      
      draw_text '品 　　　名', size: 10, at: [55, 541]
      draw_text '規 　　　格', size: 10, at: [155, 541]
      draw_text '単　位', size: 11, at: [240, 541]
      draw_text '数　量', size: 11, at: [296, 541]
      draw_text '単　価', size: 11, at: [350, 541]
      draw_text '金　　　額', size: 11, at: [418, 541]

      draw_text '納　入(履行)場　所', size: 11, at: [34, 357]
      draw_text '納　　期', size: 10.5, at: [259, 357]
      draw_text '(履行期限)', size: 10.5, at: [310, 357]
      draw_text '契', size: 11, at: [38, 335]
      draw_text '約', size: 11, at: [57, 335]
      draw_text '保', size: 11, at: [76, 335]
      draw_text '証', size: 11, at: [95, 335]
      draw_text '金', size: 11, at: [114, 335]
      draw_text '免　　　除', size: 11, at: [170, 335.5]
      draw_text '見', size: 10.5, at: [268, 335]
      draw_text '積', size: 10.5, at: [280, 335]
      draw_text '書', size: 10.5, at: [292, 335]
      draw_text '有', size: 10.5, at: [304, 335]
      draw_text '効', size: 10.5, at: [316, 335]
      draw_text '期', size: 10.5, at: [328, 335]
      draw_text '間', size: 10.5, at: [340, 335]

      bounding_box([26, 556], width: 700, height: 700) {
        table([
          [
            make_cell(width: 111, height: 23),
            make_cell(width: 89),
            make_cell(width: 59),
            make_cell(width: 54),
            make_cell(width: 54),
            make_cell(width: 104)
          ],
          [
            make_cell(width: 111, height: 23),
            make_cell(width: 89),
            make_cell(width: 59),
            make_cell(width: 54),
            make_cell(width: 54),
            make_cell(width: 104)
          ],
          [
            make_cell(width: 111, height: 23),
            make_cell(width: 89),
            make_cell(width: 59),
            make_cell(width: 54),
            make_cell(width: 54),
            make_cell(width: 104)
          ],
          [
            make_cell(width: 111, height: 23),
            make_cell(width: 89),
            make_cell(width: 59),
            make_cell(width: 54),
            make_cell(width: 54),
            make_cell(width: 104)
          ],
          [
            make_cell(width: 111, height: 23),
            make_cell(width: 89),
            make_cell(width: 59),
            make_cell(width: 54),
            make_cell(width: 54),
            make_cell(width: 104)
          ],
          [
            make_cell(width: 111, height: 23),
            make_cell(width: 89),
            make_cell(width: 59),
            make_cell(width: 54),
            make_cell(width: 54),
            make_cell(width: 104)
          ],
          [
            make_cell(width: 111, height: 23),
            make_cell(width: 89),
            make_cell(width: 59),
            make_cell(width: 54),
            make_cell(width: 54),
            make_cell(width: 104)
          ],
          [
            make_cell(width: 111, height: 23),
            make_cell(width: 89),
            make_cell(width: 59),
            make_cell(width: 54),
            make_cell(width: 54),
            make_cell(width: 104)
          ]
        ]){
        }
      }

        draw_text '上記に関して「入札及び契約心得」、', size: 10.3, at: [38, 284]
        draw_text '「オープンカウンター方式実施要領」及び「標準契約書等」', size: 10.3, at: [214, 284]
        draw_text 'の契約条項等を承諾のうえ見積りいたします。また、当社', size: 10.3, at: [28, 266]
        draw_text '(私(個人の場合) 、当団体(団体の場合））', size: 10.4, at: [297, 266]
        draw_text 'は「入札及び契約心得」に示された暴力団排除に関する誓約事項について誓約いたします。', size: 10.3, at: [28, 248]

        draw_text '年', size: 11, at: [52, 195]
        draw_text '月', size: 9.5, at: [83, 195]
        draw_text '日', size: 9.5, at: [119, 195]
        draw_text '分任支出負担行為担当官', size: 10.8, at: [28, 172]
        draw_text '(分任契約担当官)', size: 10.6, at: [29, 161]
        draw_text '陸上自衛隊東北補給処', size: 10.6, at: [28, 149]
        draw_text '調達会計部長', size: 10.6, at: [28, 138]
        draw_text '殿', size: 10.6, at: [198, 138]

        draw_text '住　　所', size: 11, at: [228, 128]
        draw_text '：', size: 11, at: [276.5, 127]
        draw_text '会', size: 11, at: [228, 109]
        draw_text '社', size: 11, at: [244, 109]
        draw_text '名', size: 11, at: [260, 109]
        draw_text '：', size: 11, at: [276.5, 108]
        draw_text '代表者名', size: 11, at: [228, 90]
        draw_text '：', size: 11, at: [276.5, 89]
        draw_text "\u329e", size: 11, at: [464, 90]

        bounding_box([26, 372], width: 700, height: 700) {
          table([
            [
              make_cell(width: 111, height: 22),
              make_cell(width: 118.5),
              make_cell(width: 108.5),
              make_cell(width: 133)
            ],
            [
              make_cell(width: 111, height: 22),
              make_cell(width: 118.5),
              make_cell(width: 108.5),
              make_cell(width: 133)
            ]
          ]){
          }
        }

          bounding_box([26, 372], width: 700, height: 700) {
            table([
              [
                make_cell(width: 111, height: 22),
                make_cell(width: 118.5),
                make_cell(width: 108.5),
                make_cell(width: 133)
              ],
              [
                make_cell(width: 111, height: 22),
                make_cell(width: 118.5),
                make_cell(width: 108.5),
                make_cell(width: 133)
              ]
            ]){
            }
          }
  end

  def data
    draw_text @estimate['record']['serial_number']['value'], size: 11, at: [155, 614]

    estimate_total_price = @estimate['record']['estimate_total_price']['value'].to_i.to_s(:delimited)
    draw_text estimate_total_price + '.-', size: 12, at: [100, 574]

    draw_text @estimate['record']['estimate_delivery_place']['value'], size: 11, at: [155, 357]
    draw_text @estimate['record']['estimate_delivery_date']['value'], size: 11, at: [375, 357]
    draw_text @estimate['record']['expiration_date']['value'], size: 11, at: [375, 335]
    
    # 見積作成日
    bounding_box([5, 210], width: 700, height: 700){
      table([
        [
          make_cell(content: @estimate['record']['estimated_date_year']['value'], align: :right, size: 10, width: 45),
          make_cell(content: @estimate['record']['estimated_date_month']['value'], align: :right, size: 10, width: 35),
          make_cell(content: @estimate['record']['estimated_date_day']['value'], align: :right, size: 10, width: 36)
        ]
      ]){
        cells.borders = []
      }
    }

    # 住所
    draw_text @estimate['record']['company_address']['value'], size: 11, at: [290, 128]
    draw_text @estimate['record']['company_name']['value'], size: 11, at: [290, 109]
    draw_text @estimate['record']['director']['value'], size: 11, at: [290, 90]
  end

  def products_data
    # 品名
    def estimate_product_name(value_num)
      @estimate['record']['estimate_details']['value'][value_num]['value']['estimate_product_name']['value'] if @table_data[value_num].present?
    end
    
    draw_text estimate_product_name(0), size: 8, at: [30, 518]
    draw_text estimate_product_name(1), size: 8, at: [30, 495]
    draw_text estimate_product_name(2), size: 8, at: [30, 472]
    draw_text estimate_product_name(3), size: 8, at: [30, 449]
    draw_text estimate_product_name(4), size: 8, at: [30, 426]
    draw_text estimate_product_name(5), size: 8, at: [30, 403]
    draw_text estimate_product_name(6), size: 8, at: [30, 380]

    # 規格(上段)
    def estimate_standard_1(value_num)
      @estimate['record']['estimate_details']['value'][value_num]['value']['estimate_standard_1']['value'] if @table_data[value_num].present?
    end

    draw_text estimate_standard_1(0), size: 6, at: [140, 525]
    draw_text estimate_standard_1(1), size: 6, at: [140, 502]
    draw_text estimate_standard_1(2), size: 6, at: [140, 479]
    draw_text estimate_standard_1(3), size: 6, at: [140, 456]
    draw_text estimate_standard_1(4), size: 6, at: [140, 433]
    draw_text estimate_standard_1(5), size: 6, at: [140, 410]
    draw_text estimate_standard_1(5), size: 6, at: [140, 387]

    # 規格(下段)
    def estimate_standard_2(value_num)
      @estimate['record']['estimate_details']['value'][value_num]['value']['estimate_standard_2']['value'] if @table_data[value_num].present?
    end

    draw_text estimate_standard_2(0), size: 6, at: [140, 515]
    draw_text estimate_standard_2(1), size: 6, at: [140, 492]
    draw_text estimate_standard_2(2), size: 6, at: [140, 469]
    draw_text estimate_standard_2(3), size: 6, at: [140, 446]
    draw_text estimate_standard_2(4), size: 6, at: [140, 423]
    draw_text estimate_standard_2(5), size: 6, at: [140, 400]
    draw_text estimate_standard_2(6), size: 6, at: [140, 377]

    # 単位
    def estimate_unit(value_num)
      @estimate['record']['estimate_details']['value'][value_num]['value']['estimate_unit']['value'] if @table_data[value_num].present?
    end

    draw_text estimate_unit(0), size: 10, at: [250, 517]
    draw_text estimate_unit(1), size: 10, at: [250, 494]
    draw_text estimate_unit(2), size: 10, at: [250, 471]
    draw_text estimate_unit(3), size: 10, at: [250, 448]
    draw_text estimate_unit(4), size: 10, at: [250, 425]
    draw_text estimate_unit(5), size: 10, at: [250, 402]
    draw_text estimate_unit(6), size: 10, at: [250, 379]

    # 数量
    def estimate_quantity(value_num)
      @estimate['record']['estimate_details']['value'][value_num]['value']['estimate_quantity']['value'].to_i.to_s(:delimited) if @table_data[value_num].present?
    end

    bounding_box([285, 533], width: 700, height: 700){
      table([
        [
          make_cell(content: estimate_quantity(0), align: :right, size: 10, width: 54, height: 23)
        ],
        [
          make_cell(content: estimate_quantity(1), align: :right, size: 10, height: 23)
        ],
        [
          make_cell(content: estimate_quantity(2), align: :right, size: 10, height: 23)
        ],
        [
          make_cell(content: estimate_quantity(3), align: :right, size: 10, height: 23)
        ],
        [
          make_cell(content: estimate_quantity(4), align: :right, size: 10, height: 23)
        ],
        [
          make_cell(content: estimate_quantity(5), align: :right, size: 10, height: 23)
        ],
        [
          make_cell(content: estimate_quantity(6), align: :right, size: 10, height: 23)
        ]
      ]){
        cells.borders = [] # 枠線非表示
      }
    }

    # 単価
    def estimate_unit_price(value_num)
      @estimate['record']['estimate_details']['value'][value_num]['value']['estimate_unit_price']['value'].to_i.to_s(:delimited) if @table_data[value_num].present?
    end

    bounding_box([339, 533], width: 700, height: 700){
      table([
        [
          make_cell(content: estimate_unit_price(0), align: :right, size: 9, width: 54, height: 23)
        ],
        [
          make_cell(content: estimate_unit_price(1), align: :right, size: 9, height: 23)
        ],
        [
          make_cell(content: estimate_unit_price(2), align: :right, size: 9, height: 23)
        ],
        [
          make_cell(content: estimate_unit_price(3), align: :right, size: 9, height: 23)
        ],
        [
          make_cell(content: estimate_unit_price(4), align: :right, size: 9, height: 23)
        ],
        [
          make_cell(content: estimate_unit_price(5), align: :right, size: 10, height: 23)
        ],
        [
          make_cell(content: estimate_unit_price(6), align: :right, size: 10, height: 23)
        ]
      ]){
        cells.borders = []
      }
    }

    # 金額(小計)
    def estimate_subtotal_price(value_num)
      @estimate['record']['estimate_details']['value'][value_num]['value']['estimate_subtotal_price']['value'].to_i.to_s(:delimited) if @table_data[value_num].present?
    end

    bounding_box([441, 533], width: 700, height: 700){
      table([
        [
          make_cell(content: estimate_subtotal_price(0), align: :right, size: 9, width: 54, height: 23)
        ],
        [
          make_cell(content: estimate_subtotal_price(1), align: :right, size: 9, height: 23)
        ],
        [
          make_cell(content: estimate_subtotal_price(2), align: :right, size: 9, height: 23)
        ],
        [
          make_cell(content: estimate_subtotal_price(3), align: :right, size: 9, height: 23)
        ],
        [
          make_cell(content: estimate_subtotal_price(4), align: :right, size: 9, height: 23)
        ],
        [
          make_cell(content: estimate_subtotal_price(5), align: :right, size: 10, height: 23)
        ],
        [
          make_cell(content: estimate_subtotal_price(6), align: :right, size: 10, height: 23)
        ]
      ]){
        cells.borders = []
      }
    }
  end

  def use_breakdown_data
    draw_text "#{@estimate['record']['subject']['value']}　#{@estimate['record']['use_breakdown_text']['value']}", size: 10, at: [30, 518]
    draw_text '以下余白', size: 10, at: [140, 495]
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