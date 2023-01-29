FROM debian:stable-slim

WORKDIR /var/www/html

RUN apt-get -qq update \
  && apt-get -qq -y install curl zip neovim unzip \
  && curl -s https://gist.githubusercontent.com/LukeChannings/09d53f5c364391042186518c8598b85e/raw/ac8cd8c675b985edd4b3e16df63ffef14d1f0e24/deno_install.sh | sh \
  && apt-get -qq remove curl zip unzip \
  && apt-get -qq remove --purge -y curl zip unzip \
  && apt-get -qq -y autoremove \
  && apt-get -qq clean \
  && echo 'export DENO_INSTALL="/root/.deno"' >> ~/.bash_profile \
  && echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> ~/.bash_profile

CMD ["/bin/bash", "-c", "source ~/.bash_profile && bash"]
