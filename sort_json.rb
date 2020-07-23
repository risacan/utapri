require "json"
require 'json-schema'
require 'yaml'

puts "one"
json = File.open('./utapri.json').read
schema = JSON.dump(
  YAML::load(File.open('./utapri-schema.yml').read)
)
raise "Json schema is wrong" unless JSON::Validator.fully_validate(schema, json, strict: false) == []

content = JSON.parse(File.read("./utapri.json"))

songs = content["songs"].sort do |a, b|
  [a["date"], a["title"]] <=> [b["date"], b["title"]]
end

content["songs"] = songs.reverse
formatted_json = JSON.pretty_generate(content)

puts "two"
File.write('utapri.json', formatted_json)

yml = YAML.dump(JSON.load(formatted_json))
File.write("utapri.yml", yml)

puts "three"