#!/usr/bin/env bash
app_path='/Library/Input Methods/Squirrel.app/Contents/SharedSupport/opencc'

error_exit() {
  echo '安裝失敗'
  case $1 in
    1)
      sudo rm -Rf "$app_path/simp_to_trad_*.ocd"
      ;;
    2)
      sudo rm -Rf "$app_path/simp_to_trad_*.ocd"
      sudo rm -Rf "$app_path/zhs2zht.ini.ocd"
      ;;
    *)
      ;;
  esac
  exit -1
}

sudo cp ./simp_to_trad_*.ocd "$app_path" || error_exit 1
sudo cp ./zhs2zht.ini "$app_path" || error_exit 2

cat <<"EOT"
安裝成功，請根據自身情況修改輸入法配置文件：

patch: # for ~/Library/Rime/wubi_pinyin.custom.yaml

  'simplifier/opencc_config': zhs2zht.ini
 
  'engine/filters':
    - simplifier
    - uniquifier
EOT