#~/Desktop/bash.sh

# Jeeves - Cleanup ~ Downloads


#Obtain Directory
SITEDIR="$HOME/Desktop"
DOWNDIR="$HOME/Downloads"
DATE=$(date +%m%d%y)

#printf "         ~~ Begin Trash Cleanup ~~  \n"

# Downloads Folder Cleanup

cd $DOWNDIR
#Set VAR to # of files in Downloads Folder
VAR=$(ls -1q ./ | wc -l)
MINFILECOUNT=2
if [ "$VAR" > "$MINFILECOUNT" ]; then

	#printf "            Cleanup Commencing     \n"
	# Zip current and store
	rm Leftovers.tar.gz
	$(tar -czf Leftovers.tar.gz ./*)
	mv Leftovers.tar.gz ../Desktop
	rm -r ./*
	mv ../Desktop/Leftovers.tar.gz ./
	#printf "           ~~ Trash Recycled ~~  \n"

	# Trash Pickup
else
	printf "    Downloads is already pristine! Skipping cleanup ... \n"
fi

exit 0
