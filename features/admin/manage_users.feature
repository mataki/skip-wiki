フィーチャ: ユーザ管理
  管理者ユーザはskip-noteのユーザを管理できるようにしたい

  背景:
    前提 言語は"ja_JP"
    かつ ユーザ"dammyadmin"を管理者として登録し、ログインする
    かつ ノート"a_note"が作成済みである
    もし ノート"a_note"のページ"FrontPage"を表示している

  シナリオ: 管理者ユーザは管理者メニューにアクセスできる
    ならば "管理者メニュー"と表示されていること

  シナリオ: ユーザ一覧画面に遷移する
    もし  "管理者メニュー"リンクをクリックする
    ならば "ユーザ管理"と表示されていること
    ならば "ユーザ一覧"と表示されていること
    ならば "ユーザ識別子"と表示されていること
    ならば "dammyadmin"と表示されていること

  シナリオ: ユーザ編集
    もし  "管理者メニュー"リンクをクリックする
    かつ  "編集"リンクをクリックする

    もし  "ユーザ識別子"に"hoge"と入力する
    かつ  "ユーザ名"に"moge"と入力する
    かつ  "管理者"をチェックする
    かつ  "更新"ボタンをクリックする
    かつ  再読み込みする

    ならば  "ユーザ一覧"と表示されていること
    ならば  "moge"と表示されていること

  シナリオ: アカウント編集
    前提  ペンディング: 動作しない、管理画面の現状のあるべき姿を確認する
    もし  ユーザ"alice"を登録する
    かつ  "管理者メニュー"リンクをクリックする
    かつ  "アカウント一覧"リンクをクリックする

    ならば  "ログイン名"と表示されていること
    ならば  "名前"と表示されていること
    ならば  "alice"と表示されていること

    もし  "編集"リンクをクリックする
    かつ  "ログイン名"に"hoge"と入力する
    かつ  "更新"ボタンをクリックする
    かつ  再読み込みする

    ならば  "ログイン名"と表示されていること
    ならば  "名前"と表示されていること
    ならば  "hoge"と表示されていること

    もし  "編集"リンクをクリックする
    かつ  "ログイン名"に""と入力する
    かつ  "更新"ボタンをクリックする
    かつ  "validation error"と表示されていること

