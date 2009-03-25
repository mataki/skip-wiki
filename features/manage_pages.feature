フィーチャ: ページ管理
  ログインしたユーザは自分たちが使うページを作成できるようにしたい

  背景:
    前提   言語は"ja-JP"
    かつ   ユーザ"alice"を登録し、ログインする
    かつ   ノート"a_note"が作成済みである
    かつ   そのノートにはラベル"Labelindice"が作成済みである
    かつ   ノート"a_note"のページ"FrontPage"を表示している

    もし   ナビゲーションメニューから"ページを追加"を選択する
    ならば "新しいページを作る"と表示されていること

    もし   "ページ名"に"ページ「い」"と入力する
    かつ   "ページ識別子"に"page_1"と入力する
    かつ   "内容"に"これはテストページです"と入力する
    かつ   "Labelindice"を選択する
    かつ   "ページを作成"ボタンをクリックする

  シナリオ: ページ作成
    もし   ノート"a_note"のページ"page_1"を表示している

    ならば "ページ「い」"と表示されていること
    かつ   "これはテストページです"と表示されていること
    かつ   "Labelindice"と表示されていること
    かつ   "ページを編集"と表示されていること

    もし "ページ一覧"リンクをクリックする
    ならば "ページ「い」"と表示されていること
    かつ   "履歴を表示"と表示されていること

  シナリオ: ページの論理削除
    前提    ノート"a_note"のページ"page_1"を表示している
    かつ    ナビゲーションメニューから"プロパティを編集"を選択する
    もし    "ページを削除"ボタンをクリックする
    ならば  "ページを削除しました"と表示されていること
    かつ    "ページ一覧"と表示されていること
    かつ    "ページ「い」"と表示されていないこと

    もし    ノート"a_note"のページ"FrontPage"を表示している
    かつ    "ページ一覧"リンクをクリックする
    ならば  "ページ「い」"と表示されていないこと

  シナリオ: ページの一覧
    前提   ノート"a_note"のページ"FrontPage"を表示している
    かつ   "ログアウト"リンクをクリックする

    かつ   ユーザ"bob"を登録し、ログインする
    かつ   そのノートにはページ"SecondPage"が作成済みである
    かつ   そのページはラベル"Labelindice"と関連付けられている
    かつ   OpenId "http://localhost:3200/user/alice"でログインする
    かつ   ノート"a_note"のページ"FrontPage"を表示している

    もし   "ページ一覧"リンクをクリックする
    ならば "表紙"と表示されていること
    かつ   "Secondpage"と表示されていること

    もし   "ページ内のキーワード"に"SKIP Noteへようこそ"と入力する
    かつ   "絞り込み"ボタンをクリックする
    ならば "表紙"と表示されていること
    かつ   "Secondpage"と表示されていないこと

    もし   "ページ内のキーワード"に""と入力する
    かつ   "最終更新者"に"alice"と入力する
    かつ   "絞り込み"ボタンをクリックする
    ならば "表紙"と表示されていること
    かつ   "Secondpage"と表示されていないこと

    もし   "ページ内のキーワード"に"SKIP Noteへようこそ"と入力する
    かつ   "最終更新者"に"bob"と入力する
    かつ   "絞り込み"ボタンをクリックする
    ならば "表紙"と表示されていないこと
    かつ   "Secondpage"と表示されていないこと

    もし   "ページ内のキーワード"に""と入力する
    かつ   "最終更新者"に""と入力する
    かつ   "ラベル識別子"から"ラベルなし"を選択する
    かつ   "絞り込み"ボタンをクリックする
    ならば "表紙"と表示されていること
    かつ   "Secondpage"と表示されていないこと

  シナリオ: ページの編集
    前提 ノート"a_note"のページ"FrontPage"を表示している

    もし   ナビゲーションメニューから"プロパティを編集"を選択する
    ならば "pages/FrontPage"と表示されていること

    もし "ラベル 2"を選択する
    かつ "公開日時"に"2030-12-01"と入力する
    かつ "時"から"12"を選択する
    かつ "分"から"30"を選択する
    かつ "ページを更新"ボタンをクリックする
    かつ 再読み込みする

    ならば "SKIP Noteへようこそ"と表示されていること
    かつ "ラベル 2"と表示されていること

    もし ナビゲーションメニューから"ページを編集"を選択する
    かつ "内容"に"これはテストページです"と入力する
    かつ "ページを更新"ボタンをクリックする
    ならば "これはテストページです"と表示されていること

  シナリオ: FrontPage以外のページの編集
    前提 ノート"a_note"のページ"page_1"を表示している
    かつ ナビゲーションメニューから"プロパティを編集"を選択する
    かつ "公開日時"に"2000-12-01"と入力する
    かつ "時"から"12"を選択する
    かつ "分"から"30"を選択する
    かつ "ページを更新"ボタンをクリックする
    かつ 再読み込みする
    かつ ナビゲーションメニューから"プロパティを編集"を選択する

    ならば "/pages/page_1"と表示されていること

    もし "公開日時"に"2030-12-01"と入力する
    かつ "時"から"12"を選択する
    かつ "分"から"30"を選択する
    かつ "ページを更新"ボタンをクリックする
    かつ 再読み込みする
    かつ ナビゲーションメニューから"プロパティを編集"を選択する
    かつ "ページ識別子"に"page_xxx"と入力する
    かつ "ページを更新"ボタンをクリックする

    ならば "エラーが発生しました"と表示されていないこと

  シナリオ: ページの履歴閲覧
    前提 ノート"a_note"のページ"FrontPage"を表示している
    かつ ナビゲーションメニューから"ページを編集"を選択する
    かつ "内容"に"これはテストページです"と入力する
    かつ "ページを更新"ボタンをクリックする

    もし ナビゲーションメニューから"編集履歴"を選択する
    ならば "編集履歴"と表示されていること

    もし テーブル"histories"の"1"行目の"前"リンクをクリックする
    ならば "リビジョン1の内容"と表示されていること
    かつ   "SKIP Noteへようこそ"と表示されていること
    かつ   "<h1>SKIP Noteへようこそ</h1>"と表示されていること
    かつ   "リビジョン2の内容"と表示されていること
    かつ   "これはテストページです"と表示されていること

    もし "履歴一覧に戻る"リンクをクリックする
    ならば "編集履歴"と表示されていること

    もし "rev.1を表示"リンクをクリックする
    ならば "SKIP Noteへようこそ"と表示されていること
    かつ "リビジョン1"と表示されていること
    かつ "alice"と表示されていること

  シナリオ: ページ作成に失敗
    前提   ノート"a_note"のページ"FrontPage"を表示している

    もし ナビゲーションメニューから"ページを追加"を選択する
    ならば "新しいページを作る"と表示されていること

    もし "ページ名"に"ページ「い」"と入力する
    かつ "内容"に"これはテストページです"と入力する
    かつ "ページを作成"ボタンをクリックする

    ならば "新しいページを作る"と表示されていること
    かつ   "ページにエラーが発生しました。"と表示されていること

    もし "ページ識別子"に"abc"と入力する
    もし "ページ名"に"ページ「い」"と入力する
    かつ "内容"に""と入力する
    かつ "ページを作成"ボタンをクリックする

    ならば "新しいページを作る"と表示されていること
    かつ   "ページにエラーが発生しました。"と表示されていること

