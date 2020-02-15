
http://masnun.rocks/2016/10/01/creating-an-executable-file-using-cython/

http://stackoverflow.com/questions/5105482/compile-main-python-program-using-cython

https://mdqinc.com/blog/2011/08/statically-linking-python-with-cython-generated-modules-and-packages/

http://stackoverflow.com/questions/3891202/how-to-link-python-static-library-with-my-c-program

= Cython + Pyinstaller =

Build:

```
pyinstaller --clean --onefile --strip main.py
upx ./dist/main
```

Run:
```
./dist/main
```

http://pyinstaller.readthedocs.io/en/stable/usage.html?highlight=upx#using-upx
https://github.com/upx/upx

== Example ==

http://stackoverflow.com/questions/24525861/building-cython-compiled-python-code-with-pyinstaller

== Of Bundles ==

http://stackoverflow.com/questions/17486578/how-can-you-bundle-all-your-python-code-into-a-single-zip-file
