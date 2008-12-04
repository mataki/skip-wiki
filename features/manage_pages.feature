フィーチャ: ページ管理
  ログインしたユーザは自分たちが使うページを作成できるようにしたい

  シナリオ: ページ作成
    前提   言語は"ja-JP"
    かつ   ユーザ"alice"を登録する
    かつ   ユーザのIdentity URLを"http://nimloth.local:3333/user/alice"として登録する
    かつ   OpenId "http://nimloth.local:3333/user/alice"でログインする
    かつ   ノート"a_note"が作成済みである
    かつ   ノート"a_note"のページ"FrontPage"を表示している

    もし "ページを追加"リンクをクリックする
    ならば "新しいページを作る"と表示されていること

    もし "ページ名"に"ページ「い」"と入力する
    かつ "ページ識別子"に"page_1"と入力する
    かつ "内容"に"これはテストページです"と入力する
    かつ "作成"ボタンをクリックする

    ならば "ページ「い」"と表示されていること
    かつ   "これはテストページです"と表示されていること
    かつ   "ページ内容を編集"と表示されていること

  シナリオ: ページの編集
    前提 言語は"ja-JP"
    かつ ユーザ"alice"を登録する
    かつ ユーザのIdentity URLを"http://nimloth.local:3333/user/alice"として登録する
    かつ OpenId "http://nimloth.local:3333/user/alice"でログインする
    かつ ノート"a_note"が作成済みである
    かつ ノート"a_note"のページ"FrontPage"を表示している

    もし "ページ情報を編集"リンクをクリックする
    かつ "ページ名"に"かつて表紙だったページ"と入力する
    かつ "更新"ボタンをクリックする

    ならば "かつて表紙だったページ"と表示されていること
    かつ "SKIP Noteへようこそ"と表示されていること

    もし "ページ内容を編集"リンクをクリックする
    かつ "内容"に"これはテストページです"と入力する
    かつ "Save"ボタンをクリックする

    ならば "これはテストページです"と表示されていること

  シナリオ: ページの履歴閲覧
  前提シナリオ: ページの編集
    前提 ノート"a_note"のページ"FrontPage"を表示している
    もし "編集履歴"リンクをクリックする
    ならば "「かつて表紙だったページ」の編集履歴"と表示されていること

    もし テーブル"histories"の"1"行目の"次"リンクをクリックする
    ならば "SKIP Noteへようこそ"と表示されていること
    かつ "これはテストページです"と表示されていること

