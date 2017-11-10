#!/bin/bash
##Second Commit
#Shell script to download Youtube channels playlists 



tput clear
userVar=`whoami`
tput cup 7 22
echo "........Hi $userVar........"
sleep 3
tput cup 8 10
echo "....Welcome To My Youtube Playlist Downloader...."
sleep 5
tput clear
addNumVar=9
num1Var=1
yVar="y"

pacmanNumVar=16
installerComplementVar="install"
installerVar="apt-get"
lynxNumVar=14
youtubeDlNumVar=20
which pacman &> .portalgeek.pacman.which.row.file.unic
whichPacmanCompareVar=`wc -c .portalgeek.pacman.which.row.file.unic | cut -d" " -f1`
if [ $whichPacmanCompareVar -eq $pacmanNumVar ]
    then
    rm .portalgeek.pacman.which.row.file.unic &> /dev/null
    which lynx &> .whichLynx.portalGeekLive.row.file
    whichLynxCompareVar=`wc -c .whichLynx.portalGeekLive.row.file | cut -d" " -f1`
    if [ $whichLynxCompareVar -ne $lynxNumVar ]
        then
        echo "You need to install lynx-cur in order for this script to work!"
        echo "Would You like to install lynx-cur?(y/n):"
        read answer1Var
        if [ $answer1Var = $yVar ]
            then
            sudo pacman -Sy lynx
            rm .whichLynx.portalGeekLive.row.file
        else
            echo "You can not run this script without lynx-cur........."
            sleep 5
            echo "Exiting the script........."
            sleep 3
            tput clear
            rm .whichLynx.portalGeekLive.row.file
            exit
        fi
    fi
    which youtube-dl &> .whichYoutubeDl.portalGeekLive.row.file
    whichYoutubeDlCompareVar=`wc -c .whichYoutubeDl.portalGeekLive.row.file | cut -d" " -f1`
    if [ $whichYoutubeDlCompareVar -ne $youtubeDlNumVar ]
        then
        echo "You need to install Youtube-dl in order for this script to work!"
        echo "Would You like to install youtube-dl?(y/n):"
        read answer2Var
        if [ $answer2Var = $yVar ]
            then
            sudo pacman -Sy youtube-dl
            rm .whichYoutubeDl.portalGeekLive.row.file
        else
            echo "You can not run this script without youtube-dl........."
            sleep 5
            echo "Exiting the script........."
            sleep 3
            tput clear
            rm .whichYoutubeDl.portalGeekLive.row.file
            exit
        fi
    fi
fi


installerVar="apt-get"
installerComplementVar="install"
which lynx > .whichLynx.portalGeekLive.row.file
whichLynxCompareVar=`wc -l .whichLynx.portalGeekLive.row.file | cut -d" " -f1`
if [ $whichLynxCompareVar -ne $num1Var ]
    then
    echo "You need to install lynx-cur in order for this script to work!\nWould You like to install lynx-cur?(y/n):"
    read answer1Var
    if [ $answer1Var = $yVar ]
	    then
	    sudo $installerVar $installerComplementVar lynx-cur
	    rm .whichLynx.portalGeekLive.row.file
    else
	    echo "You can not run this script without lynx-cur........."
	    sleep 5
	    echo "Exiting the script........."
	    sleep 3
	    tput clear
	    rm .whichLynx.portalGeekLive.row.file
	    exit
    fi
fi
which youtube-dl > .whichYoutubeDl.portalGeekLive.row.file
whichYoutubeDlCompareVar=`wc -l .whichYoutubeDl.portalGeekLive.row.file | cut -d" " -f1`
if [ $whichYoutubeDlCompareVar -ne $num1Var ]
    then
    echo "You need to install Youtube-dl in order for this script to work!\nWould You like to install youtube-dl?(y/n):"
    read answer2Var
    if [ $answer2Var = $yVar ]
	    then
	    sudo $installerVar $installerComplementVar youtube-dl
	    rm .whichYoutubeDl.portalGeekLive.row.file
    else
	    echo "You can not run this script without youtube-dl........."
        sleep 5
	    echo "Exiting the script........."
        sleep 3
        tput clear
	    rm .whichYoutubeDl.portalGeekLive.row.file
        exit
    fi

fi
rm .whichYoutubeDl.portalGeekLive.row.file
rm .whichLynx.portalGeekLive.row.file
tput clear
tput cup 7 25
echo "Press Ctrl+C to Quit"
tput cup 8 20
echo "Please insert the Playlist url:"
read urlVar
tput clear
tput cup 7 25
echo "Press Ctrl+C to Quit"
tput cup 8 18
echo "Give a name to your new Playlist:"
read playlistNameVar
tput clear
tput cup 7 25
echo "Press Ctrl+C to Quit"
tput cup 8 4
echo "How many Videos would you like to Download from this Playlist:"
read playlistNumVar
tput clear
exportVideoNumVar=`expr $playlistNumVar + $addNumVar`
if [ $playlistNumVar -le $addNumVar ]
    then
    echo "Checking Arguments......."
    sleep 1
    tput clear
    tput cup 7 16
    echo ".....Please Enter a Number Higher Then $addNumVar....."
    sleep 3
    tput cup 1 1
    echo "Exiting the script........."
    sleep 1
    tput cup 8 24
    echo "...Please Try Again Later..."
    sleep 2
    exit
else
    exportVideoNumVar=`expr $playlistNumVar + $addNumVar`
    echo "$urlVar" > .fullPlayListUrlFile.row.file
    playListUrlResoltVar=`cut -d"=" -f3 .fullPlayListUrlFile.row.file`
    echo "Checking Arguments......."
    overBeltNumCheckVar=`lynx --source "$urlVar" | grep "$playListUrlResoltVar" | tail -$exportVideoNumVar | head -1 | cut -d"\"" -f4 | cut -d"-" -f4 | cut -d" " -f3`
    confirmationLineVar="playlist"
    if [ $overBeltNumCheckVar = $confirmationLineVar ]
        then
        rm .fullPlayListUrlFile.row.file
        mkdir $playlistNameVar
	cd $playlistNameVar
        exportVideoNumVar=`expr $playlistNumVar + $addNumVar`
        echo "Arguments Check Ok......."
        sleep 1
        echo "Downloading $playlistNumVar Videos into the folder $playlistNameVar........"
        sleep 1.5
        lynx --source "$urlVar" | grep "$playListUrlResoltVar" | tail -$exportVideoNumVar | head -$playlistNumVar | cut -d"\"" -f2 | cut -d"&" -f1 | while read linhaVar;do youtube-dl -tc "https://www.youtube.com$linhaVar";done
        tput clear
        echo "All $playlistNumVar was successfully transferred"
    else
        tput clear
        rm .fullPlayListUrlFile.row.file
        tput cup 7 16
	echo ">>> The Number You Entered is to High <<<"
	sleep 3
        tput cup 1 1
        echo "Exiting the script........."
        sleep 1
	tput cup 8 24
        echo "...Please Try Again Later..."
	sleep 2
        tput clear  
    fi
fi

firefox www.portalgeeklive.com
