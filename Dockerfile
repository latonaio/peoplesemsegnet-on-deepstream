FROM nvcr.io/nvidia/deepstream-l4t:6.0.1-samples      
RUN mkdir -p /app/src

RUN apt update && \
    apt install -y vim ffmpeg x11-apps

CMD /bin/bash

