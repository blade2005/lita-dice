# lita-dice

**lita-dice** is a handler for [Lita](https://github.com/jimmycuadra/lita) that allows you to roll virtual dice.

## Installation

Add lita-dice to your Lita instance's Gemfile:

``` ruby
gem "lita-dice"
```

## Usage

To roll the dice:

```
 [You] Lita: roll
[Lita] User rolled 5
 [You] Lita: roll 2
[Lita] User rolled 3 4 (7)
 [You] Lita: roll d100
[Lita] User rolled 42
 [You] Lita: roll 3d20
[Lita] User rolled 13 1 15 (29)
```

## Configuration
```
config.handlers.dice.max_dice = 40 # Optional
config.handlers.dice.max_sides = 5000 # Optional
```

## License

[MIT](http://opensource.org/licenses/MIT)
