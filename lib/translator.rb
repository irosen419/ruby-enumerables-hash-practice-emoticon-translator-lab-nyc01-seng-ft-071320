require 'yaml'
require 'pry'

def load_library(file)
  emoticon_hash = YAML.load(File.read(file))
  result = emoticon_hash.each_with_object({}) do |(key, value), final_hash|
    if !final_hash[key]
      final_hash[key] = {
        :english => value[0],
        :japanese => value[1]
      }
    end
  end
  result
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning(yaml_file, j_emoticons)
  english_meaning = ""
  sorry = "Sorry, that emoticon was not found"
  library = load_library(yaml_file)
  library.each do |meaning, langs|
    langs.each do |in_key, emoti|
      emoti == j_emoticons ? return meaning : english_meaning == sorry
    end
  end
  english_meaning
end
