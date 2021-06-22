

[![Image from Gyazo](https://i.gyazo.com/95ce1cffd9f67de130e3a1318af8fbf1.png)](https://gyazo.com/95ce1cffd9f67de130e3a1318af8fbf1)

<br>
<br>
<br>

http://www.listavin.com
-----------------------------------------------------

# listavinとは
**listavin（リスタヴァン）はワインの管理アプリケーションです。**
<br>
<br>
レストランやカフェなどで働く方のためのワイン管理ツール**listavin**はたくさん種類のあるワインを
いかに簡単に管理するかを考えて開発しました。
<br>
<br>
ワインはたくさんの種類があり、数万種類は日本あります。<br>
小さなレストランでも過去扱ったことのワインを含めると数百種類に及びます。<br>
２０１０年はこんな味、２０１５年はこんな味でこんな作り方に変わったなど、
扱う情報が大量にあります。
そのため、情報の共有が難しいのが問題でした。
<br>
<br>
それを解決するために**listavin**は誕生しました。<br>
**listavin**にワインの情報を登録することでワインの名前やワイン生産者はもちろん、
仕入れ価格や販売価格。原価率、ワインの卸会社がどこかなどもわかります。
<br>
<br>
 ## 開発経緯
 このアプリケーションを開発しようと考えた理由は<br>
 前職がレストランのホール担当だったのですが、常に２００本の在庫を抱えるお店でした。<br>
<!--  しかし、酒飲みではなく、そこまでワインに興味を持てなかった自分はいかにこのワインの情報を管理して
 お客様にマッチするワインを提供するかを考えました。<br> -->
 ほとんどのお店がソムリエやワイン担当の頭の中で情報を管理しています。<br>
 しかし、ワインに詳しいスタッフが常にお店にいることは難しい。担当者が辞めてしまったときはワインの味がわからない。。。でも、売らなければいけない。<br>
 このワインはいくらで販売すれば適正なのかが、わからないなどの問題が常に起こっていました。
 <br>
 <br>
 ワインの情報をデータベースに登録して、スピーディーに検索することが出来るアプリケーションがあれば、<br>
 混乱が起きず、より良い接客をすることができ、満足度が上がることでお店の売り上げをあげることが出来るのではと考えたのが理由です。
<br>
<br>
<br>
# listavinの2つの機能
listavinの機能を大きく2つに分けると、

#### ●ワイン管理ツール
#### ●ワインリスト

の2つの機能です。<br>
<br>
このアプリケーションはワインの情報を管理する機能と別でワインリストとしての機能を持っています。<br>
データベースと連動することで、動的に内容を変えることが可能になります。<br>
<br>
<br>
<br>

## ワインリスト機能
在庫がないのに、メニューに載ったままになっている。<br>
新しいワインが入ったのに、まだ載せられていないので売ることが難しい...。<br>
そんな問題を解決します。<br>
<br>
メニューはあくまでも店員とのコミュニケーションツールと考え<br>
検索機能などは付けずに、あくまでも紙に印刷されたようなシンプルなレイアウトにしてあります。<br>
<br>
在庫が０の場合は表示されないようにしてあります。<br>
またワインの情報は登録しているけど、載せたくない売りたくないということも可能です。
<br>
<br>
<br>

## ワイン管理機能
ワイン管理機能はまず、ワインを登録するところから始まります。<br>
<br>
登録することができる情報は、
1. ワイン名
2. ワイン生産者名
3. ワインの種類（スパークリング、赤、白）
4. ヴィンテージ
5. 生産国
6. 生産地域（州・県名など）
7. ぶどう品種
8. 仕入れ価格
9. 販売価格
10. テイスティングコメント
11. メモ
12. 在庫数
13. ワインリストに載せるか載せないか
<br>
<br>

[![Image from Gyazo](https://i.gyazo.com/42712f355a8e444413ccae50094e5423.png)](https://gyazo.com/42712f355a8e444413ccae50094e5423)
<br><br>
**仕入れ価格を入力すると、隣に販売する目安価格が表示されます。**<br>

**販売価格を入力すると、原価率が表示されます。**
<br>
<br>
<br>

#### ●一覧表示機能

登録されたワインの情報が一覧表示されます。
20件ずつページネーションされます。
<br>
<br>
[![Image from Gyazo](https://i.gyazo.com/8d1262f47ae50007cc564fbcce399e13.png)](https://gyazo.com/8d1262f47ae50007cc564fbcce399e13)
<br>
<br>

#### ●ソート機能

検索したワインを値段順で並び替えたり、生産者順などで並び替えることも可能です。<br>
調べたいワインの情報がスピーディーに見つけることができます。
<br>
<br>
[![Image from Gyazo](https://i.gyazo.com/a4d226e75f628b2337fb6b0d8b3e33fd.png)](https://gyazo.com/a4d226e75f628b2337fb6b0d8b3e33fd)
<br>
<br>

#### ●検索機能

管理画面の検索機能を使いワインを絞り込むことができます。<br>
品種での検索や値段帯、国名での検索が可能です。<br>
<br>
<br>

[![Image from Gyazo](https://i.gyazo.com/e26e411d87c76ef9e002e2b5d902fb93.png)](https://gyazo.com/e26e411d87c76ef9e002e2b5d902fb93)
<br><br>

#### ●編集機能

もちろんワインの編集をすることも可能です。<br>
編集ボタンをクリックして、編集してください。
<br>
<br>

#### ●コピー機能

ヴィンテージが違うのに、もう一度一からワインの情報を入力することは大変です。<br>
コピーボタンを押すことでコピーされ、編集することで簡単にワインを登録できます。
<br>
<br>

#### ●削除機能

いらないワインなど、ワインの情報を消したい場合は削除ボタンを押せば、削除可能です。
<br>
<br>

#### ●詳細ページ

ワイン名をクリックすることでワインの詳細ページに遷移し、<br>
一覧表示でワインの情報がわかります。<br>
原価率も表示することで利益がどれくらい出るのかもわかりやすくなっています。
<br>
<br>
[![Image from Gyazo](https://i.gyazo.com/426da48197e906aebb6f41008ef7ebd8.png)](https://gyazo.com/426da48197e906aebb6f41008ef7ebd8)
<br>
<br>
<br>

# 使用技術
- フロントエンド
  - HTML
  - CSS
  - CSSフレームワーク Bulma
  - Vue.js
<br>

- バックエンド
  - Ruby 2.6.6
  - Ruby on Rails 6.1.3

- インフラ
  - AWS(EC2, VPC)
  - MySQL
  - nginx
  - Unicorn
  - Docker, Docker-compose

# ER図

[![Image from Gyazo](https://i.gyazo.com/c412f062c5a3784c73d5a049fbaff357.png)](https://gyazo.com/c412f062c5a3784c73d5a049fbaff357)

