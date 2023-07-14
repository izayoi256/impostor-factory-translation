# Impostor Factory 日本語化Mod

これは[Impostor Factory](https://store.steampowered.com/app/1182620/Impostor_Factory/)を日本語化するModです。

制作元であるFreebird Gamesより翻訳の制作、配布の許諾を受けて公開しているものです。

## 動作確認済み環境

- Windows 10
- Linux Mint 19.1 (Wine利用)

## システム要件

- Windowsの場合: 特になし
- Linuxの場合: wine

## 導入方法

1. Modをダウンロードして解凍してください。 [[ダウンロードリンク]](https://github.com/izayoi256/impostor-factory-translation/archive/refs/heads/master.zip)
2. Steamで英語版のImpostor Factoryをインストールしてください。 [[ストアページ]](https://store.steampowered.com/app/1182620/Impostor_Factory/)
3. `Steamクライアント > ライブラリ > Impostor Factory > 歯車マーク > 管理 > ローカルファイルを閲覧` をクリック。 (以下の画像を参照してください)
![ローカルファイルを閲覧](https://user-images.githubusercontent.com/1329505/233041744-2e3549b5-3710-4125-b209-370f25e9409e.png)
4. 3の操作で表示された `Impostor Factory` ディレクトリを開く。 `Game.rgssad`というファイルが見えていればOKです。
5. 4の操作で開いたディレクトリに、1の操作で解凍したModの中身をすべて移動させてください。
6. `Game.rgssad` と `DreaMaker操作手順.txt` が同じディレクトリに入っていればOKです。 (以下の画像を参照してください)
![Mod反映準備完了](https://user-images.githubusercontent.com/1329505/233265748-d3d637f8-efdb-4fd1-9eeb-0c28178e7109.png)
7. OSによって操作が異なります。
  - Windowsの場合: `translate.bat`を実行し、指示に従って操作してください。
  - Linuxの場合: `translate.sh`を実行し、指示に従って操作してください。

## 関連プロジェクト

- Paper Memories 日本語化: https://github.com/izayoi256/paper-memories-ja
  -  To the Moon及びFinding ParadiseのDLCコミック

## クレジット

- Impostor Factory © Freebird Games 2021
- 翻訳及びMod化 © Qwert(Shotaro Hama) 2023
- ツール:
  - [DreaMaker](https://www.rpg-maker.fr/index.php?page=forum&id=16279) 4.9.3 by King Kadelfek (Marc Kruzik)
  - [RPGMakerDecrypter](https://github.com/uuksu/RPGMakerDecrypter) 2.0.11 by uuksu (Mikko Uuksulainen)
    - Thank you tyrone-sudeium as well for your advice to get rid of an error. 
