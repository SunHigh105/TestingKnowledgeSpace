# README

Ruby on Railsを用いて練習用に作ったWebアプリケーションです。

https://arcane-shelf-71959.herokuapp.com/

テストに関する様々な情報を共有するサイト、という程で作りました。


### 開発環境の起動方法

※ Docker for Macのインストール必須

```
docker-compose build

docker-compose up -d
```

http://localhost:3000/

で開発環境を確認できます。

開発環境でrailsコマンドを実行したいとき

```
docker-compose run web [command]
```
