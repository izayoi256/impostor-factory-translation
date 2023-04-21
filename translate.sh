rgssad="Game.rgssad"

cd translation || exit

if [ ! -f "${rgssad}" ]; then
  if [ ! -f "../${rgssad}" ]; then
    echo "Error: \"${rgssad}\"が見つかりません。Impostor Factoryのインストールディレクトリに設置してください。"
    read -p "Enterを押して終了"
    exit 1
  fi
  \cp "../${rgssad}" "${rgssad}"
fi

./RPGMakerDecrypter-cli "${rgssad}" --output . \
  && \cp -f dialogues.dist.txt dialogues.txt \
  && echo "この先は英語表示になります。同梱の\"DreaMaker操作手順.txt\"を読みながら操作してください。" \
  && read -p "Enterを押して続行" \
  && wine DreaMaker_XP-v4.9.3.exe \
  && rm -rf ../Data ../Graphics \
  && mv Data Graphics .. \
  && \cp -n ../mkxp.conf ../mkxp.conf.bak \
  && \cp -f ../mkxp.dist.conf ../mkxp.conf

if [ -f "../${rgssad}" ]; then
  mv "../${rgssad}" "../${rgssad}.bak"
  exit 1
fi

read -p "日本語化が完了しました。Enterを押して終了"
