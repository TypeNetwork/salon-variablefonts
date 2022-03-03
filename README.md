# Variable Salon Demos

These examples supplement [Guido Ferreyra](https://tipografia.com.ar)’s talk on Variable Fonts for [Type Network](http://typenetwork.com) on 2022-03-03.

They use [Mutator Sans](https://github.com/LettError/mutatorSans) by [Erik van Blokland](http://letterror.com).


## Mutator UFO

This example uses UFO and designspace, and is designed to be exported using [fontmake](https://github.com/googlefonts/fontmake).

To do a simple build, follow these steps in Terminal:

1. Change your working directory to the folder containing the designspace

```
$ cd /path/to/MutatorUFO
```

2. Run fontmake to generate the variable font. `-f` flattens components to a single level.

```
$ fontmake -o variable -m MutatorSans.designspace -f
```

To build static fonts for the instances, it’s a similar command, adding `-i` to build instances:

```
$ fontmake -o variable -m MutatorSans.designspace -f -i
```

A more complex build can be done with the shell script `buildMutatorSans.sh`. It builds both static and variable font files, and gives an example of postprocessing done with [gftools](http://github.com/googlefonts/gftools).

```
$ bash buildMutatorSans.sh
```

## Mutator Glyphs

This example uses [Glyphs 3](http://glyphsapp.com). They can be exported using `File > Export` in Glyphs.

Glyphs files can also be exported using fontmake, though not all features may apply.

```
$ fontmake -o variable -g MutatorSans.glyphs -f -i
```

