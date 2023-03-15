#!/bin/bash

{ clear; }


ROSA="$(printf '\033[1;35m')"
VERM="$(printf '\033[1;31m')"
VERD="$(printf '\033[1;32m')"
AZUL="$(printf '\033[1;34m')"
CEAN="$(printf '\033[1;36m')"


exit_on_signal_SIGINT() {
        { printf "\n\n%s\n\n" "${VERM}[×] VOCÊ APERTOU CTRL+C. O PROGRAMA FOI INTERROMPIDO!" 2>&1; }
        exit 0
}

exit_on_signal_SIGTERM() {
        { printf "\n\n%s\n\n" "${ROSA} PROGRAMA ENCERRADO." 2>&1; }
        exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM


cmatrix() {
	/usr/bin/cmatrix &
	pid=$!
	sleep 3
	kill $pid
}

banner() {
	figlet -f pagga Termux 2 . 0 | lolcat
	{ sleep 1; }
	echo ""
}

sub-banner() {
	echo "${CEAN} SCRIPT CRIADO PARA COLORIR O TERMINAL !"
	echo ""
	echo "${ROSA}         FEITO POR${CEAN}: ${VERD}VICTOR SILVA"
	echo ""
	echo ""

}

input() {
	read -p "${AZUL} INFORME SEU NOME: ${VERD}" NOME
	{ sleep 1; echo ""; }

	read -p "${AZUL} INFORME O NOME PARA SEU BANNER: ${VERD}" BANNER
	{ sleep 1; echo ""; }
}

script() {
	echo "cowsay -f cowsay01 "$NOME" | lolcat" > cowsay.txt
	echo "toilet -f big "$BANNER" -F gay | lolcat" > figlet.txt
	echo ""
	echo "clear" > clear.txt
	cat clear.txt >> /data/data/com.termux/files/usr/etc/bash.bashrc
	cat cowsay.txt >> /data/data/com.termux/files/usr/etc/bash.bashrc
	ls
	cat figlet.txt >> /data/data/com.termux/files/usr/etc/bash.bashrc
}


cmatrix
banner
sub-banner
input
script
