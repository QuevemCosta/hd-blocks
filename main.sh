#!/usr/bin/env bash
#----------Dados do altor--------------
#Altor: Quevem Costa da Cruz
#data: 26 de Agosto de 2018
#Projéto: Stark soluções em tecnologia

#----------------------Instruções------------------
#/home/nome-de-usuario/hd-blocks/scripts/badbloks.sh //caminho para o arquivo 1
#/home/nome-de-usuario/hd-blocks/scripts/leitura-escrita.sh //caminho para o arquivo 2
#/home/nome-de-usuario/hd-blocks/scripts/reparo-formatacao.sh //caminho para o arquivo 3
#Salve a pasta na sua home e lembre de alterar o nome de usuario para o em uso em sua máquina

echo '


=======DISPOSITIVOS CONCTADOS AO COMPUTADOR======== '
#O comando a seguir lista os discos plugados no computador
sudo fdisk -l

echo '
=======ACIMA JA A LISTA DE DISPOSITIVOS CONECTADOS=======

======== Bad Bloks Testes ========='

echo '--> Informe o tipo de tesste:'
echo '>> 1- Somente Leitura;'
echo '>> 2- Leitura e Escrita: '
echo '>> 3- Reparo e formatação(APAGA E REPARA TODA A PARTIÇÃO)'
echo '>> 4- Ajuda'
echo '>> 5- para sair'
echo '============================='
read ESCOLHA #variavel recebe o valor escolido pelo user

#O bloco a seguir testa a variavel ESCOLHA e apartir da entrada do user
#direciona o fluxo do programa para o arquivo com script correspondente.
if [ "$ESCOLHA" = "1" ]; then
  echo 'Teste Leitura de BadBloks'
  echo ' executa o teste por BadBlocks apenas por'
  echo 'leitura de informações, é o método mais seguro'
  /home/quevem/Git/hd-blocks/scripts/badbloks.sh
  #statements
elif [ "$ESCOLHA" = "2" ]; then
  echo '===================================='
  echo 'Teste Leitura e Escrita de BadBloks'
  echo 'O modo de leitura e escrita é mais demorado'
  echo 'Executa escrevendo e lendo as informaçõs do disco'
  echo 'Desse modo acaba por ser mais demorado'
  /home/quevem/Git/hd-blocks/scripts/leitura-escrita.sh
  #statements
elif [ "$ESCOLHA" = "3" ]; then
  echo '======================================'
  echo 'Teste Avançado/ Reparo e formatação'
  echo '===================='
  echo 'Apaga toda a unidade seleciona, ou seja,
   ele faz uma formatação na partição do seu HD,
   só deve ser usado para testar HDs onde não
   existem arquivos que não podem ser perdidos,
   normalmente utilizamos este em casos extremos.'

  /home/quevem/Git/hd-blocks/scripts/reparo-formatacao.sh
  #statements
  #statements
elif [ "$ESCOLHA" = "4" ]; then
  echo '=============AJUDA============'
  echo 'Teste Leitura de BadBloks'
  echo '=================================='
  echo ' executa o teste por BadBlocks apenas por'
  echo 'leitura de informações, é o método mais seguro'
  #statements
  echo '===================================='
  echo 'Teste Leitura e Escrita de BadBloks'
  echo 'O modo de leitura e escrita é mais demorado'
  echo 'Executa escrevendo e lendo as informaçõs do disco'
  echo 'Desse modo acaba por ser mais demorado'

  echo '======================================'
  echo 'Teste Avançado/ Reparo e formatação'
  echo '===================='
  echo 'apaga toda a unidade seleciona, ou seja,
  ele faz uma formatação na partição do seu HD,
  só deve ser usado para testar HDs onde não
    existem arquivos que não podem ser perdidos,
    normalmente utilizamos este em casos extremos.'
    #statements

    echo ''
    echo 'prima Ctrl + D para sair'
  elif [ "$ESCOLHA" = "5" ]; then

    exit

  else
    echo 'Opção invalida rode o script novamente'
fi
exit
