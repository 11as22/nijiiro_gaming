# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p '==================== admin create ===================='
  Admin.create!(email: "admin@example.com", password: "000000")

p '==================== item_genre create ===================='
  item_genre1 = ItemGenre.new(genre: "マウス")
    item_genre1.save!
  item_genre2 = ItemGenre.new(genre: "キーボード")
    item_genre2.save!
  item_genre3 = ItemGenre.new(genre: "マウスパッド")
    item_genre3.save!
  item_genre4 = ItemGenre.new(genre: "イヤホン")
    item_genre4.save!
  item_genre5 = ItemGenre.new(genre: "ヘッドホン")
    item_genre5.save!
  item_genre6 = ItemGenre.new(genre: "モニター")
    item_genre6.save!
  item_genre7 = ItemGenre.new(genre: "未分類")
    item_genre7.save!

p '==================== customer create ===================='

Customer.create(
  display_name: "customer1",
  email: "customer1@example.com",
  password: '111111',
)

Customer.create(
  display_name: "customer2",
  email: "customer2@example.com",
  password: '222222',
)

Customer.create(
  display_name: "customer3",
  email: "customer3@example.com",
  password: '333333',
)

p '==================== item_post create ===================='
  item_post1 = ItemPost.new(
    item_genre_id: 1,
    customer_id: 1,
    item_name: "Razer Viper V2 Pro (Black Edition)",
    item_explanation: "重量58gと軽量で接続方式は2.4GHzワイヤレス。形状は左右対称、100~30000dpiに設定可能、初期のソールはPTFE、バッテリーは最大８０時間連続稼働可能",
    model_number: "RZ01-04390100-R3A1"
    )
    item_post1.item_image.attach(io: File.open(Rails.root.join('app/assets/images/Viper_V2_Pro.jpg')), filename: 'Viper_V2_Pro.jpg')
    item_post1.save!
  
  item_post2 = ItemPost.new(
    item_genre_id: 3,
    customer_id: 1,
    item_name: "X-raypad Aqua Control Plus Wave Storm",
    item_explanation: "表面にはノンコーティングのアムンゼン生地を使用しています。アムンゼン生地なので湿気には強いです。エッジはステッチ加工が施されています。厚さは4mmなので同種製品の3mmに比べると圧力をかけると止まりやすいです。サイズはXL,XXLで展開しています。",
    model_number: ""
    )
    item_post2.item_image.attach(io: File.open(Rails.root.join('app/assets/images/Aqua_Contro_Plus_Wave Storm.jpg')), filename: 'Aqua_Contro_Plus_Wave Storm.jpg')
    item_post2.save!
  
  
  item_post3 = ItemPost.new(
    item_genre_id: 3,
    customer_id: 2,
    item_name: "X-raypad Aqua Control Plus ROB Strata",
    item_explanation: "ROB（レッド、オレンジ、ブルー）のカラーがプリントされたマウスパッド。表面：アムンゼン生地 縁は、ステッチ加工処理。湿気に強い。地肌が擦れると痛い、同製品にBlackがあるがROBの方がコントロール寄り、サイズ：XL(450×400×3mm)、XXL(900×400×3mm)
  ・厚さ：3mm",
    model_number: ""
    )
    item_post3.item_image.attach(io: File.open(Rails.root.join('app/assets/images/Aqua_Control_Plus_ROB_Strata.jpg')), filename: 'Aqua_Control_Plus_ROB_Strata.jpg')
    item_post3.save!
  
  item_post4 = ItemPost.new(
    item_genre_id: 3,
    customer_id: 2,
    item_name: "FnaticGear DASH Lサイズ",
    item_explanation: "サイズ: DASH L 487×372×3mm, DASH XD 950×500×3mm。発売日2020年8月21",
    model_number: "MP0004-001 MS445"
    )
    item_post4.item_image.attach(io: File.open(Rails.root.join('app/assets/images/FnaticDash.jpg')), filename: 'FnaticDash.jpg')
    item_post4.save!
  
  item_post5 = ItemPost.new(
    item_genre_id: 3,
    customer_id: 2,
    item_name: "ZOWIE G-SR-SE ROUGE",
    item_explanation: "カラープリントを施した布製(L),滑らかな滑走感と安定したコントロール性,ステッチ加工なし,均一な高密度ラバーベースを採用（公式サイト引用)",
    model_number: "9H.N4CFQ.A61"
    )
    item_post5.item_image.attach(io: File.open(Rails.root.join('app/assets/images/G-SR-SE_ROUGE.jpg')), filename: 'G-SR-SE_ROUGE.jpg')
    item_post5.save!
  
  item_post6 = ItemPost.new(
    item_genre_id: 1,
    customer_id: 3,
    item_name: "Finalmouse Starlight Pro - TenZ S size",
    item_explanation: "材質：マグネシウム合金、重量: S size 42g(M size 46g),DPI：400 / 800 / 1600 / 3200、スイッチ：Kailh GM 8.0、接続方法：無線(2.4GHz)・有線(USB)",
    model_number: ""
    )
    item_post6.item_image.attach(io: File.open(Rails.root.join('app/assets/images/FinalMouse_Tenz_s.jpg')), filename: 'FinalMouse_Tenz_s.jpg')
    item_post6.save!
  
  item_post7 = ItemPost.new(
    item_genre_id: 1,
    customer_id: 3,
    item_name: "G-Wolves HSK Pro 4K Wireless Mouse",
    item_explanation: "重量：~29 グラム, ポーリングレート 1000hz/2000hz/4000hz,サイズ: L73.7mm, W:56mm, H:29mm,専用ソフトウェアでポーリングレート、LOD,DPI,motion syncなどの設定ができます。",
    model_number: ""
    )
    item_post7.item_image.attach(io: File.open(Rails.root.join('app/assets/images/HSK_Pro_4K_Wireless Mouse.jpg')), filename: 'HSK_Pro_4K_Wireless Mouse.jpg')
    item_post7.save!
  
  item_post8 = ItemPost.new(
    item_genre_id: 3,
    customer_id: 3,
    item_name: "SkyPAD Glass 3.0 XL",
    item_explanation: "材質:強化ガラス サイズ：400mm x 500mm x 3.7mm　カラーはホワイト、ブラック有り",
    model_number: ""
    )
    item_post8.item_image.attach(io: File.open(Rails.root.join('app/assets/images/SkyPad_3.0XL.jpg')), filename: 'SkyPad_3.0XL.jpg')
    item_post8.save!
  
  item_post9 = ItemPost.new(
    item_genre_id: 2,
    customer_id: 3,
    item_name: "Logicool G ロジクール G ゲーミングキーボード ワイヤレス G913",
    item_explanation: "Logicoolのロープロファイルキーボード。スイッチはタクタイル、リニア、クリツキーの３種類あります。接続方法は、LIGHTSPEEDワイヤレス、Bluetooth、有線の３種類あります。",
    model_number: "G913-TC,G913-LN,G913-CK"
    )
    item_post9.item_image.attach(io: File.open(Rails.root.join('app/assets/images/G913.jpg')), filename: 'G913.jpg')
    item_post9.save!
    
  item_post10 = ItemPost.new(
    item_genre_id: 2,
    customer_id: 3,
    item_name: "Varmilo 73 Sakura JIS Keyboard",
    item_explanation: "桜がモチーフのデザインのキーボードです。軸の種類はvamilo静電容量軸の中から選ぶことができます（詳しくはvamilo公式サイト、公式取扱サイトをご確認ください。サイズは65%とコンパクトです。",
    model_number: ""
    )
    item_post10.item_image.attach(io: File.open(Rails.root.join('app/assets/images/Varmilo73_Sakura_JIS_Keyboard.jpg')), filename: 'Varmilo73_Sakura_JIS_Keyboard.jpg')
    item_post10.save!
  
  item_post11 = ItemPost.new(
    item_genre_id: 2,
    customer_id: 3,
    item_name: "Wooting two HE",
    item_explanation: "アクチュエーションポイントを0.1mm~4.0mmの間で、0.1mm単位で調整可能。rapid trigger機能搭載でリセットポイントを調整可能。tachyonモードをONにすることで入力遅延が3.4msから1.4msにすることが可能（バックライトが常時点灯しかできなくなる)、アナログ入力も可能。大きさはフルキーボード、接続は有線接続のみ。（本体からキーの取り外しは可能),",
    model_number: ""
    )
    item_post11.item_image.attach(io: File.open(Rails.root.join('app/assets/images/Wooting_two_HE.jpg')), filename: 'Wooting_two_HE.jpg')
    item_post11.save!
    
    
  item_post12 = ItemPost.new(
    item_genre_id: 2,
    customer_id: 3,
    item_name: "Razer Huntsman V2 JP Clicky Optical Switch",
    item_explanation: "Razerの独自の軸、クリッキーオプティカルスイッチ(Razer紫軸)が搭載されている。押下圧は45gと軽め。この軸とリニアオプティカルスイッチ(Razer赤軸)を搭載したものの２種類で展開している。接続タイプは有線,最大ポーリングレート8000hzに対応",
    model_number: "RZ03-03931500-R3J1"
    )
    item_post12.item_image.attach(io: File.open(Rails.root.join('app/assets/images/Razer_Huntsman_JP.jpg')), filename: 'Razer_Huntsman_JP.jpg')
    item_post12.save!

p '==================== review create ===================='
  item_post1.reviews.create(
    customer_id: 1,
    title: "無線マウス最強",
    item_price: "21780円（税込)",
    impression: "無線マウスの中では軽くて、つまみ持ちにちょうど良いので僕には会いました",
    star: 4.5
  )
  
  item_post1.reviews.create(
    customer_id: 2,
    title: "細い",
    item_price: "セール時19800円（税込)",
    impression: "被せ持ちだが、サイドが細すぎて微妙、軽いのと応答速度が良いのは良かった。",
    star: 3
  )
  
  item_post6.reviews.create(
    customer_id: 2,
    title: "脅威の42グラム",
    item_price: "たぶん30000円",
    impression: "size Sを購入。横幅が細いので、つまみ持ちであればすごく良い。被せ持ち、つかみ持ちは持ちづらいかもしれない。size Sは45gとすごく軽い。５点と言いたいが個体により当たり外れが大きいので星４",
    star: 4
  )
  
  item_post5.reviews.create(
    customer_id: 2,
    title: "G-SR-SEの上位互換",
    item_price: "5000円",
    impression: "前作のG-SE-SRより耐久性と耐湿性が上がり、前よりも表面が滑りやすくとてもよいです。だが、他のマウスパッドに比べ耐久性と耐湿性は劣ります。正規価格で買えれば安いのでぜひ正規価格で販売していたら購入してみてください",
    star: 4.5
  )
  
   item_post11.reviews.create(
    customer_id: 3,
    title: "最強",
    item_price: "25000円(本体のみ)",
    impression: "めちゃ反応はやい最強",
    star: 5
  )