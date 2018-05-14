#~/Desktop/bash.sh

# Jeeves - Backup ~ Local


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


#Check if backup exists - Deprecated ***********
#if [ -e backup ]; then
	#echo "	   Backup Drive Detected ~~"
#else
	#$(mkdir backup)
	#echo "     Backup Folder Created!"
#fi


# Check if Previous backup exists - Deprecated ***********
#if [ -e $HOME/Desktop/backup/$DAY.tar.gz ]; then
	#echo "   Old $DAY backup present, Overwriting... "
#else
	#echo "   No old backup present, Creating... "
#fi


#Tar ball
$(tar -czf $DAY.tar.gz Docs/Spr_2018/)
# Tar ball causes delay



cd $HOME/Desktop/backup
# 1/30/17 edit
if [ -e $HOME/Desktop/backup/$DAY.tar.gz ]; then
	echo " $DAY.tar.gz overwritten on $DATE  -- Request from user :: $USER" >> Backup_Log
	echo " 		\ **************************** / \n" >> Backup_Log
else
	echo " $DAY.tar.gz created $DATE  -- Request from user :: $USER" >> Backup_Log
	echo " 		\ **************************** / \n" >> Backup_Log
fi
# end 1/30/17 edit
exit 0
