#        _ _   _           _           _                                _
#   __ _(_) |_| |__  _   _| |__       | |_ __ _  __ _        __ _ _   _| |_ ___
#  / _` | | __| '_ \| | | | '_ \ _____| __/ _` |/ _` |_____ / _` | | | | __/ _ \
# | (_| | | |_| | | | |_| | |_) |_____| || (_| | (_| |_____| (_| | |_| | || (_) |
#  \__, |_|\__|_| |_|\__,_|_.__/       \__\__,_|\__, |      \__,_|\__,_|\__\___/
#  |___/                                        |___/
#  _                                          _
# (_)_ __   ___ _ __ ___ _ __ ___   ___ _ __ | |_
# | | '_ \ / __| '__/ _ \ '_ ` _ \ / _ \ '_ \| __|
# | | | | | (__| | |  __/ | | | | |  __/ | | | |_
# |_|_| |_|\___|_|  \___|_| |_| |_|\___|_| |_|\__|
#
# https://github.com/yqlbu/github-tag-autoincrement
#
# Copyright (C) 2021 yqlbu <https://hikariai.net>
#
# This is a self-hosted software, liscensed under the MIT License.
# See /License for more information.

FROM alpine:latest

RUN apk add --update curl jq bash && \
    rm -rf /var/cache/apk/*

ADD ./entrypoint.sh  /increment_patch.sh

RUN chmod +x /increment_patch.sh

ENTRYPOINT [ "/increment_patch.sh" ]
