

brew install sheldon
mkdir ~/.sheldon/ && ln -s ./zsh/.sheldon/plugins.toml ~/.sheldon/plugins.toml


https://zenn.dev/ganta/articles/e1e0746136ce67

プラグインの更新
プラグインの更新はlockサブコマンドに--updateオプションを付けて実行します。

sheldon lock --update

--updateオプションの代わりに--reinstallオプションを付けて実行すると強制的にプラグインが再インストールされます。

sheldon lock --reinstall

オプションなしのlockサブコマンドはロックファイルを再生成し、plugins.tomlで指定された通りにプラグインがインストールされているかチェックし、指定された通りになっていなければインストール・削除を行います。

sheldon lock

ロックファイルが存在しない場合はsourceサブコマンドの実行でもlockサブコマンドと同等の動作をします。