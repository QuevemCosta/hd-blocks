#!/usr/bin/env bash
#formatação e Reparo
echo '============================'
echo '--> Escreva qual disco deseja verificar:'
read DISCO
echo '--> Iniciando varredura'
echo '-->Para cancelar o processo pressione Ctrl + C

'
sudo badblocks -wsv -c 10240 $DISCO
