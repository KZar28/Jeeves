#~/Desktop/bash.sh

# Jeeves - Backup / Trash


printf "\n                     Jeeves - BDT  v3.01\n"
printf "\n               Built by Kevin Zarzana - 5/2/18 \n\n"
echo "-------------------------------------------------------"
#echo "           Backing Up Files ... "
notify-send "Backing up TState Folder ... "
#echo "Bash version ${BASH_VERSION} ..."

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
	exit 0 ;;
esac
printf "               ____________________ \n"
printf "         ___  |    Jeeves v3.01    | \n"
printf "        /_| | |    Backup-Truck    | \n"
printf "       |    |_|____________________| \n"
printf "       ~-O----O-O-----------O-O---------------------- \n"
echo "---------------------Beep -- Beep----------------------"
echo "----------------------Backing Up----------------------" & ~/Desktop/bash/backup-zip.sh
wait
printf "\n\n"
echo "-----------------Syncing with DropBox------------------" & ~/Desktop/bash/backup-DropBox.sh
wait
printf "\n\n"
echo "------------------Cleaning Downloads------------------" & ~/Desktop/bash/backup-DownloadsCleanup.sh
wait
printf "\n\n"

cd $SITEDIR

VAR=$(cat backup/Backup_Log | wc -l )
VAR=$((VAR / 2))

printf "                %s - Backups completed         \n \n" "$VAR"

echo "-------------------------------------------------------"
printf "\n    Current Semester Docs  --->  backup/$DAY.tar.gz \n \n"

notify-send "Backed up!"
exit 0
