import re
import subprocess
# osはステータスが返り値なので使わない

# subprocess.check_output()を使用してシェルスクリプトの出力を取得
try:
    # コマンドの出力をバイト文字列として取得し、デコードして文字列に変換
    execute = subprocess.check_output(["bash", "/home/kanikama0601/auto_git_tool_shell/test/check_service_list.sh"]).decode('utf-8')
    # print(execute)

    # 正規表現でサービス名を抽出
    service_names = re.findall(r"auto_git_tool_(.+)\.service", execute)

    # サービス名を出力
    if service_names:
        for service in service_names:
            print(service)
    else:
        print("サービス名が見つかりませんでした")

except subprocess.CalledProcessError as e:
    print(f"コマンド実行エラー: {e}")
except Exception as e:
    print(f"エラーが発生しました: {e}")