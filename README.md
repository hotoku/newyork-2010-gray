# newyork-2010-gray

Firefox テーマ「[NEWYORK 2010](https://addons.mozilla.org/firefox/addon/newyork-2010/)」（作者: [zaffoo](https://addons.mozilla.org/en-US/firefox/user/9737850/)）を改変した自分用テーマ。

## 元テーマからの変更点

| 項目 | 元 | 変更後 |
|---|---|---|
| `frame`（写真の外側の地色） | `#000000`（黒） | `#BABBBF`（写真の空と同じグレー） |
| `name` | `NEWYORK 2010` | `newyork-2010-gray` |
| `version` | `2.0` | `2.0.1` |
| アドオン ID | なし | `my2010-gray@hotoku.local` |
| `description` | 元の説明 | 作者・元 URL・改変内容・ライセンスを記載 |

ヘッダー画像とタブ文字色（`tab_background_text: #030303`）は元のまま。

## ファイル構成

```
theme/
  manifest.json          テーマ定義（色・画像・名前・バージョン）
  newyork2010header.jpg  ヘッダー画像（元テーマのもの、3000x200）
build.sh                 theme/ から newyork-2010-gray.xpi を作る
newyork-2010-gray.xpi    ビルド結果（未署名、git 管理外）
```

## 色の決め方

- 元テーマは黒い `frame` の上にほぼ黒の文字（`#030303`）で、写真が途切れた部分でタブ名が読めなかった。
- 写真の空（上部の大部分）は `#BABBBF`。これを画像から実測し、`frame` に設定して黒い部分を無くした。
- `#030303` と `#BABBBF` のコントラスト比は約 10.7:1 で十分読める。
- 写真の暗いビル（`#373536` 前後）の上では読みにくいが、自分の使い方では問題にならないので対象外とした。
- 白黒どちらの背景でも読める単色は存在しない（最良でも約 3.3:1）。どちらにも対応したくなったら、テーマではなく userChrome.css で文字に影を付ける必要がある。

## 編集できる主な項目

`theme/manifest.json` の `theme.colors` に追加・変更する。

| キー | 対象 |
|---|---|
| `frame` / `frame_inactive` | ウィンドウ上部の地色（アクティブ / 非アクティブ） |
| `tab_background_text` | 選択していないタブの文字色 |
| `tab_selected` / `tab_text` | 選択中タブの背景色 / 文字色 |
| `toolbar` / `toolbar_text` | ツールバーの背景色 / 文字色 |
| `toolbar_field` / `toolbar_field_text` | URL バーの背景色 / 文字色 |

全キー: <https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json/theme>

## 変更から反映までの手順

1. `theme/manifest.json` を編集する。
2. **`version` を上げる**（例: `2.0.1` → `2.0.2`）。同じ version は AMO に再提出できない。
3. `./build.sh` で `newyork-2010-gray.xpi` を作る。
4. 動作確認: Firefox で `about:debugging#/runtime/this-firefox` →「一時的なアドオンを読み込む…」→ `theme/manifest.json` を選ぶ。
   - 再起動すると消える。Windows 側の Firefox からは `\\wsl$\<ディストリ名>\home\hotoku\projects\hotoku\my2010_2\theme\manifest.json` で開ける。
5. 下記「AMO での署名」で署名済み xpi を入手してインストールする。

## AMO での署名（unlisted）

通常版 Firefox には署名済みのアドオンしか常用インストールできないため、AMO に unlisted（自己配布）で提出して署名だけしてもらう。unlisted は AMO の検索には出ない。

### 新しいバージョンの提出

1. <https://addons.mozilla.org/developers/addons> → newyork-2010-gray →「Upload New Version」。
   - 初回だけは <https://addons.mozilla.org/developers/addon/submit/distribution> から「On your own」を選んで提出した。
2. `newyork-2010-gray.xpi` をアップロードし、最後の「Submit Version」まで進める。

### 署名済み xpi の入手とインストール

1. My Add-ons → newyork-2010-gray →「Manage Status & Versions」。
2. 対象バージョンが **Approved** になると、ファイル名のリンクが出る。テーマなら通常数分で、完了するとメールも届く。
3. テーマを入れたい Firefox でそのリンクをクリックし、「追加」を押す。
   - 一度ダウンロードした場合は、`about:addons` → 歯車 →「ファイルからアドオンをインストール…」。
4. `about:addons` の「テーマ」で有効化する。

### 注意

- **アドオン ID（`browser_specific_settings.gecko.id`）は変えない。** 変えると別のアドオン扱いになり、AMO でも新規登録になる。
- `about:debugging` で一時的に読み込んだものが残っていたら削除しておく。

## ライセンス

元テーマは **CC BY-SA 3.0**（<https://creativecommons.org/licenses/by-sa/3.0/>）。改変版も同じライセンスに従う。

配布・公開する場合の義務と対応状況:

- [x] 作者名を表示する（zaffoo）→ manifest の `description` に記載
- [x] 元作品のタイトルと URL を表示する → `description` に記載
- [x] 改変したことを明記する → `description` に記載
- [x] ライセンス名と URL を示す → `description` に記載
- [x] 追加の制限を課さない
- [x] 元作者の推薦を装わない
- [ ] 改変版にも CC BY-SA 3.0（または後継版や互換ライセンス）を付ける → **listed で公開する場合のみ**、AMO のライセンス欄で CC BY-SA 3.0 を選ぶ

`description` を書き換えるときは、上の記載を消さないこと。
