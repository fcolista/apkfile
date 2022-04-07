FROM alpine:latest
LABEL maintainer="Francesco Colista [francesco.colista@gmail.com]"
RUN apk add --no-cache html2text curl && \
	wget https://raw.githubusercontent.com/fcolista/apkfile/main/apkfile -O /usr/bin/apkfile && \
	chmod +x /usr/bin/apkfile
ENTRYPOINT ["/usr/bin/apkfile"]
