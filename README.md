# vb-objects

This is a fork of Volker Boehm's [vb-objects](https://github.com/v7b1/vb-objects)

It has the following changes:

- macOS only

- Homebrew based dependency management instead of building everything in-source in `libs`

Therefore it requires:

```bash

brew install aubio fftw libsamplerate

```

- Defaults to native architecture architectures (no universal binaries by default)

- Added a Makefile to kick off the cmake build

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
