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
        if (Test-Path (Join-Path $candidate "Game.rgssad")) {
          return $candidate;
        }
      }
    }
  }
  return $null;
}

$scriptRoot = $PSScriptRoot;
$rgssad = "Game.rgssad";

$gamePath = Find-ImpostorFactoryPath;
if (${gamePath}) {
  Write-Host "Impostor Factoryのインストール先を検出しました: ${gamePath}";
} else {
  Write-Host "Impostor Factoryのインストール先を自動検出できませんでした。";
  $gamePath = Read-Host "Impostor Factoryがインストールされているフォルダのパスを入力してください(${rgssad}がある場所)";
}

$gameRgssad = Join-Path $gamePath $rgssad;
if (!(Test-Path $gameRgssad)) {
  Write-Warning "Error: `"${gameRgssad}`"が見つかりません。パスを確認してください。";
  Read-Host "Enterを押して終了";
  exit 1;
}

Set-Location (Join-Path $scriptRoot "translation");

if (!(Test-Path $rgssad)) {
  Copy-Item $gameRgssad $rgssad;
}

.\RPGMakerDecrypter-cli.exe $rgssad --output .;
Copy-Item dialogues.dist.txt dialogues.txt -Force;
Write-Host "DreaMakerを自動操作して翻訳を反映します。完了までしばらくお待ちください。";
$dreaMakerInputs = @("", "1", "1", "", "3", "", "", "", "4", "1", "", "0");
$dreaMakerInputs | .\DreaMaker_XP-v4.9.3.exe;

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
Copy-Item $destConf "${destConf}.bak";
Copy-Item (Join-Path $scriptRoot "mkxp.dist.conf") $destConf -Force;

if (Test-Path $gameRgssad) {
  Move-Item $gameRgssad "${gameRgssad}.bak";
}

Read-Host "日本語化が完了しました。Enterを押して終了";
