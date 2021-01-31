#!/bin/bash

# Makes two fimes: _site.yml and index.Rmd
# index.Rmd needs to be updated each time a new html file
# - typically a rendered Rmd script - is added to the folder

OUTPUT="_site.yml"
TITLE="cfDNA Analysis - An Examination of the DELFI Approach"
#DESCRIPTION="Put subtitle here"

echo 'name: "cfDNA_DELFI"' > $OUTPUT
echo 'output_dir: "."' >> $OUTPUT
echo 'navbar:' >> $OUTPUT
echo '  title: '$TITLE >> $OUTPUT
echo '  left:' >> $OUTPUT
echo '    - text: "Home"' >> $OUTPUT
echo '      href: index.html' >> $OUTPUT


OUTPUT="index.Rmd"

echo '---' > $OUTPUT
echo 'title: '$TITLE >> $OUTPUT
echo '---' >> $OUTPUT
echo >> $OUTPUT
echo $DESCRIPTION >> $OUTPUT
echo >> $OUTPUT

files="`ls *.html`"
for f in $files
do
  if [ $f != "index.html" ]
  then
    echo '<li><a href="'$f'">'${f}'</a></li>' >> $OUTPUT
  fi
done

###     echo '<li><a href="'$f'">'${f#_}'</a></li>' >> $OUTPUT

