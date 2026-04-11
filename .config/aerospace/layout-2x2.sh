#!/bin/bash
# AeroSpace: 現在のワークスペースを 2x2 グリッドに並べる
# ウィンドウが4つ以上必要。4つを超える場合は最初の4つを使う。

set -e

# フラットに戻す
aerospace flatten-workspace-tree
sleep 0.15

# 現在のワークスペースのウィンドウIDを取得（先頭4つ）
IDS=($(aerospace list-windows --workspace focused | awk '{print $1}' | head -4))

COUNT=${#IDS[@]}

if [ "$COUNT" -lt 2 ]; then
    echo "2x2 レイアウトにはウィンドウが2つ以上必要です (現在: $COUNT)" >&2
    exit 1
fi

if [ "$COUNT" -ge 2 ]; then
    # W2 を W1 の左隣に join → 左カラム [W1, W2]_vertical
    aerospace focus --window-id "${IDS[1]}"
    sleep 0.05
    aerospace join-with left
    sleep 0.05
fi

if [ "$COUNT" -ge 4 ]; then
    # W4 を W3 の左隣に join → 右カラム [W3, W4]_vertical
    aerospace focus --window-id "${IDS[3]}"
    sleep 0.05
    aerospace join-with left
fi
