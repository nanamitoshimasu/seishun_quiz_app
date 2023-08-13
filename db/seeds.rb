# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
questions = [
  ["高校生の時の所属部活はなんでしょう？", "水泳部", "ラクロス部", "帰宅部"],
  ["短大生の時にしたハロウィンの仮装はなんでしょう？", "マリリン・マンソン", "バニーガール", "毛利蘭"],
  ["狂ったように好きだった歌手は誰でしょう？", "東方神起", "Hey!Say!JUMP", "EXILE"],
  ["明日の天気は？", "はれ", "あめ", "くもり"],
  ["学生時代好きだった人との結末は？", "そんなものない", "今も…♡", "甘酸っぱいお別れ"]
]

questions.each do |question, answer, wrong_1, wrong_2|
  Question.create!(
    content: question,
    correct_answer: answer,
    wrong_answer_1: wrong_1,
    wrong_answer_2: wrong_2
  )
end
