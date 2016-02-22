# Challenge

To use, run `mix challenge <test_data.json>`.

To run tests, run `mix test`.

## Rationale

Elixir is a fast, concurrency-friendly language built on the Erlang VM. It has been the #2 FP for me to learn in the past year, running just below Clojure due to its greater applicability in JVM ecosystems.

It has a lot of things going for it. It features Erlang's blazing speed, immutability, and actor model concurrency, while fixing a few of its turn-offs. It uses a Ruby-influenced syntax rather than Erlang's... let's say _polarizing_ Prolog-based syntax. Elixir's `mix` build tool is a step up from Erlang's `rebar3`. Plus, the Elixir community is growing quickly and developing some great frameworks like Phoenix, a full-featured web framework that may very well replace Rails for my own personal work. That said, as a niche language, it's hard to find the ideal use outside of side projects. I've been working on a React/Phoenix app and doing a few Elixir exercism puzzles, and know that this is something I'd like to explore more.

The syntax is (to me) fairly obvious, but in case it isn't, a glance over the (Elixir Getting Started Guide)[http://elixir-lang.org/getting-started/introduction.html] should clarify things.

Since this challenge didn't specify a language and doesn't require anything particular to any specific standard library, I took that as an invitation to apply my current pet language.

I've written a decent amount about FP languages and how they were an improvement for my own development style over the design-centric, POODR-influenced Ruby OOP I'd been used to. If I were to rewrite this in Ruby or Javascript, it would be structured in much the same way. I would adhere to the conventions of the respective languages, but it would still use this problem-solving approach: simple data structures, reusable functions, transforming data without mutation by using `reduce`, `map`, and `filter`. I would start by defining my problems in the broadest integration test I could reasonably write, then solve the problem, using the larger tests to help define my internal API and writing unit tests along the way to nail down the smaller parts.
