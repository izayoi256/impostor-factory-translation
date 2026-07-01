$ErrorActionPreference = "Stop";

$scriptRoot = $PSScriptRoot;
$rgssad = "Game.rgssad";
$logPath = Join-Path $scriptRoot "translate.log";

function Find-ImpostorFactoryPath {
  $appId = "1182620";
  try {
    $steamPath = (Get-ItemProperty "HKCU:\SOFTWARE\Valve\Steam" -ErrorAction Stop).SteamPath;
  } catch {
    return $null;
  }
  if (!${steamPath}) {
    return $null;
  }

  $libraryPaths = @(${steamPath});
  $vdfPath = Join-Path ${steamPath} "steamapps\libraryfolders.vdf";
  if (Test-Path $vdfPath) {
    $vdfContent = Get-Content $vdfPath -Raw;
    foreach ($m in [regex]::Matches($vdfContent, '"path"\s*"([^"]+)"')) {
      $libraryPaths += $m.Groups[1].Value.Replace('\\', '\');
    }
  }

  foreach ($lib in $libraryPaths) {
    $manifestPath = Join-Path $lib "steamapps\appmanifest_${appId}.acf";
    if (Test-Path $manifestPath) {
      $manifestContent = Get-Content $manifestPath -Raw;
      $installDirMatch = [regex]::Match($manifestContent, '"installdir"\s*"([^"]+)"');
      if ($installDirMatch.Success) {
        $candidate = Join-Path $lib "steamapps\common\$($installDirMatch.Groups[1].Value)\Impostor Factory";
        if (Test-Path (Join-Path $candidate "Game.rgssad") -or Test-Path (Join-Path $candidate "Game.rgssad.bak")) {
          return $candidate;
        }
      }
    }
  }
  return $null;
}

function Exit-WithError($message) {
  Write-Warning $message;
  Write-Warning "詳細なログは `"${logPath}`" に保存されています。不具合を報告する際は、このログファイルを添付してください。";
  Stop-Transcript | Out-Null;
  Read-Host "Enterを押して終了";
  exit 1;
}

Write-Host "ログを `"${logPath}`" に保存します。不具合が起きた場合は報告の際に添付してください。";
Start-Transcript -Path $logPath -Force | Out-Null;

try {
  $gamePath = Find-ImpostorFactoryPath;
  if (${gamePath}) {
    Write-Host "Impostor Factoryのインストール先を検出しました: ${gamePath}";
  } else {
    Write-Host "Impostor Factoryのインストール先を自動検出できませんでした。";
    $gamePath = Read-Host "Impostor Factoryがインストールされているフォルダのパスを入力してください(${rgssad}がある場所)";
  }

  $gameRgssad = Join-Path $gamePath $rgssad;
  $gameRgssadBak = "${gameRgssad}.bak";
  if (!(Test-Path $gameRgssad)) {
    if (Test-Path $gameRgssadBak) {
      Write-Host "適用済みのパッチを検出しました。元のデータを復元して再適用します...";
      Copy-Item $gameRgssadBak $gameRgssad -Force;
    } else {
      Exit-WithError "Error: `"${gameRgssad}`"が見つかりません。パスを確認してください。";
    }
  }

  Set-Location (Join-Path $scriptRoot "translation");

  if (!(Test-Path $rgssad)) {
    Copy-Item $gameRgssad $rgssad;
  }

  if (Test-Path "Data") {
    Remove-Item -Recurse -Force "Data";
  }
  if (Test-Path "Graphics") {
    Remove-Item -Recurse -Force "Graphics";
  }

  .\RPGMakerDecrypter-cli.exe $rgssad --output .;
  if ($LASTEXITCODE -ne 0 -or !(Test-Path "Data")) {
    Exit-WithError "ゲームデータの解凍(RPGMakerDecrypter)に失敗しました。`"${gameRgssad}`"が正しいファイルか確認してください。";
  }

  Copy-Item dialogues.dist.txt dialogues.txt -Force;
  Write-Host "DreaMakerを自動操作して翻訳を反映します。完了までしばらくお待ちください。";
  $dreaMakerInputs = @("", "1", "1", "", "3", "", "", "", "4", "1", "", "0");
  $dreaMakerInputs | .\DreaMaker_XP-v4.9.3.exe;

  if (!(Test-Path "Data") -or !(Test-Path "Graphics")) {
    Exit-WithError "DreaMakerによる翻訳の反映に失敗しました。";
  }

  $destData = Join-Path $gamePath "Data";
  $destGraphics = Join-Path $gamePath "Graphics";
  if (Test-Path $destData) {
    Remove-Item -Recurse -Force $destData;
  }
  if (Test-Path $destGraphics) {
    Remove-Item -Recurse -Force $destGraphics;
  }
  Move-Item "Data" $destData;
  Move-Item "Graphics" $destGraphics;

  $destConf = Join-Path $gamePath "mkxp.conf";
  Copy-Item $destConf "${destConf}.bak" -ErrorAction SilentlyContinue;
  Copy-Item (Join-Path $scriptRoot "mkxp.dist.conf") $destConf -Force;

  if (Test-Path $gameRgssad) {
    if (Test-Path $gameRgssadBak) {
      Remove-Item $gameRgssadBak -Force;
    }
    Move-Item $gameRgssad $gameRgssadBak;
  }

  Stop-Transcript | Out-Null;
  Read-Host "日本語化が完了しました。Enterを押して終了";
} catch {
  Write-Warning "予期しないエラーが発生しました: $($_.Exception.Message)";
  Write-Warning "詳細なログは `"${logPath}`" に保存されています。不具合を報告する際は、このログファイルを添付してください。";
  Stop-Transcript | Out-Null;
  Read-Host "Enterを押して終了";
  exit 1;
}
