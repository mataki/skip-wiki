フィーチャ: ラベルをたどる
  ラベルの付いたページや、付いていないページをそれぞれ辿れるようにしたい

  シナリオ: ラベルなしページを表示し、1つ進める
    前提 言語は"ja-JP"
    かつ ユーザ"alice"を登録する
    かつ ユーザのIdentity URLを"http://localhost:3200/user/alice"として登録する
    かつ OpenId "http://localhost:3200/user/alice"でログインする
    かつ ノート"a_note"が作成済みである
    かつ そのノートにはページ"page_0"が作成済みである
    かつ そのページの更新日時を"1"分進める
    かつ そのノートにはページ"page_1"が作成済みである
    かつ そのページの更新日時を"3"分進める
    かつ ノート"a_note"のページ"FrontPage"を表示している
    かつ ナビゲーションメニューから"ノート情報"を選択する
    かつ "ノートのプロパティを編集"リンクをクリックする
    かつ "Display always"を選択する
    かつ "更新"ボタンをクリックする

    もし ノート"a_note"のページ"page_0"を表示している
    ならば "Page 0"と表示されていること

    もし "Page 1"リンクをクリックする
    ならば "Page 1"と表示されていること

    もし "Page 0"リンクをクリックする
    ならば "Page 0"と表示されていること

    もし "ラベルなし"リンクをクリックする
    ならば "Page 0"と表示されていること
    かつ   "Page 1"と表示されていること

