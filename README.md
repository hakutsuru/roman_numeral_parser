roman_numeral_parser
==================

Abstract
--------------

So I get tested, because... I do not use LinkedIn or something.

Let us parse [Roman Numerals](https://en.wikipedia.org/wiki/Roman_numerals#Reading_Roman_numerals).

For testing data, I found a listing online of [1-5000](http://www.tuomas.salste.net/doc/roman/numeri-romani-1-5000.html).

Here is the summarized test. I am trying to be curt, but not obfuscate -- doing so would make the code stupid. Also, clever searching will reveal similar code (where capable indexing is available).

[Apologies for using the vagrant environment from euler_001.]

Demands
--------------

Your task is to create a function **roman_numeral_from_string** that takes a roman numeral as a string numeral and returns it as an integer. If the string is not valid return None.

There are lots of edge cases for this test and while we don't expect you get all of them, but we do expect you to make reasonable progress in the time given.

Roman numerals are a numeric system used by the romans. They consisted of seven symbols:

**Symbol** *Value*
```
I        1
V        5
X        10
L        50
C        100
D        500
M        1000
```

The test is expected to take around 30 minutes.

This test will require you to solve the exercise in the Python programming language.

Thunks
--------------

If one were to explore *warpt*, [Six](https://en.wikipedia.org/wiki/The_Prisoner) could discern my fixation on edge-cases (were he not so busy looking for exits)...

Honestly, I am afraid to look at the test site. When faced with a coding challenge, I *think*. I will figure out a solution, and implement it -- this disqualifies me from Ruby cabals that preach *craft* (which requires testing first).

For this exercise, I wrote out the 1 through 9 pattern, and identified special cases. I mused about loops (as there could be a way to avoid the repetitive parsing calls, but they are *explicit* and simple). I hacked substrings via the interactive shell, checking basic syntax. **Then I coded the solution -- all this took ~75 minutes.**

(And note how the expression still lacks elegance, using parameters "one", "five" and "ten" for the symbols which change based on which power-of-ten is being parsed).

**Testing took another 60 minutes.**

Based on this work (and unlimited arrogance), I would be impressed by anyone who could *achieve anything worthwhile on this problem* in only 30 minutes.

**Further, while TDD is a neat trick (and I am told it is worth trying), I doubt this is the kind of solution you get when starting with tests.**

Revisionism
--------------

Who would presume to say TDD was *worth trying*, and admit that it *does not always work*. Is there anyone so *pragmatic about testing*?

Congrats if you muttered [Martin Fowler](http://www.martinfowler.com).

I was impressed by his views on testing at [**Rethink NYC**](https://info.thoughtworks.com/rethink-nyc.html), 2016 July 13th.

So Ruby? I respect ThoughtWorks, so I will publish their test, but... Zim and Gir use some Roman accounting to procure waffles! There is a description of Roman Numerals oozing elegance (think boysenberry). But I got maple already (and scars from the tap), so reuse for the fail.

Oh, and I will fail with *aplomb*.


