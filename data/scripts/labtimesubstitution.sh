
#-------------------------------------------------------------------#
# SCRIPT BY MARVIN COTO JIMENEZ. marvin.coto@ucr.ac.cr              #
# UNIVERSITY OF COSTA RICA (COSTA RICA)                             #
# AUTONOMOUS METROPOLITAN UNIVERSITY (MEXICO)                       #
#                                                                   #
#                                                                   #
#-------------------------------------------------------------------#
# $1: /gv/qst001/ver1/fal                                           #
# $2: /data/labels/full                                             #
# $3: /data/labels/gen                                              #

cd $1
for labfile in *.lab
do
OUTNAME=timed_`basename $labfile .lab`.lab; 
awk '{print $1" "$2}' "$labfile" | awk '{printf "%10.0f %10.0f\n", $1, $2}' > temp1
awk '{print $3}' $2/"$labfile" > temp2
paste -d" " temp1 temp2 > "$OUTNAME"
rm temp1 temp2
rm "$labfile"
mv "$OUTNAME" "$labfile"
done

cp *.lab $3



