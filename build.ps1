godot_console.exe --headless --export-release "Windows Desktop" --quiet
godot_console.exe --headless --export-release "Linux" --quiet
godot_console.exe --headless --export-release "Web" --quiet

cp -Force C:\Users\matte\Documents\Games\Star-Wars-RPG-Tools\Web\* C:\Users\matte\Documents\GitHub\mataclysmgames.github.io\star-wars-rpg-tools\

butler push C:\Users\matte\Documents\Games\Star-Wars-RPG-Tools\Linux\ mataclysm/Star-Wars-RPG-Tools:linux
butler push C:\Users\matte\Documents\Games\Star-Wars-RPG-Tools\Windows\ mataclysm/Star-Wars-RPG-Tools:windows
butler push C:\Users\matte\Documents\Games\Star-Wars-RPG-Tools\Web\ mataclysm/Star-Wars-RPG-Tools:html
