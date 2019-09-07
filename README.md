# Utapri
* Utapri database library for princesses and princes


# How to Use
```
> const utapri = require("utapri")
> utapri.characters.find(i => i.name == "聖川真斗")
{
  name: '聖川真斗',
  name_en: 'MASATO HIJIRIKAWA',
  sex: 'male',
  height: '181cm',
  weight: '64kg',
  birthday: '12月29日',
  blood_type: 'A',
  group: 'ST☆RISH',
  color_code: '#005bab',
  birthplace: '京都府',
  birthplace_en: 'Kyoto'
}
> utapri.characters.find(i => i.name == "聖川真斗").birthday
'12月29日'

> utapri.songs.filter(i => i.singers.includes("聖川真斗"))
[
  {
    title: 'WONDER☆RONDO',
    album: 'うたの☆プリンスさまっ♪ Shining LiveテーマソングCD2',
    singers: [
      '一十木音也', '聖川真斗',
      '四ノ宮那月', '一ノ瀬トキヤ',
      '神宮寺レン', '来栖翔',
      '愛島セシル'
    ],
    date: '2019-08-28'
  },
  {
    title: '真なる旋律は最愛を歌う',
    album: 'ソロベストアルバム 聖川真斗「HOLY KNIGHT」',
    singers: [ '聖川真斗' ],
    date: '2019-07-03'
  },
  {
    title: 'HOLY KNIGHT',
    album: 'ソロベストアルバム 聖川真斗「HOLY KNIGHT」',
    singers: [ '聖川真斗' ],
    date: '2019-07-03'
  }
  ...
```
