# Trust me
To install the packages from [pkg.sluga.xyz](https://pkg.sluga.xyz/) you will need to trust me.

```sh
$ wget https://jole.xyz/jole.gpg.txt
# pacman-key --add jole.gpg.txt
# pacman-key --lsign-key 5C87B8AA6915737CFC95FB0638E725A0D4D095C1
```

and finally add the url to `pacman.conf`:
```
[main]
Server = https://pkg.sluga.xyz/archports/$repo/os/$arch
```

# Build your own
cd into a directory with a PKGBUILD, then run `makepkg -c --sign` and `../../upload.sh the-package-1.2.3-x86_64.pkg.tar.zst`. You'll have to change the server you upload to obviously.
