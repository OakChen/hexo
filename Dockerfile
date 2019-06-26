FROM ubuntu:latest
MAINTAINER Oak Chen <oak@sfysoft.com>

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends npm ca-certificates procps vim git && \
    apt-get install -y --no-install-recommends command-not-found command-not-found-data && \
    apt-get install -y --no-install-recommends language-pack-en language-pack-en-base && \
    apt-get install -y --no-install-recommends language-pack-zh-hans language-pack-zh-hans-base && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN npm install -g \
    eslint \
    hexo-cli \
    hexo-asset-image \
    hexo-baidu-url-submit \
    hexo-deployer-git \
    hexo-generator-archive \
    hexo-generator-baidu-sitemap \
    hexo-generator-category \
    hexo-generator-feed \
    hexo-generator-index \
    hexo-generator-json-content \
    hexo-generator-sitemap \
    hexo-generator-tag \
    hexo-neat \
    hexo-renderer-ejs \
    hexo-renderer-markdown-it-plus \
    hexo-renderer-stylus \
    hexo-wordcount \
    request \
    xml-parser \
    yamljs

EXPOSE 4000

ENV LANG en_US.utf8
ENV LANGUAGE en_US:en
