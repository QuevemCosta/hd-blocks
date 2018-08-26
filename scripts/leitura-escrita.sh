#!/usr/bin/env bash

#leitura e Escrita
echo '============================'
echo '--> Escreva qual disco deseja verificar:'
read DISCO
echo '--> Iniciando varredura'
echo '-->Para cancelar o processo pressione Ctrl + C

'
sudo badblocks -nsv -c 10240 $DISCO


#leitura-escrita.sh
