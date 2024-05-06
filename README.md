## Play Online
https://mataclysm.itch.io/star-wars-rpg-tools

## Requirements
- Install [Godot Engine 4.2.1](https://godotengine.org/download/windows/)
- Install [Butler](https://itch.io/docs/butler/installing.html)

## Build
```
godot_console.exe --headless --export-release "Windows Desktop" --quiet 2>$null
godot_console.exe --headless --export-release "Web" --quiet 2>$null
```

## Publish
```
butler push C:\Users\matte\Documents\Games\Star-Wars-RPG-Tools\Windows\ mataclysm/Star-Wars-RPG-Tools:windows
butler push C:\Users\matte\Documents\Games\Star-Wars-RPG-Tools\Web\ mataclysm/Star-Wars-RPG-Tools:html
```

## Host Web Build Locally
```
dotnet tool install --global dotnet-serve
dotnet serve --directory C:\Users\matte\Documents\Games\Star-Wars-RPG-Tools\Web\ -h "Cross-Origin-Opener-Policy: same-origin" -h "Cross-Origin-Embedder-Policy: require-corp" -h "Access-Control-Allow-Origin: *" --open-browser
```
