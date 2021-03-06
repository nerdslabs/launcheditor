defmodule LaunchEditor.Editors do
  def osx do
    %{
      "/Applications/Atom.app/Contents/MacOS/Atom" => "atom",
      "/Applications/Atom Beta.app/Contents/MacOS/Atom Beta" =>
        "/Applications/Atom Beta.app/Contents/MacOS/Atom Beta",
      "/Applications/Brackets.app/Contents/MacOS/Brackets" => "brackets",
      "/Applications/Sublime Text.app/Contents/MacOS/Sublime Text" =>
        "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl",
      "/Applications/Sublime Text 2.app/Contents/MacOS/Sublime Text 2" =>
        "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl",
      "/Applications/Sublime Text Dev.app/Contents/MacOS/Sublime Text" =>
        "/Applications/Sublime Text Dev.app/Contents/SharedSupport/bin/subl",
      "/Applications/Visual Studio Code.app/Contents/MacOS/Electron" => "code",
      "/Applications/Visual Studio Code - Insiders.app/Contents/MacOS/Electron" =>
        "code-insiders",
      "/Applications/AppCode.app/Contents/MacOS/appcode" =>
        "/Applications/AppCode.app/Contents/MacOS/appcode",
      "/Applications/CLion.app/Contents/MacOS/clion" =>
        "/Applications/CLion.app/Contents/MacOS/clion",
      "/Applications/IntelliJ IDEA.app/Contents/MacOS/idea" =>
        "/Applications/IntelliJ IDEA.app/Contents/MacOS/idea",
      "/Applications/PhpStorm.app/Contents/MacOS/phpstorm" =>
        "/Applications/PhpStorm.app/Contents/MacOS/phpstorm",
      "/Applications/PyCharm.app/Contents/MacOS/pycharm" =>
        "/Applications/PyCharm.app/Contents/MacOS/pycharm",
      "/Applications/PyCharm CE.app/Contents/MacOS/pycharm" =>
        "/Applications/PyCharm CE.app/Contents/MacOS/pycharm",
      "/Applications/RubyMine.app/Contents/MacOS/rubymine" =>
        "/Applications/RubyMine.app/Contents/MacOS/rubymine",
      "/Applications/WebStorm.app/Contents/MacOS/webstorm" =>
        "/Applications/WebStorm.app/Contents/MacOS/webstorm"
    }
  end

  def linux do
    %{
      "atom" => "atom",
      "Brackets" => "brackets",
      "code" => "code",
      "emacs" => "emacs",
      "idea.sh" => "idea",
      "phpstorm.sh" => "phpstorm",
      "pycharm.sh" => "pycharm",
      "rubymine.sh" => "rubymine",
      "sublime_text" => "subl",
      "vim" => "vim",
      "webstorm.sh" => "webstorm"
    }
  end

  def windows do
    [
      "Brackets.exe",
      "Code.exe",
      "atom.exe",
      "sublime_text.exe",
      "notepad++.exe",
      "clion.exe",
      "clion64.exe",
      "idea.exe",
      "idea64.exe",
      "phpstorm.exe",
      "phpstorm64.exe",
      "pycharm.exe",
      "pycharm64.exe",
      "rubymine.exe",
      "rubymine64.exe",
      "webstorm.exe",
      "webstorm64.exe"
    ]
  end
end
