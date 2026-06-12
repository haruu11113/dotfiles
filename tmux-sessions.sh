#!/bin/sh
# tmux のセッションをフォルダごとに自動作成する。
# ここの対応表(セッション名|フォルダパス)を編集すれば追加・削除できる。
# - 既に同名セッションがあれば作り直さない（冪等）
# - セッションは detached で作るだけ。attach は `tmux a -t <名前>` で。

# ===== 対応表（セッション名|フォルダパス）=====
# 1行に「セッション名|パス」。# 始まりはコメント。
tmux_sessions='
dotfiles|~/work/dotfiles
wearos-sensor-kit|~/work/android-os/wearos
PomoTimerForWearOS|~/work/android-os/PomoTimerForWearOS
eneact2-beanstalk|~/work/docker/eneact2-beanstalk/backend
repo|~/work/docker/predict_Detailes/repo
doctorThesis|~/work/paper/202601_doctor_thesis_haru
review|~/work/paper/202604_scoping_review_about_supervised_contrastive_learning
SPReAD|~/work/paper/budget/202606_buget_SPReAD_2nd
# ここまで 
'
# =============================================

ensure_tmux_sessions() {
    command -v tmux >/dev/null 2>&1 || return 0

    echo "$tmux_sessions" | while IFS='|' read -r name path; do
        # 空行・コメント行はスキップ
        case "$name" in
            ''|\#*) continue ;;
        esac
        # 前後の空白を除去
        name=$(echo "$name" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        path=$(echo "$path" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        [ -z "$name" ] && continue
        # ~ を展開
        path=$(eval echo "$path")

        if [ ! -d "$path" ]; then
            continue
        fi
        # 既存なら何もしない
        if tmux has-session -t "=$name" 2>/dev/null; then
            continue
        fi
        tmux new-session -d -s "$name" -c "$path"
    done
}

ensure_tmux_sessions
