# README

[@SunHigh105](https://twitter.com/SunHigh105)がRuby on Railsを用いて練習用に作ったWebアプリケーションです。

https://arcane-shelf-71959.herokuapp.com/

テストに関する様々な情報を共有するサイト、という程で作りました。


### 開発環境の起動方法

※ Dockerがいります。

```
docker-compose build

docker-compose up -d
```

http://localhost:3000/

で開発環境を確認できます。

開発環境でrailsコマンドを実行したいときは

```
docker-compose run web 
```

の後に続けてください。
