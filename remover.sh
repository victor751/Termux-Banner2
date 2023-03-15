#!/bin/bash

clear;

BRAN="$(printf '\033[1;37m')"
VERM="$(printf '\033[1;31m')"
VERD="$(printf '\033[1;32m')"
AZUL="$(printf '\033[1;34m')"
AMAR="$(printf '\033[1;33m')"


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

remover_banner() {
	echo ""
	echo "${AZUL} REMOVENDO 'TERMUX-BANNER2' ..."
	{ sleep 2; }
	cd $HOME
	if [[ -e Termux-Banner2 ]]; then
		rm -rfv Termux-Banner2
	fi
	{ sleep 2; }
	echo ""
	echo "${VERD} O TERMUX-BANNER2 FOI REMOVIDO!"
	{ sleep 1; }
	echo ""
	echo "${AZUL} REMOVENDO 'BASH.BASHRC' ..."
	if [[ -e /data/data/com.termux/files/usr/etc/bash.bashrc ]]; then
		rm -rfv /data/data/com.termux/files/usr/etc/bash.bashrc
		{ sleep 2; }
		echo ""
		echo ""
		echo "${VERD} O BASH.BASHRC FOI REMOVIDO!"
		{ sleep 2; }
	fi
	if [[ -e /data/data/com.termux/files/home/Termux-Banner2/.bash.bashrc ]]; then
		cp /data/data/com.termux/files/home/Termux-Banner2/.bash.bashrc/bash.bashrc /data/data/com.termux/files/usr/etc/
		echo "${AZUL} SAIA E ENTRE NO TERMUX OU ABRA UMA NOVA SESSÃO!"
	fi
}


voltar() {
	echo "${VERD} OK! VOLTANDO PARA O INICIO."
	{ sleep 2; clear; echo; ls; echo; }
}


banner() {

	figlet -f pagga REMOVER-BANNER | lolcat

	cat <<- EOF
		${VERD}				${VERD}[ ${AZUL}- ${VERD}] ${AMAR}VERSÃO: ${BRAN}01
		${VERD}				${VERD}[ ${AZUL}- ${VERD}] ${AMAR}AUTOR: ${BRAN}VICTOR SILVA
		${VERD}
		${VERD}
		${VERD}[ ${BRAN}:: ${VERD}] ESCOLHA UMA OPÇÃO ABAIXO PARA PROSSEGUIR: [ ${BRAN}:: ${VERD}]
		${VERD}
		${VERD}[ ${BRAN}1 ${VERD}] REMOVER O BANNER
		${VERD}[ ${BRAN}2 ${VERD}] VOLTAR PARA O MENU
		${VERD}
	EOF
	echo ""
	read -p "${VERD}[ ${AZUL}+ ${VERD}] SELECIONE A OPÇÃO: ${BRAN}" RESP

	case ${RESP} in
		1 | 01)
			remover_banner;;
		2 | 02)
			voltar;;
		*)
			echo "${VERD}[ ${AZUL}- ${VERD}] OPÇÃO INVÁLIDA, TENTE NOVAMENTE.."

			{ sleep 2; clear; banner; };;
	esac
}

banner
