FROM ubuntu:latest
SHELL ["/bin/bash", "-c"]

ARG UID=1000
ARG GID=1000

RUN echo $UID $GID

RUN apt-get update

# tools for users
RUN apt-get install -y sudo curl vim git

# create user
RUN groupadd -g $GID -o move
RUN useradd -m -d /home/move -u $UID -g $GID -s /bin/bash move
RUN usermod -aG sudo move
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER move
WORKDIR /home/move

RUN git clone https://github.com/move-language/move.git ~/move

RUN cd ~/move
RUN ~/move/./scripts/dev_setup.sh -bypt

RUN source ~/.profile
ENV PATH="/home/move/.cargo/bin:/home/move/.local/bin:$PATH"

RUN cargo install --path ~/move/language/tools/move-cli
RUN cargo install --path ~/move/language/move-analyzer
