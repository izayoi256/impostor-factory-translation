$rgssad = "Game.rgssad";

Set-Location translation;

if (!(Test-Path $rgssad)) {
  if (!(Test-Path "..\${rgssad}")) {
    Write-Warning "Error: `"${rgssad}`"��������܂���BImpostor Factory�̃C���X�g�[���f�B���N�g���ɐݒu���Ă��������B";
    Read-Host "Enter�������ďI��";
    exit 1;
  }
  Copy-Item "..\${rgssad}" $rgssad;
}

.\RPGMakerDecrypter-cli.exe $rgssad --output .;
Copy-Item dialogues.dist.txt dialogues.txt -Force;
Write-Host "���̐�͉p��\���ɂȂ�܂��B������`"DreaMaker����菇.txt`"��ǂ݂Ȃ��瑀�삵�Ă��������B";
Read-Host "Enter�������đ��s";
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

Read-Host "���{�ꉻ���������܂����BEnter�������ďI��";
