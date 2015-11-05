# seisafesta2015
てきとう

[![Circle CI](https://circleci.com/gh/seisahachioji/seisafesta2015/tree/master.svg?style=svg)](https://circleci.com/gh/seisahachioji/seisafesta2015/tree/master)

## みるひと
[こ↑こ↓](http://seisahachioji.github.io/seisafesta2015/)

## 記事を書くひと用
ことしはGitもMarkdownもWordPressすらわからない人でもギリギリできます  
でも英語アレルギーはさすがにダメです

### はじめてのかたは
1. [@S64](github.com/S64) あたりを呼び出して
2. [Contentful](https://app.contentful.com/spaces/culruq1g10hg) の招待を受け取ってね
3. お金はしかたないから僕が払います

### きじのかきかた
1. Entries -> Add New Entry -> News
2. wysiwygなエディタで書いたりすると
3. そのうちCircleCIでビルドされます

## コードいじるひと用
ことしもMiddlemanです  
けど去年とちがってテキトーなので色々考えなくてもうごきます

### はじめてのかたは
rubyです。bundlerとかrakeとか、あとnpm、bowerは用意しといてね

1. `git clone 'https://github.com/seisahachioji/seisafesta2015.git'`
2. `rake init`
3. `rake preview`
4. `open http://127.0.0.1:4567/`

### Contentfulが変わったら
1. `rake init_contentful`
2. `rake preview`

### 試しにビルドする
1. `rake build`
2. `open ./build/index.html`

### 更新を反映する
CircleCIが勝手にやるので基本いじらないでください
更新されるタイミングは

- masterのコードが変わった
- Contentfulでなにか変更があった

などです

## なにかおかしくなったら
- [@shuma_yoshioka](https://twitter.com/shuma_yoshioka) にツイートすると気分がノッてる時に読みます  
- [New issue](../..//issues) を書いて [@S64](https://github.com/S64) 宛に送ると時間ある時に直します  
- [New pull request](../../pulls) を書いてくれたら感動します
