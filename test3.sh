#!/bin/bash

function firstroutine {
	Url=$(whiptail --title "Entrada de url pelo usuário" --inputbox "Digite 	a url:" --fb 10 60 3>&1 1>&2 2>&3)
	exitstatus=$?
	if [ $exitstatus = 0 ]; then
		echo "O url digitado foi: $Url" 
	else
		echo "Entrada cancelada pelo usuário."
	fi
}

function secondroutine {
 echo "running glens function"
}


function thirdroutine {
 echo "running adams function"
}

P=$(whiptail --title "Jarvinho Mk.II" --checklist \
"Selecione o que iniciar no boot" 15 60 4 \
"Mozilla" "Firefox" ON \
"Terminal" "Linux" OFF \
"Rhythmbox" "media player" OFF \
"Horário" "" OFF 3>&1 1>&2 2>&3)

while read choice
do
        case $choice in
                Mozilla) firstroutine
                ;;
                Terminal) secondroutine
                ;;
                Rhythmbox) thirdroutine
                ;;
                *)
                ;;
        esac
done

exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Os programas escolhidos foram:" $P
else
    echo "Voce escolheu Cancel."
fi
