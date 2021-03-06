# seisafesta2015

ちょうてきとう (でも動く)

↓さいきんのビルドがおかしいと赤くなるよ  
[![Circle CI](https://circleci.com/gh/seisahachioji/seisafesta2015/tree/master.svg?style=svg)](https://circleci.com/gh/seisahachioji/seisafesta2015/tree/master)

↓ぐるちゃもあるよ  
[Wantedly Sync](#ユースフルリンクス)

## どこでもドア
- [seisafesta2015](#seisafesta2015)
- [とりあえずサイトを見る](#とりあえずサイトを見る)
- [劇場版 THE CONTRIBUTORS -- 貢献者達](#劇場版-the-contributors----貢献者達)
- [ユースフル☆リンクス](#ユースフルリンクス)
- [記事を書くひと用](#記事を書くひと用)
- [コードいじるひと用](#コードいじるひと用)
- [なにかおかしくなったら](#なにかおかしくなったら)

## とりあえずサイトを見る
- [こ↑こ↓](http://seisahachioji.github.io/seisafesta2015/)

## 劇場版 THE CONTRIBUTORS -- 貢献者達
記事を書いたりその他何かやってくれてるらしい人を  
把握してる範囲で挙げるよ

- [Tetsuro Kitano](https://twitter.com/Tetsuro_K1022)
  - テストしたり
  - ライター集めたり
  - なんでもやってくれるよ
- [Hiroki Fujimaki](https://twitter.com/brass_enohpi)
  - ほぼ初めて使うであろうMarkdownに果敢に立ち向かい
  - 色んな事を実験してくれてるよ
- [ぼく](https://twitter.com/shuma_yoshioka)
  - "自分の仕事を極限まで減らす" を達成するために
  - README.mdを充実させたり
  - [Contentful](#ユースフルリンクス)にお金を払ったり
  - てきとうなこーどを書くよ

## ユースフル☆リンクス
- [Sync by Wantedly](http://bit.ly/1MTaa0z)
  - グループチャットです。
  - チームコミュニケーションです。
  - このURLをコピペしてもほかの人を招待できます → http://bit.ly/1MTaa0z
    - ※ こういう文書も公開してるくらいなので 誰がのぞき見しにきてもいいや、と思ってURLを書いてますが  
      入るとフツーに内部向けのグループです。  
      チラ見しただけでも入室のログ付いちゃうので、恥ずかしい思いするかも。  
      クリックは慎重に。
- [gh-pages - GitHub](https://github.com/seisahachioji/seisafesta2015/commits/gh-pages)
  - サイトの変化を追えます
- [Circle CI](https://circleci.com/gh/seisahachioji/seisafesta2015/tree/master)
  - 記事が増えたり変更されるとここでビルドされます。
  - 自分の更新がいつ反映されるか知りたい時とか、
  - いつになっても反映されないとか、
  - 不具合の原因を追う時は
  - まずここを見ること。
- [Contentful](https://app.contentful.com/spaces/culruq1g10hg)
  - ロジック部分以外は全部ここです
  - 記事とか
  - 上部メニューの項目とか
  - 各ページの文言とか
  - ステージとかブースとか
  - ロジックが不要な部分は可能な限りこっちに追いやれるように作ってます
- [Issues](https://github.com/seisahachioji/seisafesta2015/issues)
  - 課題を管理する場所です
  - バグを見つけたり、
  - 改善できそうなポイントあったり、
  - 議論が必要なことがあったら、
  - ここに記録してくれたらめちゃくちゃ喜びます。
  - ここが1番使いやすくて、居心地がよくて、便利で、
  - あー、いいっすねー（屈託のない笑顔）
- [takarock14](https://github.com/seisahachioji/takarock14)
  - 去年のやつ
  - 今年のこれよりはまじめです

## 記事を書くひと用
ことしはGitもMarkdownもWordPressすらわからない人でもギリギリできます  
でも英語アレルギーはさすがにダメです

### はじめてのかたは
1. [@S64](https://github.com/S64) あたりを呼び出して
2. [Contentful](https://app.contentful.com/spaces/culruq1g10hg) の招待を受け取ってね
3. お金はしかたないから僕が払います

### きじのかきかた
1. Entries -> Add New Entry -> News
2. wysiwygなエディタで書いたりすると
3. そのうち[CircleCI](#ユースフルリンクス)でビルドされます

## コードいじるひと用
ことしもMiddlemanです  
けど[去年](#ユースフルリンクス)とちがってテキトーなので色々考えなくてもうごきます

### はじめてのかたは
rubyです。bundlerとかrakeとか、あとnpm、bowerは用意しといてね

1. `git clone 'https://github.com/seisahachioji/seisafesta2015.git'`
2. `rake init`
3. `rake preview`
4. `open http://127.0.0.1:4567/`

環境汚すのがイヤだったら、[置いてあるDockerfile](./Dockerfile) を活用しましょう。  
Wercker用に書いたやつなので、このままでは動きません。

### Contentfulが変わったら
1. `rake init_contentful`
2. `rake preview`

### 試しにビルドする
1. `rake build`
2. `open ./build/index.html`

### 更新を反映する
[CircleCI](#ユースフルリンクス)が勝手にやるので基本いじらないでください  
更新されるタイミングは

- masterのコードが変わった
- [Contentful](#ユースフルリンクス)でなにか変更があった

などです。

[CircleCI](#ユースフルリンクス)がおかしいなど、どうしても更新したい場合には

1. `rake build`
2. `rake deploy`

で できるにはできます。  
環境によってビミョーに動作違ったりするので、基本オススメしません。

## なにかおかしくなったら
- [@shuma_yoshioka](https://twitter.com/shuma_yoshioka) にツイートすると気分がノッてる時に読みます  
- [New issue](../../issues) を書いて [@S64](https://github.com/S64) 宛に送ると時間ある時に直します  
- [New pull request](../../pulls) を書いてくれたら感動します
