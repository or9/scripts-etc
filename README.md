# scripts-etc

Scripts that I have written or found useful. Probably Linux / Unix

[Aria2c](#aria)

## <a name="aria"></a>Aria .bat Script

Symbolic link can be created to Sys32 directory. Open cmd as Admin and enter the following (from C:\Windows\System32),
````
mklink aria.bat \Users\<your username>\Downloads\aria.bat
````
Now open a new prompt as a normal user, and you should be able to run `aria some?magnet&url@1337.torrent.magnet` or `aria C:\Users\<your username>\Documents\my-list-file.txt` and expect it to run with good options