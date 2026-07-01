# Impostor Factory 日本語化Mod (Linux版導入手順)

Linux上でWineを利用して導入する場合の手順です。全体の概要や不具合報告・クレジット等は[README.md](README.md)を参照してください。

Windows版のような自動化(インストール先の自動検出・DreaMakerの自動操作)は行われません。手動での操作が必要です。

## 動作確認済み環境

- Linux Mint 19.1 (Wine利用)

## システム要件

- wine

## 導入方法

1. Modをダウンロードして解凍してください。 [[ダウンロードリンク]](https://github.com/izayoi256/impostor-factory-translation/archive/refs/heads/master.zip)
2. Steamで英語版のImpostor Factoryをインストールしてください。 [[ストアページ]](https://store.steampowered.com/app/1182620/Impostor_Factory/)
3. `Steamクライアント > ライブラリ > Impostor Factory > 歯車マーク > 管理 > ローカルファイルを閲覧` をクリック。 (以下の画像を参照してください)
![ローカルファイルを閲覧](https://user-images.githubusercontent.com/1329505/233041744-2e3549b5-3710-4125-b209-370f25e9409e.png)
4. 3の操作で表示された `Impostor Factory` ディレクトリを開く。 `Game.rgssad`というファイルが見えていればOKです。
5. 4の操作で開いたディレクトリに、1の操作で解凍したModの中身をすべて移動させてください。
6. `Game.rgssad` と `DreaMaker操作手順.txt` が同じディレクトリに入っていればOKです。 (以下の画像を参照してください)
![Mod反映準備完了](https://user-images.githubusercontent.com/1329505/233265748-d3d637f8-efdb-4fd1-9eeb-0c28178e7109.png)
7. `translate.sh`を実行してください。途中でDreaMakerの操作画面が表示されるので、同梱の`DreaMaker操作手順.txt`を読みながら操作してください。

エラーが出た場合は、ターミナルに表示された内容をコピーして、[README.md](README.md)の「不具合報告」の案内に従って報告時に貼り付けてください。
