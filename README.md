# vb-objects-plus

This friendly fork of Volker Boehm's excellent [vb-objects](https://github.com/v7b1/vb-objects) has the following changes:

- Includes 3 other externals from Volker, [bonk~](https://github.com/v7b1/bonk_64bit-version), [fiddle~](https://github.com/v7b1/fiddle_64bit_version), and [sigmund~](https://github.com/v7b1/sigmund_64bit-version) which are all 64-bit versions of the popular puredata objects by Miller Puckette for MaxMSP

- macOS only

- Homebrew based dependency management instead of building everything in-source in `libs`

Therefore it requires:

```bash

brew install aubio fftw libsamplerate

```

- Defaults to native architecture architectures (no universal binaries by default)

- Added a Makefile to as a simplified frontend to the cmake build

```bash
make update # to update git submodules
make 
make link   # to symlink folder to $HOME/Max 8/Packages/vb-objectss
```

The original README starts from here:

--- 

This is a slowly growing collection of externals made for the programming environment MaxMSP (www.Cycling74.com).



## Building

### Mac

You can build on the command line using Makefiles, or you can generate an Xcode project and use the GUI to build.

- Xcode:

  ```
  cmake -G Xcode ..
  cmake --build . --config 'Release'
  ```

  or, instead of the second step, open the Xcode project and use the GUI.

- Make:

  ```
  cmake ..
  cmake --build . --config 'Release'
  ```

  Note that the Xcode project is preferrable because it is able to substitute values for e.g. the Info.plist files in your builds.



### Windows

Note: this is untested, but should work something like this:

```
cmake ..
cmake --build . --config 'Release'
```



Compiled objects for osx can be found here: https://vboehm.net/downloads
