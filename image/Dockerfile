FROM gliderlabs/alpine:edge

RUN apk --update add snort curl tar perl-libwww perl-crypt-ssleay perl-sys-syslog perl-switch perl-lwp-protocol-https

RUN mkdir -p /opt/pulledpork && \
    cd /opt/pulledpork && \
    curl -o - -L https://github.com/shirkdog/pulledpork/archive/0.7.2.tar.gz | tar zxf - --strip-components=1 && \
    chmod 755 pulledpork.pl

RUN sed -i \
    -e 's#^var RULE_PATH.*#var RULE_PATH /data/etc/snort/rules#' \
    -e 's#^var WHITE_LIST_PATH.*#var WHITE_LIST_PATH /data/etc/snort/rules#' \
    -e 's#^var BLACK_LIST_PATH.*#var BLACK_LIST_PATH /data/etc/snort/rules#' \
    -e 's/^\(include $.*\)/# \1/' \
    -e 's/^\(dynamicdetection.*\)/# \1/' \
    -e '$a\\ninclude $RULE_PATH/snort.rules' \
    -e 's!^# \(config logdir:\)!\1 /data/var/log/snort!' \
        /etc/snort/snort.conf

COPY /etc /etc
COPY /tools/ /tools/

RUN rm -f /var/cache/apk/* && rm -rf /tmp/*

ENTRYPOINT ["/tools/boot"]