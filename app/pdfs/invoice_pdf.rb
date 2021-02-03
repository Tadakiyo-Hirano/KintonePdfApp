class InvoicePdf < Prawn::Document
  def initialize(invoice)
    super(page_size: 'A4', page_layout: :portrait) # 縦 = :portrait, 横 = :landscape
    @invoice = invoice

    font_families.update('jp_font' => { normal: 'vendor/fonts/ipaexm.ttf', bold: 'vendor/fonts/ipaexg.ttf' }) # 日本語フォント
    font 'jp_font', style: :normal

    @use_invoice = @invoice['record']['use_invoice']['value']

    body
    invoice_data

    def details
      if @use_invoice.include?("見積")
        'estimate_details'
      elsif @use_invoice.include?('納品')
        'contract_details'
      elsif @use_invoice.include?('請求')
        'invoice_details'
      end
    end
    
    @first_line = 0
    @second_line = 1
    @third_line = 2
    @fouth_line = 3
    @five_line = 4
    @six_line = 5
    @seven_line = 6
    @eight_line = 7
    @nine_line = 8
    @page_num = 1

    products_data
    # development

    ((@invoice['record'][details]['value'].count.to_f)).ceil.times do |i|
      if i % 9 == 0
        if i > 8
          @first_line = i
          @second_line = i + 1
          @third_line = i + 2
          @fouth_line = i + 3
          @five_line = i + 4
          @six_line = i + 5
          @seven_line = i + 6
          @eight_line = i + 7
          @nine_line = i + 8
          @page_num = (i / 9) + 1

          start_new_page
          body
          invoice_data
          products_data
        end
      end
    end
  end

  def body
    bounding_box([55, 699], width: 700, height: 700) {
      table([
        [
          make_cell(width: 462, height: 660, border_width: 0.5)
        ]
      ]){
      }
    }

    draw_text '別', size: 11, at: [433.5, 713]
    draw_text '紙', size: 11, at: [445.5, 713]
    draw_text '様', size: 11, at: [457, 713]
    draw_text '式', size: 11, at: [469, 713]
    draw_text '第', size: 11, at: [481, 713]
    draw_text '３', size: 11, at: [493, 713]
    draw_text '７', size: 11, at: [505, 713]

    draw_text '請 　　　求 　　　書', size: 11, at: [233, 677]
    self.line_width = 0.5
    stroke_horizontal_line 181.5, 373.5, at: 669
    stroke_horizontal_line 181.5, 373.5, at: 668

    draw_text '年', size: 11, at: [433, 642]
    draw_text '月', size: 10, at: [470, 642]
    draw_text '日', size: 10, at: [506, 642]

    draw_text '殿', size: 10.5, at: [220, 594]
    self.line_width = 0.8
    stroke_horizontal_line 59.5, 239.5, at: 586

    draw_text '住　　所', size: 11, at: [258.5, 546]
    draw_text '会', size: 11, at: [258.5, 534]
    draw_text '社', size: 11, at: [275, 534]
    draw_text '名', size: 10.5, at: [292, 534]
    draw_text '代', size: 11, at: [260, 522]
    draw_text '表', size: 11, at: [271.5, 522]
    draw_text '者', size: 11, at: [283, 522]
    draw_text '名', size: 11, at: [295, 522]
    draw_text '印', size: 11, at: [474.3, 522]

    draw_text '金　 額', size: 10.5, at: [154, 487]
    bounding_box([139, 508], width: 700, height: 700) {
      table([
        [
          make_cell(width: 59, height: 38.5, border_width: 0.5),
          make_cell(width: 229, border_width: 0.5)
        ]
      ]){
      }
    }

    draw_text '上', size: 10.5, at: [66.5, 449]
    draw_text '記', size: 10.5, at: [78.5, 449.5]
    draw_text 'の', size: 10.5, at: [90.5, 449.5]
    draw_text '金', size: 10.5, at: [102.5, 449.5]
    draw_text '額', size: 10.5, at: [114.5, 449.5]
    draw_text 'を', size: 10.5, at: [126.5, 449.5]
    draw_text '請', size: 10.5, at: [138.5, 449.5]
    draw_text '求', size: 10.5, at: [150.5, 449.5]
    draw_text 'し', size: 10.5, at: [162.5, 449.5]
    draw_text 'ま', size: 10.5, at: [174.5, 449.5]
    draw_text 'す', size: 10.5, at: [186.5, 449.5]
    draw_text '。', size: 10.5, at: [198, 449.5]

    draw_text '品 　　　　　　　名', size: 10, at: [66, 383]
    draw_text '規  　　格', size: 10, at: [198, 383]
    draw_text '単位', size: 11, at: [277, 383]
    draw_text '数  　　量', size: 10, at: [314, 383]
    draw_text '単    価', size: 11, at: [373, 383]
    draw_text '金          額', size: 11, at: [438, 383]
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

    draw_text '銀', size: 10.5, at: [100.5, 53]
    draw_text '行', size: 10.5, at: [112, 53]
    draw_text '支', size: 10.5, at: [172, 53]
    draw_text '店', size: 10.5, at: [184, 53]
    draw_text '当', size: 10.5, at: [219.5, 53]
    draw_text '座', size: 10.5, at: [231.5, 53]
    draw_text '・', size: 12, at: [242.5, 52]
    draw_text '普', size: 10.5, at: [255, 52]
    draw_text '通', size: 10.5, at: [267, 52]
    draw_text 'へ', size: 11, at: [359, 52]
    draw_text 'お', size: 11, at: [371, 52]
    draw_text '振', size: 10.8, at: [383, 52]
    draw_text 'り', size: 10.8, at: [395, 52]
    draw_text '込', size: 10.8, at: [407, 52]
    draw_text 'み', size: 10.8, at: [419, 52]
    draw_text 'く', size: 10.8, at: [431, 52]
    draw_text 'だ', size: 10.8, at: [443, 52]
    draw_text 'さ', size: 10.8, at: [455, 52]
    draw_text 'い', size: 10.8, at: [467, 52]
    draw_text '。', size: 10.8, at: [479, 52]
  end

  def invoice_data
    draw_text @invoice['record']['company_address']['value'], size: 9, at: [310, 546]
    draw_text @invoice['record']['company_name']['value'], size: 10, at: [310, 534]
    draw_text "代表取締役 #{@invoice['record']['director']['value']}", size: 10, at: [310, 522]

    draw_text @invoice['record']['bank_name']['value'], size: 10, at: [65, 53]
    draw_text @invoice['record']['branch_name']['value'], size: 10, at: [130, 53]

    bank_account_type = @invoice['record']['bank_account_type']['value']
    if bank_account_type == '当座'
      stroke_ellipse [228,56], 18, 13
    elsif bank_account_type == '普通'
      stroke_ellipse [269,56], 18, 13
    end

    draw_text @invoice['record']['bank_account_number']['value'], size: 10, at: [300, 53]
  end

  def standard_1
    if @use_invoice.include?("見積")
      'estimate_standard_1'
    elsif @use_invoice.include?('納品')
      'contract_standard_1'
    elsif @use_invoice.include?('請求')
      'invoice_standard_1'
    end
  end

  def standard_2
    if @use_invoice.include?("見積")
      'estimate_standard_2'
    elsif @use_invoice.include?('納品')
      'contract_standard_2'
    elsif @use_invoice.include?('請求')
      'invoice_standard_2'
    end
  end

  def product_name
    if @use_invoice.include?("見積")
      'estimate_product_name'
    elsif @use_invoice.include?('納品')
      'contract_product_name'
    elsif @use_invoice.include?('請求')
      'invoice_product_name'
    end
  end

  def unit
    if @use_invoice.include?("見積")
      'estimate_unit'
    elsif @use_invoice.include?('納品')
      'contract_unit'
    elsif @use_invoice.include?('請求')
      'invoice_unit'
    end
  end

  def value_num_present?(value_num)
    @invoice['record'][details]['value'][value_num].present?
  end

  def products_data
    if value_num_present?(@first_line)
      draw_text @invoice['record'][details]['value'][@first_line]['value'][product_name]['value'], size: 7, at: [57, 351]
      draw_text @invoice['record'][details]['value'][@first_line]['value'][standard_1]['value'], size: 7, at: [178, 359]
      draw_text @invoice['record'][details]['value'][@first_line]['value'][standard_2]['value'], size: 6, at: [178, 345]
      draw_text @invoice['record'][details]['value'][@first_line]['value'][unit]['value'], size: 7, at: [284, 351]
      # draw_text below_is_the_margin, size: 7, at: [65, 252] unless value_num_present?(@second_line)
    end

    if value_num_present?(@second_line)
      draw_text @invoice['record'][details]['value'][@second_line]['value'][product_name]['value'], size: 7, at: [57, 320]
      draw_text @invoice['record'][details]['value'][@second_line]['value'][standard_1]['value'], size: 7, at: [178, 326]
      draw_text @invoice['record'][details]['value'][@second_line]['value'][standard_2]['value'], size: 6, at: [178, 312]
      draw_text @invoice['record'][details]['value'][@second_line]['value'][unit]['value'], size: 7, at: [284, 320]
      # draw_text below_is_the_margin, size: 7, at: [65, 252] unless value_num_present?(@third_line)
    end

    if value_num_present?(@third_line)
      draw_text @invoice['record'][details]['value'][@third_line]['value'][product_name]['value'], size: 7, at: [57, 286]
      draw_text @invoice['record'][details]['value'][@third_line]['value'][standard_1]['value'], size: 7, at: [178, 292]
      draw_text @invoice['record'][details]['value'][@third_line]['value'][standard_2]['value'], size: 6, at: [178, 278]
      draw_text @invoice['record'][details]['value'][@third_line]['value'][unit]['value'], size: 7, at: [284, 286]
      # draw_text below_is_the_margin, size: 7, at: [65, 252] unless value_num_present?(@fouth_line)
    end

    if value_num_present?(@fouth_line)
      draw_text @invoice['record'][details]['value'][@fouth_line]['value'][product_name]['value'], size: 7, at: [57, 252]
      draw_text @invoice['record'][details]['value'][@fouth_line]['value'][standard_1]['value'], size: 7, at: [178, 259]
      draw_text @invoice['record'][details]['value'][@fouth_line]['value'][standard_2]['value'], size: 6, at: [178, 245]
      draw_text @invoice['record'][details]['value'][@fouth_line]['value'][unit]['value'], size: 7, at: [284, 252]
      # draw_text below_is_the_margin, size: 7, at: [65, 252] unless value_num_present?(@five_line)
    end

    if value_num_present?(@five_line)
      draw_text @invoice['record'][details]['value'][@five_line]['value'][product_name]['value'], size: 7, at: [57, 218]
      draw_text @invoice['record'][details]['value'][@five_line]['value'][standard_1]['value'], size: 7, at: [178, 225]
      draw_text @invoice['record'][details]['value'][@five_line]['value'][standard_2]['value'], size: 6, at: [178, 211]
      draw_text @invoice['record'][details]['value'][@five_line]['value'][unit]['value'], size: 7, at: [284, 218]
      # draw_text below_is_the_margin, size: 7, at: [65, 252] unless value_num_present?(@six_line)
    end

    if value_num_present?(@six_line)
      draw_text @invoice['record'][details]['value'][@six_line]['value'][product_name]['value'], size: 7, at: [57, 186]
      draw_text @invoice['record'][details]['value'][@six_line]['value'][standard_1]['value'], size: 7, at: [178, 193]
      draw_text @invoice['record'][details]['value'][@six_line]['value'][standard_2]['value'], size: 6, at: [178, 179]
      draw_text @invoice['record'][details]['value'][@six_line]['value'][unit]['value'], size: 7, at: [284, 186]
      # draw_text below_is_the_margin, size: 7, at: [65, 252] unless value_num_present?(@seven_line)
    end

    if value_num_present?(@seven_line)
      draw_text @invoice['record'][details]['value'][@seven_line]['value'][product_name]['value'], size: 7, at: [57, 154]
      draw_text @invoice['record'][details]['value'][@seven_line]['value'][standard_1]['value'], size: 7, at: [178, 161]
      draw_text @invoice['record'][details]['value'][@seven_line]['value'][standard_2]['value'], size: 6, at: [178, 147]
      draw_text @invoice['record'][details]['value'][@seven_line]['value'][unit]['value'], size: 7, at: [284, 154]
      # draw_text below_is_the_margin, size: 7, at: [65, 252] unless value_num_present?(@eight_line)
    end

    if value_num_present?(@eight_line)
      draw_text @invoice['record'][details]['value'][@eight_line]['value'][product_name]['value'], size: 7, at: [57, 121]
      draw_text @invoice['record'][details]['value'][@eight_line]['value'][standard_1]['value'], size: 7, at: [178, 128]
      draw_text @invoice['record'][details]['value'][@eight_line]['value'][standard_2]['value'], size: 6, at: [178, 114]
      draw_text @invoice['record'][details]['value'][@eight_line]['value'][unit]['value'], size: 7, at: [284, 121]
      # draw_text below_is_the_margin, size: 7, at: [65, 252] unless value_num_present?(@nine_line)
    end

    if value_num_present?(@nine_line)
      draw_text @invoice['record'][details]['value'][@nine_line]['value'][product_name]['value'], size: 7, at: [57, 88]
      draw_text @invoice['record'][details]['value'][@nine_line]['value'][standard_1]['value'], size: 7, at: [178, 95]
      draw_text @invoice['record'][details]['value'][@nine_line]['value'][standard_2]['value'], size: 6, at: [178, 81]
      draw_text @invoice['record'][details]['value'][@nine_line]['value'][unit]['value'], size: 7, at: [284, 88]
    end
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