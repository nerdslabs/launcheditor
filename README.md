# LaunchEditor

[![Travis](https://img.shields.io/travis/nerdslabs/launcheditor.svg)](https://travis-ci.org/nerdslabs/launcheditor) ![Docs](https://img.shields.io/badge/version-WIP-e75734.svg)

**_WIP_**

**Open file in editor from Elixir with Plug.**

Add our `LaunchEditor.Plug` to your configuration, you can also set assets path if it's other than root `/`.

```elixir
plug LaunchEditor.Plug, assets_root: "assets/"
```

To launch files, send requests to the server like the following:

```
/__open-in-editor?file=src/main.js
```

You can use it with `Plug.Debugger`:

```
PLUG_EDITOR=/__open-in-editor?file=__FILE__&line=__LINE__ iex -S mix phx.server
```
