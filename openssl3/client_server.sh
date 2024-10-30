#!/bin/sh

tmux new-session -d -s oqs_session
tmux rename-window -t oqs_session server
tmux send-keys -t oqs_session "/opt/openssl32/bin/openssl s_server -cert /opt/test/server.crt -key /opt/test/server.key -groups kyber768 -www -tls1_3 -accept localhost:4433 -trace -debug | tee /shared/server.log" ENTER
tmux split-window -t oqs_session
tmux rename-window -t oqs_session client
sleep 3
tmux send-keys -t oqs_session "/opt/openssl32/bin/openssl s_client -connect localhost --groups kyber768 -trace -debug | tee /shared/client.log" ENTER

if command -v bash > /dev/null; then bash; else sh; fi
