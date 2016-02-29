# Media Parsing Challenge

To use, run `./challenge --input <JSON data file>`.

To run with test data, run `./challenge --test`.

To run tests, run `mix test`.

## Libraries

This project uses mostly the Elixir standard library, with the exception of [Poison](https://github.com/devinus/poison), a JSON parsing library.

## Rationale

Elixir is a fast, concurrency-friendly language built on the Erlang VM. It has been the #2 FP for me to learn in the past year, running just below Clojure due to its greater applicability in JVM ecosystems.

It has a lot of things going for it. It features Erlang's blazing speed, immutability, and actor model concurrency, while fixing a few of its turn-offs. It uses a Ruby-influenced syntax rather than Erlang's... let's say _polarizing_ Prolog-based syntax. Elixir's `mix` build tool is a step up from Erlang's `rebar3`. Plus, the Elixir community is growing quickly and developing some great frameworks like Phoenix, a full-featured web framework that may very well replace Rails for my own personal work. That said, as a niche language, it's hard to find the ideal use outside of side projects. I've been working on a React/Phoenix app and doing a few Elixir exercism puzzles, and know that this is something I'd like to explore more.

The syntax is (to me) fairly obvious, but in case it isn't, a glance over the [Elixir Getting Started Guide](http://elixir-lang.org/getting-started/introduction.html) should clarify things.

Since this challenge didn't specify a language and doesn't require any specific libraries, I took that as an invitation to apply my current pet language.

I've written a decent amount about FP languages and how they were an improvement for my own development style over the design-centric, POODR-influenced Ruby OOP I'd been used to. If I were to rewrite this in Ruby or Javascript, it would be structured in much the same way. I would adhere to the conventions of the respective languages, but it would still use this problem-solving approach: simple data structures, reusable functions, transforming data without mutation by using `reduce`, `map`, and `filter`. I would start by defining my problems in the broadest integration test I could reasonably write, then solve the problem, using the larger tests to help define my internal API and writing unit tests along the way to nail down the smaller parts.

## Other Code

- **Good**: [Hermes](https://github.com/dysnomian/hermes), one of my earlier attempts to wrangle my Ruby code into a functional style.
- **Terrible**: [Numberwang Rules](https://github.com/dysnomian/wangbot/blob/master/lib/wangbot/numberwang_policy.rb), easily the best worst code I've ever written, and the culmination of my frustration with convoluted Ruby. This was part of an attempt to implement the rules of [Numberwang](https://www.youtube.com/watch?v=qjOZtWZ56lc) in an appropriately nonsensical way. Unfortunately, I abandoned the project because I couldn't think of a way to make the tests just as bad... but maybe it's time to try again.
- **Intriguing**: [Emunit](https://github.com/dysnomian/emunit), a test framework for the [Emily](https://www.youtube.com/watch?v=gMZsc3cvwKs) language. It's mostly just an exploration of the language and an attempt to push past some of the development barriers with an early stage experimental language. Familiarizing myself with it has given me a few aha! moments regarding parsers and FP, and I hope that as I grow as a developer, I'll be able to keep uncovering nuances.
