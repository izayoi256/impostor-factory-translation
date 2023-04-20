rgssad="Game.rgssad"

if [ ! -f "${rgssad}" ]; then
  echo "Error: \"${rgssad}\"が見つかりません。Impostor Factoryのインストールディレクトリに設置してください。"
  read -p "Enterを押して終了"
  exit 1
fi

./translation/RPGMakerDecrypter-cli "${rgssad}" --output ./translation
