#~/Desktop/bash.sh

# Jeeves - Backup ~ DropBox
# NEXT UPDATE: Create + Check for DropBox folder - 5/2/18


#Obtain Directory
SITEDIR="$HOME/Desktop"
DOWNDIR="$HOME/Downloads"
DATE=$(date +%m%d%y)
cd $SITEDIR

#Day of Week
let DOW=$(date +%u)

case "$DOW" in
"1")
	DAY="MONDAY"
	;;
"2")
	DAY='TUESDAY'
	;;
"3")
	DAY='WEDNESDAY'
	;;
"4")
	DAY='THURSDAY'
	;;
"5")
	DAY='FRIDAY'
	;;
"6")
	DAY='SATURDAY'
	;;
"7")
	DAY='SUNDAY'
	;;
*)
	echo "Something's broke..."
	exit 0
	;;
esac


# 4/26/17 EDIT ( Backup to Dropbox )
#printf "\n    	Beginning DropBox storage ...    \n"
cp $DAY.tar.gz ../Dropbox/$DAY.tar.gz

# DROPBOX BACKUP LOG

if [ -e $HOME/Dropbox/$DAY.tar.gz ]; then
	echo " $DAY.tar.gz overwritten on $DATE  -- Request from user :: $USER" >> $HOME/Dropbox/Backup_Log.txt
	#echo " 		\ **************************** / " >> $HOME/Dropbox/Backup_Log.txt
else
	echo " $DAY.tar.gz created $DATE  -- Request from user :: $USER" >> $HOME/Dropbox/Backup_Log.txt
	#echo " 		\ **************************** / " >> $HOME/Dropbox/Backup_Log.txt
fi

# END DROPBOX BACKUP
mv $DAY.tar.gz backup/

exit 0
