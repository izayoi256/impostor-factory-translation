#!/bin/sh

rgssad="Game.rgssad"

cd translation || exit

if [ ! -f "${rgssad}" ]; then
  if [ ! -f "../${rgssad}" ]; then
    if [ -f "../${rgssad}.bak" ]; then
      echo "適用済みのパッチを検出しました。元のデータを復元して再適用します..."
      \cp "../${rgssad}.bak" "../${rgssad}"
    else
      echo "Error: \"${rgssad}\"が見つかりません。Impostor Factoryのインストールディレクトリに設置してください。"
      read -p "Enterを押して終了" _
      exit 1
    fi
  fi
  \cp "../${rgssad}" "${rgssad}"
fi

rm -rf Data Graphics

./RPGMakerDecrypter-cli "${rgssad}" --output .
if [ ! -d "Data" ]; then
  echo "Error: ゲームデータの解凍(RPGMakerDecrypter)に失敗しました。\"${rgssad}\"が正しいファイルか確認してください。"
  read -p "Enterを押して終了" _
  exit 1
fi

\cp -f dialogues.dist.txt dialogues.txt
echo "この先は英語表示になります。同梱の\"DreaMaker操作手順.txt\"を読みながら操作してください。"
read -p "Enterを押して続行" _
wine DreaMaker_XP-v4.9.3.exe

if [ ! -d "Data" ] || [ ! -d "Graphics" ]; then
  echo "Error: DreaMakerによる翻訳の反映に失敗しました。"
  read -p "Enterを押して終了" _
  exit 1
fi

rm -rf ../Data ../Graphics
mv Data Graphics ..

if [ -f "../mkxp.conf" ]; then
  \cp -n ../mkxp.conf ../mkxp.conf.bak
fi
\cp -f ../mkxp.dist.conf ../mkxp.conf

if [ -f "../${rgssad}" ]; then
  rm -f "../${rgssad}.bak"
  mv "../${rgssad}" "../${rgssad}.bak"
fi

read -p "日本語化が完了しました。Enterを押して終了" _
