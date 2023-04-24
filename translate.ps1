$rgssad = "Game.rgssad";

Set-Location translation;

if (!(Test-Path $rgssad)) {
  if (!(Test-Path "..\${rgssad}")) {
    Write-Warning "Error: `"${rgssad}`"が見つかりません。Impostor Factoryのインストールディレクトリに設置してください。";
    Read-Host "Enterを押して終了";
    exit 1;
  }
  Copy-Item "..\${rgssad}" $rgssad;
}

.\RPGMakerDecrypter-cli.exe $rgssad --output .;
Copy-Item dialogues.dist.txt dialogues.txt -Force;
Write-Host "この先は英語表示になります。同梱の`"DreaMaker操作手順.txt`"を読みながら操作してください。";
Read-Host "Enterを押して続行";
.\DreaMaker_XP-v4.9.3.exe;
if (Test-Path "..\Data") {
  Remove-Item -Recurse -Force ..\Data;
}
if (Test-Path "..\Graphics") {
  Remove-Item -Recurse -Force ..\Graphics;
}
Move-Item Data ..;
Move-Item Graphics ..;
Copy-Item ..\mkxp.conf ..\mkxp.conf.bak;
Copy-Item ..\mkxp.dist.conf ..\mkxp.conf -Force;

if (Test-Path "..\${rgssad}") {
  Move-Item "..\${rgssad}" "..\${rgssad}.bak";
}

Read-Host "日本語化が完了しました。Enterを押して終了";
