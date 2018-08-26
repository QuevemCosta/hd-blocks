#!/usr/bin/env bash
#apenas Leitura
echo '============================'
echo '--> Escreva qual disco deseja verificar:'
read DISCO
echo '--> Iniciando varredura'
echo '-->Para cancelar o processo pressione Ctrl + C

'
sudo badblocks -sv -c 1024 $DISCO
