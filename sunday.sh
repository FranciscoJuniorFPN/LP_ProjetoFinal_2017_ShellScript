#!/bin/bash

function firstroutine {
 	Url=$(whiptail --title "Entrada de url pelo usuário" --inputbox "Digite a url:" --fb 10 60 3>&1 1>&2 2>&3)

	firefox $Url  
}

function secondroutine {
	now=$(date +"%T")
	zenity --info --title="Horário" --text "tempo atual : $now" --width="100" height="50" 2> /dev/null
}


function thirdroutine {
	 rhythmbox-client --play @
}

whiptail --title "Sunday Mk.IV" --checklist --separate-output "Escolha:" 15 60 4 \
"Mozilla" "" on \
"Horario" "" off \
"Rhythmbox" "" off 2>results

while read choice
do
        case $choice in
                Mozilla) firstroutine
                ;;
                Horario) secondroutine
                ;;
                Rhythmbox) thirdroutine
                ;;
                *)
                ;;
        esac
done < results
