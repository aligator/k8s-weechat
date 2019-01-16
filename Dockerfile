# weechat alpine image

FROM alpine:edge

LABEL maintainer="greg@greghaynes.net"

ENV HOME /home/user

RUN ["apk", "add", "--no-cache", "weechat", "weechat-perl", "weechat-python", "weechat-aspell", "ca-certificates", "aspell-en", "python", "perl"]

RUN ["adduser", "-D", "-h", "$HOME", "user"]
RUN ["mkdir", "-p", "$HOME/.weechat"]
RUN ["chown", "-R", "user:user", "$HOME"]

ADD --chown=user:user weechat-config/* /home/user/.weechat/

WORKDIR $HOME

USER user

ENTRYPOINT weechat-headless
