Fuzzy
======

A Lit package that can preform a fuzzy comparison on 2 strings using the [Levenshtein Distance algorithm](https://en.wikipedia.org/wiki/Levenshtein_distance). Originally forked from [this gist](Forked from this gist: https://gist.github.com/Badgerati/3261142), and modified to fit the Lit style.

### How It Works

The "Levenshtein distance algorithm", returns a number when comparing 2 strings. This number, represent the number of changes needed to be made to the first string, in order to create a result like the second string.

**Example (From Wikipedia)**

For example, the Levenshtein distance between "kitten" and "sitting" is 3, since the following three edits change one into the other, and there is no way to do it with fewer than three edits:

* kitten → sitten (substitution of "s" for "k")
* sitten → sittin (substitution of "i" for "e")
* sittin → sitting (insertion of "g" at the end)

### Example

I include an example in the file named [fuzzy-test.lua](https://github.com/james2doyle/lit-fuzzy/blob/master/fuzzy-test.lua). What I do is set a word that I am looking for, iterate through a table of sentences, then I save a new table with a key => value, where the key is the Levenshtein number, and the value is the sentence. Then I sort the table by key.

I can then see which sentence had the lowest Levenshtein number, and therefore, the best result.