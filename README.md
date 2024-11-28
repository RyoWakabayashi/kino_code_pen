# KinoCodePen

[![KinoCodePen version](https://img.shields.io/hexpm/v/kino_code_pen.svg)](https://hex.pm/packages/kino_code_pen)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/kino_code_pen/)
[![Hex Downloads](https://img.shields.io/hexpm/dt/kino_code_pen)](https://hex.pm/packages/kino_code_pen)
[![LICENSE](https://img.shields.io/hexpm/l/kino_code_pen.svg)](https://github.com/RyoWakabayashi/kino_code_pen/blob/master/LICENSE)

A simple Kino for display CodePen pens on Livebook.

## Installation

Install KinoCodePen in Livebook:

```elixir
Mix.install([
  {:kino_code_pen, "~> 0.1"}
])
```

## Usage

Display a CodePen pen on Livebook:

```elixir
KinoCodePen.new("ryowakabayashi", "qBQeGvX")
```
