local sprintf = require('string').format
local insert = require('table').insert
local sort = require('table').sort

local levenshtein = require('./init')

-- Im looking for the word "Lorem" in my table of sentences
local query = 'Lorem'

-- a list of sentences we are going to compare to our query
local sentences = {
  "Lorem ipsum dolor sit amet, consectetur adipisicing elit.",
  "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
  "Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  "Maecenas quis libero massa. Nullam eget dignissim quam, non volutpat mi. Sed tempor vehicula mauris.",
  "Ut sollicitudin odio porta at. Integer eget leo in turpis pretium congue. Proin tristique porta nisl.",
  "Sollicitudin faucibus tellus tristique in. Aenean dolor dui, ultricies eget lobortis vitae, facilisis vel lacus.",
  "Vestibulum laoreet lobortis est, vel lobortis nibh pellentesque a. Class aptent taciti sociosqu ad litora torquent.",
  "Per conubia nostra, per inceptos himenaeos. Sed ac varius neque, a vestibulum purus. Morbi ac elementum metus.",
  "Duis diam sapien, finibus quis magna quis, accumsan gravida nisl."
}

-- our table of results from each comparison
local results = {}

print(sprintf('Looking for %q', query))

-- add the items to our results table
-- where the Levenshtein number is the key, and the sentence is the value
local function queue(rating, sentence)
  if results[rating] == nil then
    results[rating] = sentence
  else
    -- recursive call
    -- a result with the same rating was already found,
    -- so increment this rating and try to save again
    queue(rating + 1, sentence)
  end
end

-- do all the comparisons
for i = 1, #sentences do
  local rating = levenshtein(query, sentences[i])
  queue(rating, sentences[i])
end

print('Display results sorted by the key')

-- simple sorting function to order our table by key
local function pairsByKeys (t, f)
  local a = {}
  for n in pairs(t) do insert(a, n) end
  sort(a, f)
  local i = 0      -- iterator variable
  local iter = function ()   -- iterator function
  i = i + 1
  if a[i] == nil then return nil
    else return a[i], t[a[i]]
    end
  end
  return iter
end

-- show me the results
for name, result in pairsByKeys(results) do
  print(name, result)
end