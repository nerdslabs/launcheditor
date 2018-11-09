# LaunchEditor

[![Travis](https://img.shields.io/travis/nerdslabs/launcheditor.svg)](https://travis-ci.org/nerdslabs/launcheditor) ![Docs](https://img.shields.io/badge/version-WIP-e75734.svg)

**_WIP - Currently works only on OSX and Linux_**

**Open file in editor from Elixir with Plug.**

Add our `LaunchEditor.Plug` to your configuration, you can also set assets root if it's other than root `/`.

```elixir
plug LaunchEditor.Plug, assets_root: "assets/"
```

To launch files, send requests to the server like the following:

```
/__open-in-editor?file=src/main.js
```
