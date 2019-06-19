require "json"
require 'json-schema'
require 'yaml'

json = File.open('./utapri.json').read
schema = JSON.dump(
  YAML::load(File.open('./utapri-schema.yml').read)
)
raise "Json schema is wrong" unless JSON::Validator.fully_validate(schema, json, strict: false) == []

content = JSON.parse(File.read("./utapri.json"))
songs = content["songs"].sort_by do |hash|
  hash["date"]
end

content["songs"] = songs.reverse


File.write('utapri.json', JSON.pretty_generate(content))