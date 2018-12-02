# LaunchEditor

[![Travis](https://img.shields.io/travis/nerdslabs/launcheditor.svg)](https://travis-ci.org/nerdslabs/launcheditor) [![Hex](https://img.shields.io/hexpm/v/launcheditor.svg)](https://hex.pm/packages/launcheditor) [![Downloads](https://img.shields.io/hexpm/dt/launcheditor.svg)](https://hex.pm/packages/launcheditor)

**Open file in current working editor from Elixir.**

### Installation:

```elixir
def deps do
  [{:launcheditor, "~> 0.1.0"}]
end
```

### Basic usage

```elixir
LaunchEditor.run("lib/some_file.ex", 10)
```

### Plug supported

Add `LaunchEditor.Plug` to your application. If assets path is other than root `/` like in Phoenix Framework you can change it by passing option `assets_root`.

```elixir
plug LaunchEditor.Plug, assets_root: "assets/"
```

To open file from browser you can send request:

```
/__open-in-editor?file=src/main.js
```

You can use it with `Plug.Debugger`:

```
PLUG_EDITOR=/__open-in-editor?file=__FILE__&line=__LINE__ iex -S mix phx.server
```

### Supported editors

✓ - tested | • - supported

| Value           | Editor                                                                 | Linux | Windows | OSX |
| --------------- | ---------------------------------------------------------------------- | :---: | :-----: | :-: |
| `appcode`       | [AppCode](https://www.jetbrains.com/objc/)                             |       |         |  •  |
| `atom`          | [Atom](https://atom.io/)                                               |   •   |    ✓    |  •  |
| `atom-beta`     | [Atom Beta](https://atom.io/beta)                                      |       |         |  •  |
| `brackets`      | [Brackets](http://brackets.io/)                                        |   •   |    ✓    |  •  |
| `clion`         | [Clion](https://www.jetbrains.com/clion/)                              |       |    •    |  •  |
| `code`          | [Visual Studio Code](https://code.visualstudio.com/)                   |   •   |    •    |  ✓  |
| `code-insiders` | [Visual Studio Code Insiders](https://code.visualstudio.com/insiders/) |   •   |    •    |  •  |
| `idea`          | [IDEA](https://www.jetbrains.com/idea/)                                |   •   |    •    |  •  |
| `notepad++`     | [Notepad++](https://notepad-plus-plus.org/download/v7.5.4.html)        |       |    ✓    |     |
| `pycharm`       | [PyCharm](https://www.jetbrains.com/pycharm/)                          |   •   |    •    |  •  |
| `phpstorm`      | [PhpStorm](https://www.jetbrains.com/phpstorm/)                        |   •   |    •    |  •  |
| `rubymine`      | [RubyMine](https://www.jetbrains.com/ruby/)                            |   •   |    •    |  •  |
| `sublime`       | [Sublime Text](https://www.sublimetext.com/)                           |   •   |    ✓    |  •  |
| `visualstudio`  | [Visual Studio](https://www.visualstudio.com/vs/)                      |       |         |  •  |
| `webstorm`      | [WebStorm](https://www.jetbrains.com/webstorm/)                        |   •   |    •    |  •  |

**Please [create issue](https://github.com/nerdslabs/launcheditor/issues/new?template=editor-report.md) with results of using supported but not tested editor.**

### TODO:

- Support of open file with specific line
- Support of terminal editors
- Test all editors
