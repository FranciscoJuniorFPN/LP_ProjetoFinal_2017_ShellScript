#!/bin/bash

function firstroutine {
	Url=$(whiptail --title "Entrada de url pelo usuário" --inputbox "Digite a url:" --fb 10 60 3>&1 1>&2 2>&3)

	firefox $Url &

}

function secondroutine {
	rhythmbox-client --play @
}


function thirdroutine {
	now=$(date +"%T")
	zenity --info --title="Horário" --text "tempo atual : $now" --width="100" height="50" 2> /dev/null
}

whiptail --title "Sunday Mk.IV" --checklist --separate-output "Escolha:" 15 60 4 \
"Mozilla" "" OFF \
"Rhythmbox" "" OFF \
"Horario" "" OFF 2>results

while read choice
do
        case $choice in
                Mozilla) firstroutine
                ;;
                Rhythmbox) secondroutine
                ;;
                Horario) thirdroutine
                ;;
                *)
                ;;
        esac
done < results

