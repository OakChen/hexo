# A Docker image for Hexo

A docker image for hexo blog system, using offical node and npm version in Ubuntu.

## Download from Docker Hub

    docker pull oakchen/hexo

## Usage

    docker run -it -p 4000:4000 oakchen/hexo

Then, you can use common hexo commands to generate blog site.

    hexo init XXX
    cd XXX
    hexo new article
    hexo generate
    hexo server

After the server starts up, you can browse your site at:

http://dockerhost:4000/

## Pre-installed modules:

    eslint
    hexo-cli
    hexo-asset-image
    hexo-baidu-url-submit
    hexo-deployer-git
    hexo-generator-archive
    hexo-generator-baidu-sitemap
    hexo-generator-category
    hexo-generator-feed
    hexo-generator-index
    hexo-generator-json-content
    hexo-generator-sitemap
    hexo-generator-tag
    hexo-neat 
    hexo-renderer-ejs
    hexo-renderer-markdown-it-plus
    hexo-renderer-stylus
    hexo-wordcount
    request
    xml-parser
    yamljs

## Others

There is a wrapped shell script to run this docker: https://github.com/OakChen/hexo/raw/master/run.sh.

