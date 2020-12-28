FROM alpine:latest

WORKDIR /opt/x11app

COPY *.c .
RUN apk add --no-cache g++ libx11-dev
RUN g++ app.c -o app -I/usr/X11R6/include -I/usr/X11R6/include/X11 -L/usr/X11R6/lib -L/usr/X11R6/lib/X11 -lX11
CMD [ "./app" ]