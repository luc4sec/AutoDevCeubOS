#!/bin/bash
if [ "$1" == "" ] || [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
	echo "
  Pré-requisitos

1 - Debian Atualizado
2 - Versão atualizada do Live-build
3 - Bash
4 - Internet
5 - 100GB de disco disponível no seu sistema Linux instalado e máquina física ou máquina Virtual. 8GB de RAM."
	echo ""
	echo ""
	echo "+===========================================+"
	echo "|   Automatizador de instalação CeubOS Dev  |"
	echo "+===========================================+"
	echo "|   Modo de uso:~$ sudo chmod +x setup.sh   |"
	echo "|               ~$ sudo ./setup.sh install  |"
	echo "+===========================================+"
	echo ""
	
elif [ "$1" == "install" ]; then
	echo "Atualizando Pacotes"
	apt-get update
	echo "Atualizando Listas"
	apt-getlist --upgradable
	echo "Atualizando Sistema"
	apt-get upgrade -y
	echo "Instalando live-build"
	apt-get install live-build live-manual live-config schroot -y
	echo "Criando diretório de trabalho"
	mkdir /home/live/
	mkdir /home/live/live
	lb config
	echo ""
	echo ""
	echo "---O COMANDO A SEGUIR SÓ FUNCIONA VIA SSH LOGADO COMO ROOT---"
	echo "Tecle CTRL-Z para sair"
	sleep 5
	lb build
	echo "Sua imagem foi criada!"
	echo ""
	echo "Listando arquivos"; ls
	echo "
Deseja copiar a imagem pelo SCP?
1- SIM
2- NÃO
^\/^";	read resp
	case $resp in
	"1")
		while true;
		do
		echo ""
		echo "Abrindo SCP..."
		echo "Usuário \/"
		read user
		echo "IP \/"
		read ip
		echo "Senha \/"
		read -s pass
		echo "Logando... Aguarde"
		chmod +x otr/scp.sh
		./otr/scp.sh $user $ip $pass
		echo ""
		echo ""
		echo "Erro ao tentar logar!"
		done
	;;
	"2")
		echo ""
		echo "Continuando internamente..."
		chmod +x otr/fin.sh
		./otr/fin.sh
		exit
	esac
	
else
	echo "Use $0 -h       --help para ajuda"
fi

