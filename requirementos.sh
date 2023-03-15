#!/bin/bash

clear;

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

instalar() {
	{ sleep 1; clear; ruby; }
        echo "${VERD}[ ${AZUL}+ ${VERD}] INSTALANDO RUBY ${VERD}[ ${AZUL}- ${VERD}]${AZUL}"
        echo ""
        pkg install ruby
        { sleep 1; clear; }

	{ sleep 1; clear; cowsay; }
        echo "${VERD}[ ${AZUL}+ ${VERD}] INSTALANDO COWSAY ${VERD}[ ${AZUL}- ${VERD}]${AZUL}"
        echo ""
        pkg install cowsay
        { sleep 1; clear; }

	{ sleep 1; clear; lolcat; }
	echo "${VERD}[ ${AZUL}+ ${VERD}] INSTALANDO LOLCAT ${VERD}[ ${AZUL}- ${VERD}]${AZUL}"
	echo ""
	gem install lolcat
	{ sleep 1; clear; }

	{ sleep 1; clear; figlet; }
	echo "${VERD}[ ${AZUL}+ ${VERD}] INSTALANDO FIGLET ${VERD}[ ${AZUL}- ${VERD}]${AZUL}"
	echo ""
	pkg install figlet
	{ sleep 1; clear; }

	{ sleep 1; clear; cmatrix; }
	echo "${VERD}[ ${AZUL}+ ${VERD}] INSTALANDO CMATRIX ${VERD}[ ${AZUL}- ${VERD}]${AZUL}"
	echo ""
	pkg install cmatrix
	{ sleep 1; clear; }
}

config_cowsay() {
	{ sleep 1; clear; config; }
		echo ""
		{ sleep 2; }
		if [[ -e /data/data/com.termux/files/home/Termux-Banner2/cowsay01.cow ]]; then
			echo ""
        		echo "${VERD}[ ${AZUL}+ ${VERD}] ADICIONANDO NOVOS COWSAYS ${VERD}[ ${AZUL}- ${VERD}]${AZUL}"
			{ sleep 2; }
			echo ""
			cp cowsay01.cow /data/data/com.termux/files/usr/share/cowsay/cows
			echo "${VERD}[ ${AZUL}+ ${VERD}]${ROSA} ADICIONADOS COM SUCESSO! ${VERD}[ ${AZUL}- ${VERD}]${AZUL}"
			{ sleep 2; clear; }
		fi

	if [[ -e /data/data/com.termux/files/usr/etc/ ]]; then
		rm -rf /data/data/com.termux/files/usr/etc/motd
		rm -rf /data/data/com.termux/files/usr/etc/motd.dpkg-old
	fi
}


banner() {
	{ sleep 1; clear; concluido; }
	echo ""
	echo "${VERD} PARA CONTINUAR USE: ${ROSA}'bash banner.sh'"
	echo ""
	echo ""

}

cowsay() {
	cat <<- EOF
		${VERD}
		${VERD} ▄▄  ▗▄▖ ▄   ▄ ▗▄▖   ▄  ▄▖ ▗▄
		${VERD}█▀▀▌ █▀█ █   █▗▛▀▜  ▐█▌ ▐▙ ▟▌
		${VERD}▛   ▐▌ ▐▌▜▖█▗▛▐▙    ▐█▌  █▄█
		${VERD}▌   ▐▌ ▐▌▐▌█▐▌ ▜█▙  █ █  ▝█▘
		${VERD}▙   ▐▌ ▐▌▐█▀█▌   ▜▌ ███   █
		${VERD}█▄▄▌ █▄█ ▐█ █▌▐▄▄▟▘▗█ █▖  █
		${VERD} ▀▀  ▝▀▘ ▝▀ ▀▘ ▀▀▘ ▝▘ ▝▘  ▀
		${VERD}
	EOF
}

lolcat() {
	cat <<- EOF
		${VERM}
		${VERM}▗▖    ▗▄▖ ▗▖     ▄▄   ▄  ▗▄▄▄▖
		${VERM}▐▌    █▀█ ▐▌    █▀▀▌ ▐█▌ ▝▀█▀▘
		${VERM}▐▌   ▐▌ ▐▌▐▌   ▐▛    ▐█▌   █
		${VERM}▐▌   ▐▌ ▐▌▐▌   ▐▌    █ █   █
		${VERM}▐▌   ▐▌ ▐▌▐▌   ▐▙    ███   █
		${VERM}▐▙▄▄▖ █▄█ ▐▙▄▄▖ █▄▄▌▗█ █▖  █
		${VERM}▝▀▀▀▘ ▝▀▘ ▝▀▀▀▘  ▀▀ ▝▘ ▝▘  ▀
		${VERM}


	EOF
}

figlet() {
	cat <<- EOF
		${CEAN}
		${CEAN}▗▄▄▄▖ ▄▄▄   ▄▄ ▗▖   ▗▄▄▄▖▗▄▄▄▖
		${CEAN}▐▛▀▀▘ ▀█▀  █▀▀▌▐▌   ▐▛▀▀▘▝▀█▀▘
		${CEAN}▐▌     █  ▐▌   ▐▌   ▐▌     █
		${CEAN}▐███   █  ▐▌▗▄▖▐▌   ▐███   █
		${CEAN}▐▌     █  ▐▌▝▜▌▐▌   ▐▌     █
		${CEAN}▐▌    ▄█▄  █▄▟▌▐▙▄▄▖▐▙▄▄▖  █
		${CEAN}▝▘    ▀▀▀   ▀▀ ▝▀▀▀▘▝▀▀▀▘  ▀
		${CEAN}
	EOF

}

cmatrix() {
	cat <<- EOF
		${ROSA}
		${ROSA}  ▄▄ ▗▄ ▄▖  ▄  ▗▄▄▄▖▗▄▄▖  ▄▄▄ ▗▄ ▄▖
		${ROSA} █▀▀▌▐█ █▌ ▐█▌ ▝▀█▀▘▐▛▀▜▌ ▀█▀  █▄█
		${ROSA}▐▛   ▐███▌ ▐█▌   █  ▐▌ ▐▌  █   ▐█▌
		${ROSA}▐▌   ▐▌█▐▌ █ █   █  ▐███   █    █
		${ROSA}▐▙   ▐▌▀▐▌ ███   █  ▐▌▝█▖  █   ▐█▌
		${ROSA} █▄▄▌▐▌ ▐▌▗█ █▖  █  ▐▌ ▐▌ ▄█▄  █ █
		${ROSA}  ▀▀ ▝▘ ▝▘▝▘ ▝▘  ▀  ▝▘ ▝▀ ▀▀▀ ▝▀ ▀▘
		${ROSA}
	EOF
}

config() {
	cat <<- EOF
		${ROSA}
		${ROSA}  ▄▄  ▗▄▖ ▗▄ ▗▖▗▄▄▄▖ ▄▄▄   ▄▄ ▗▖ ▗▖▗▄▄▖   ▄  ▗▄ ▗▖▗▄▄   ▗▄▖
		${CEAN} █▀▀▌ █▀█ ▐█ ▐▌▐▛▀▀▘ ▀█▀  █▀▀▌▐▌ ▐▌▐▛▀▜▌ ▐█▌ ▐█ ▐▌▐▛▀█  █▀█
		${CEAN}▐▛   ▐▌ ▐▌▐▛▌▐▌▐▌     █  ▐▌   ▐▌ ▐▌▐▌ ▐▌ ▐█▌ ▐▛▌▐▌▐▌ ▐▌▐▌ ▐▌
		${VERD}▐▌   ▐▌ ▐▌▐▌█▐▌▐███   █  ▐▌▗▄▖▐▌ ▐▌▐███  █ █ ▐▌█▐▌▐▌ ▐▌▐▌ ▐▌
		${VERD}▐▙   ▐▌ ▐▌▐▌▐▟▌▐▌     █  ▐▌▝▜▌▐▌ ▐▌▐▌▝█▖ ███ ▐▌▐▟▌▐▌ ▐▌▐▌ ▐▌
		${VERM} █▄▄▌ █▄█ ▐▌ █▌▐▌    ▄█▄  █▄▟▌▝█▄█▘▐▌ ▐▌▗█ █▖▐▌ █▌▐▙▄█  █▄█
		${VERM}  ▀▀  ▝▀▘ ▝▘ ▀▘▝▘    ▀▀▀   ▀▀  ▝▀▘ ▝▘ ▝▀▝▘ ▝▘▝▘ ▀▘▝▀▀   ▝▀▘
		${VERM}
	EOF
}

concluido() {
	cat <<- EOF
		${VERD}
		${VERD}  ▄▄  ▗▄▖ ▗▄ ▗▖  ▄▄ ▗▖   ▗▖ ▗▖ ▄▄▄ ▗▄▄   ▗▄▖
		${VERD} █▀▀▌ █▀█ ▐█ ▐▌ █▀▀▌▐▌   ▐▌ ▐▌ ▀█▀ ▐▛▀█  █▀█
		${VERD}▐▛   ▐▌ ▐▌▐▛▌▐▌▐▛   ▐▌   ▐▌ ▐▌  █  ▐▌ ▐▌▐▌ ▐▌
		${VERD}▐▌   ▐▌ ▐▌▐▌█▐▌▐▌   ▐▌   ▐▌ ▐▌  █  ▐▌ ▐▌▐▌ ▐▌
		${VERD}▐▙   ▐▌ ▐▌▐▌▐▟▌▐▙   ▐▌   ▐▌ ▐▌  █  ▐▌ ▐▌▐▌ ▐▌
		${VERD} █▄▄▌ █▄█ ▐▌ █▌ █▄▄▌▐▙▄▄▖▝█▄█▘ ▄█▄ ▐▙▄█  █▄█
		${VERD}  ▀▀  ▝▀▘ ▝▘ ▀▘  ▀▀ ▝▀▀▀▘ ▝▀▘  ▀▀▀ ▝▀▀   ▝▀▘
		${VERD}
	EOF
}

ruby() {
	cat <<- EOF
		${ROSA}
		${ROSA}▗▄▄▖ ▗▖ ▗▖▗▄▄▖ ▄▖ ▗▄
		${ROSA}▐▛▀▜▌▐▌ ▐▌▐▛▀▜▌▐▙ ▟▌
		${ROSA}▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌ █▄█
		${ROSA}▐███ ▐▌ ▐▌▐███  ▝█▘
		${ROSA}▐▌▝█▖▐▌ ▐▌▐▌ ▐▌  █
		${ROSA}▐▌ ▐▌▝█▄█▘▐▙▄▟▌  █
		${ROSA}▝▘ ▝▀ ▝▀▘ ▝▀▀▀   ▀
		${ROSA}
}

instalar
config_cowsay
banner
