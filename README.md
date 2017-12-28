# Utapri
* Utapri yaml for princesses and princes


# How to Use
```
require "yaml"

yaml = YAML.load_file("utapri.yml")

yaml["songs"].select{|s| s["singers"].include?("聖川真斗")}.map{|s| s["title"]} # => ["Lost Alice", "Shining☆Romance", "Lasting Oneness", "I swear...", "NIGHT DREAM", "BLOODY SHADOWS", "天空のミラクルスター", "ORIGINAL RESONANCE", "静炎ブレイブハート", "天下無敵の忍び道", "Beautiful Love", "RAINBOW☆DREAM", "恋桜", "Sanctuary", "Dream more than Love", "Knocking on the mind", "Mostフォルティシモ", "DOUBLE WISH", "BLUE×PRISM HEART", "永遠のトライスター", "騎士のKissは雪より優しく", "AMAZING LOVE", "Welcome to UTA☆PRI world!!", "マジLOVE1000%", "未来地図", "マジLOVE2000%", "夢追人へのSymphony", "マジLOVEレボリューションズ", "サンキュ", "マジLOVEレジェンドスター", "未来、夢、ありがとう…そして!", "Shining Star Xmas", "ADVENT ACE", "一緒にHang in there♪", "夢を歌へと…!", "WE ARE ST☆RISH!!", "GOLDEN☆STAR"]

yaml["songs"].select{|s| s["singers"] == ["愛島セシル"]}.map{|s| s["title"]} # => ["甘美なるアルカディア", "GREEN AMBITION", "星のファンタジア", "Happiness", "Eternity Love", "愛と夢とアナタと", "DESTINY SONG", "愛のREINCARNATION"]
```
