FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y cmake clang git wget vim curl bash libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 && \
    rm -rf /var/lib/apt/lists/*

# INSTALL CONDA
ARG TARGETARCH
ENV CONDA_DIR=/opt/conda
RUN set -eux; \
    case "${TARGETARCH:-}" in \
    "amd64") CONDA_URL='https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh' ;; \
    "arm64") CONDA_URL='https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh' ;; \
    *) ARCH=$(uname -m); \
       if [ "$ARCH" = "x86_64" ]; then CONDA_URL='https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh'; \
       elif [ "$ARCH" = "aarch64" ]; then CONDA_URL='https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh'; \
       else echo "Unsupported arch: ${TARGETARCH:-$ARCH}"; exit 1; fi ;; \
    esac; \
    curl -fsSL -o /tmp/miniconda.sh "$CONDA_URL"; \
    bash /tmp/miniconda.sh -b -p "$CONDA_DIR"; \
    rm -f /tmp/miniconda.sh; \
    "$CONDA_DIR"/bin/conda clean -afy
ENV PATH=/opt/conda/bin:${PATH}
RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main && \
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
RUN conda create -y -n bitnet-cpp python=3.12
RUN conda run -n bitnet-cpp pip install sentencepiece
RUN conda run -n bitnet-cpp pip install -r requirements.txt
RUN conda run -n bitnet-cpp python hello.py
