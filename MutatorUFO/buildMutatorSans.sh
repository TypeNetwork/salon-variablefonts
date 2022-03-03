#!/bin/sh
set -e

buildInstances=true

# build static instances
if $buildInstances
then
    echo "Generating Static TTFs"
    fontmake -m "MutatorSans.designspace" -i -f -o ttf --no-production-names

    echo "Generating Static OTFs"
    fontmake -g "MutatorSans.designspace" -i  -f -o otf --no-production-names
    
fi

echo "Generating Variable TTFs"
fontmake -m "MutatorSans.designspace" -f -o variable --no-production-names

echo "Post processing"

# collect fonts for post-processing
vfs=$(ls variable_ttf/*.ttf)
all_ttfs=$(ls variable_ttf/*.ttf)
all_fonts=$(ls variable_ttf/*.ttf)

# autohint instances and add dsig
if $buildInstances
then

    all_ttfs=$(ls instance_ttf/*.ttf variable_ttf/*.ttf)
    #all_ttfs=$(ls instance_ttf/*.ttf)
    all_fonts=$(ls instance_ttf/*.ttf instance_otf/*.otf variable_ttf/*.ttf)
    #all_fonts=$(ls instance_ttf/*.ttf instance_otf/*.otf)
    static_ttfs=$(ls instance_ttf/*.ttf)
    for ttf in $static_ttfs
    do
        gftools fix-dsig -f $ttf;
        ttfautohint $ttf "$ttf.fix";
        if [ -f "$ttf.fix" ]
        then
            mv "$ttf.fix" $ttf
        fi
    done
fi

echo "Fixing Hinting"
for ttf in $all_ttfs
do
    echo 'fixing hinting' $ttf
	gftools fix-hinting $ttf;
    if [ -f "$ttf.fix" ]
    then
        mv "$ttf.fix" $ttf
    fi
done

echo "Done"