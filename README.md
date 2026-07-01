# Impostor Factory 日本語化Mod

これは[Impostor Factory](https://store.steampowered.com/app/1182620/Impostor_Factory/)を日本語化するModです。

制作元であるFreebird Gamesより翻訳の制作、配布の許諾を受けて公開しているものです。

このページはWindows版の導入手順です。Linux(Wine利用)で導入する場合は[README-Linux.md](README-Linux.md)を参照してください。

## 動作確認済み環境

- Windows 10/11

## システム要件

特になし

## 導入方法

1. Modをダウンロードして解凍してください。 [[ダウンロードリンク]](https://github.com/izayoi256/impostor-factory-translation/archive/refs/heads/master.zip)
2. Steamで英語版のImpostor Factoryをインストールしてください。 [[ストアページ]](https://store.steampowered.com/app/1182620/Impostor_Factory/)
3. 1で解凍したフォルダの中にある `translate.bat` を実行してください。
   - ※ 有害なスクリプトは一切入れていませんが、実行環境によっては以下のセキュリティ警告が表示される場合があります。ご納得いただいた上で手順を進めてください。
   
   **①「発行元を確認できませんでした」という警告が出た場合**
   - **「実行」** をクリックしてください。
   
   ![セキュリティ警告](https://github.com/user-attachments/assets/090de36e-6cc9-4716-848a-096489cb90dd)
   
   **② PowerShellの実行確認（「実行しますか？」）が出た場合**
   - 画面の指示に従い、キーボードの **`r`** （一度だけ実行する）を入力してEnterキーを押してください。
   
   ![実行確認](https://github.com/user-attachments/assets/11f59c44-a247-4dae-a42a-8d8a97a10967)
   
4. Impostor Factoryのインストール先が自動的に検出され、翻訳の反映も自動で行われます。
   - インストール先が自動検出できなかった場合は、フォルダのパスを入力するよう求められます。 `Steamクライアント > ライブラリ > Impostor Factory > 歯車マーク > 管理 > ローカルファイルを閲覧` をクリックすると、インストール先のフォルダが開きます。 (以下の画像を参照してください)

![ローカルファイルを閲覧](https://user-images.githubusercontent.com/1329505/233041744-2e3549b5-3710-4125-b209-370f25e9409e.png)

5. 画面の指示に従って進めると日本語化が完了します。
   - 実行中、英語のメニューが表示された黒いコマンドプロンプト画面（DreaMaker）が立ち上がりますが、自動的に処理が進行しますので、閉じずにそのままお待ちください。

# 不具合報告

誤字、脱字、不具合があった際は、お手数ですが[@ilovenamichang](https://twitter.com/ilovenamichang)宛にお知らせいただくか、本リポジトリのIssuesにご報告ください。

`translate.bat`実行時にエラーが出た場合は、Modを解凍したフォルダに生成される`translate.log`を報告時に添付していただけると助かります。

# 免責事項

当パッチを利用して発生した、いかなる損害も責任を負いかねます。

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
