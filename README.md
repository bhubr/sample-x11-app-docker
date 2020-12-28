# Dockerizing a simple X11 app

I especially wanted to test running an X11 app from a Docker container with WSL2.

## TL;DR

* Install a X11 server for Windows like [VcXsrv](https://sourceforge.net/projects/vcxsrv/).
* Build the image: `docker build -t x11-app-docker .`
* In WSL2, set your `DISPLAY` variable (see 4th link): `export DISPLAY=$(ip route | awk '/^default/{print $3; exit}'):0`
* Run from WSL2: `docker run -e DISPLAY=$DISPLAY -d x11-app-docker`

## Context

I wanted to try running a simple X11 app from a Docker container.

I copy-pasted code from a tutorial (1st link) and added a Dockerfile. I won't get into how to create a Dockerfile. It uses the latest Alpine image, installs `g++` and `libx11-dev`, compiles the app and runs it.

Since the containerized Linux had no display, the container shut down as soon as I first started it (I used Docker `events` to make sure the error message was `Cannot open display`.

## Links

1. [Programming: Simple X11 Code Sample for Linux and Mac OS X](https://www.geeks3d.com/20120102/programming-tutorial-simple-x11-x-window-code-sample-for-linux-and-mac-os-x/)
2. [Install packages in Alpine Docker](https://stackoverflow.com/questions/48281323/install-packages-in-alpine-docker)
3. [How can I debug a docker container initialization?](https://serverfault.com/questions/596994/how-can-i-debug-a-docker-container-initialization)
4. [How to set up working X11 forwarding on WSL2](https://stackoverflow.com/questions/61110603/how-to-set-up-working-x11-forwarding-on-wsl2#answer-63092879)
5. [VcXsrv Windows X Server](https://sourceforge.net/projects/vcxsrv/) A Windows X-Server