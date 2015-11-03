# seisafesta2015
てきとう

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
3. そのうちビルドされます

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
Werckerが勝手にやるのでヘタにいじらないでください

## なにかおかしくなったら
[New issue](../..//issues) を書いて [@S64](github.com/S64) までくれるとひまなときに直します
[New pull request](../../pulls) を書いてくれたら感動します
