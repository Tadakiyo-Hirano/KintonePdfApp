class ParticipationPdf < Prawn::Document
  def initialize(participation)
    super(page_size: 'A4', page_layout: :portrait) # 縦 = :portrait, 横 = :landscape
    @participation = participation

    font_families.update('jp_font' => { normal: 'vendor/fonts/ipaexm.ttf', bold: 'vendor/fonts/ipaexg.ttf' }) # 日本語フォント
    font 'jp_font', style: :normal

    body
    data
    # development
  end

  def body
    image 'app/assets/images/sdf.png', at: [34, 739], width: 60
    draw_text 'オープンカウンター参加申込書', size: 16, at: [150, 700]
    draw_text '分任支出負担行為担当官（分任契約担当官）', size: 12, at: [34, 647]
    draw_text '陸上自衛隊東北補給処', size: 12, at: [34, 630]
    draw_text '調達会計部長　　　　　　　　　殿', size: 12, at: [34, 612]

    draw_text '1　件名リスト', size: 11.5, at: [34, 550]
    draw_text '1', size: 11, at: [43, 524]
    draw_text '(  )', size: 11, at: [39, 525.5]
    draw_text '一連番号:', size: 12, at: [61, 524]
    stroke_horizontal_line 209, 308.5, at: 521.5
    draw_text '2', size: 11, at: [43, 498.5]
    draw_text '(  )', size: 11, at: [39, 499]
    draw_text '件　名:', size: 12, at: [61, 498]
    stroke_horizontal_line 209, 358, at: 496
    draw_text '3', size: 11, at: [43, 473]
    draw_text '(  )', size: 11, at: [39, 474.5]
    draw_text '見積書提出期限:', size: 12, at: [61, 473]
    stroke_horizontal_line 209, 358, at: 470
    draw_text '2　見積書提出方法(該当欄に○印)', size: 12, at: [34, 447]

    bounding_box([60, 431], width: 700, height: 90
    ) {
      table([
        [
          make_cell(width: 99.5, height: 12.5),
          make_cell(width: 99.5)
        ],
        [
          make_cell(height: 77),
          make_cell('')
        ]
      ]){

      }
    }
    draw_text '持参', size: 12, at: [98.5, 420.5]
    draw_text '郵送', size: 12, at: [198, 420.5]

    draw_text '参加希望業者等', size: 12, at: [62, 304]
    draw_text '住　所:', size: 12, at: [62, 279]
    draw_text '会社名:', size: 12, at: [62, 261]
    draw_text '代表者名:', size: 12, at: [62, 243]
    draw_text "\u329e", size: 12, at: [360, 243]
    draw_text '担当者名:', size: 12, at: [62, 217]
    draw_text '電話番号:', size: 12, at: [62, 199]
    draw_text 'FAX番号:', size: 12, at: [62, 181]

    draw_text '注意事項', size: 11, at: [62, 145]
    draw_text '1', size: 11, at: [64, 125]
    draw_text '納入・履行の可否について十分検討の上参加して下さい。', size: 11, at: [84, 125]
    draw_text '2', size: 11, at: [64, 107]
    draw_text '件名リスト毎にオープンカウンター参加申込書は１部作成して下さい。', size: 11, at: [84, 107]
    draw_text '複数応募する場合は、別紙を利用して下さい。', size: 11, at: [84, 95]
    draw_text '3', size: 11, at: [64, 78]
    draw_text 'オープンカウンター参加申込書は、「件名リスト」の参加申込期限までに', size: 11, at: [84, 78]
    draw_text '提出して下さい。提出方法は、当初FAX(022-231-1127)で送付をお願いします。', size: 11, at: [73, 66]
  end

  def data
    draw_text @participation["record"]['serial_number']['value'], size: 10, at: [215, 525]
    draw_text @participation["record"]['subject']['value'], size: 10, at: [215, 500]
    draw_text @participation["record"]['estimates_deadline']['value'], size: 10, at: [215, 475]
    
    stroke do
      submission = @participation["record"]['submission']['value']
      if submission == '持参'
        circle [110, 380], 10
      elsif submission == '郵送'
        circle [210, 380], 10
      else
        nil
      end
    end

    draw_text @participation["record"]['company_address']['value'], size: 12, at: [120, 279]
    draw_text @participation["record"]['company_name']['value'], size: 12, at: [120, 261]
    draw_text @participation["record"]['director']['value'], size: 12, at: [120, 243]
    draw_text @participation["record"]['staff']['value'], size: 12, at: [120, 217]
    draw_text @participation["record"]['telephone_number']['value'], size: 12, at: [120, 199]
    draw_text @participation["record"]['fax_number']['value'], size: 12, at: [120, 181]
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
