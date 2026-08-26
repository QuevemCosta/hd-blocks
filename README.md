# HDD Blocks Tester

Ferramenta simples desenvolvida em **Shell Script** para automatizar testes de integridade em dispositivos de armazenamento utilizando o utilitário **Badblocks** no Linux.

O projeto foi criado durante meus estudos de **Linux e Shell Script**, com o objetivo de facilitar a execução de testes em HDs e SSDs através de scripts simples, evitando a necessidade de memorizar os diversos parâmetros disponíveis no comando `badblocks`.

> **Status:** Projeto em desenvolvimento e aprendizado.

Este foi um dos meus primeiros projetos utilizando Shell Script além dos comandos básicos do terminal. Por isso, sugestões, correções, melhorias de código e boas práticas são muito bem-vindas.

---

## 📋 Índice

* [Sobre o projeto](#-sobre-o-projeto)
* [Funcionalidades](#-funcionalidades)
* [Modos de teste](#-modos-de-teste)

  * [Teste somente leitura](#1--teste-somente-leitura)
  * [Teste de leitura e escrita não destrutivo](#2--teste-de-leitura-e-escrita-não-destrutivo)
  * [Teste de leitura e escrita destrutivo](#3--teste-de-leitura-e-escrita-destrutivo)
* [Pré-requisitos](#-pré-requisitos)
* [Instalação](#-instalação)
* [Utilização](#-utilização)
* [Identificando o dispositivo](#-identificando-o-dispositivo)
* [Cuidados importantes](#-cuidados-importantes)
* [Estrutura do projeto](#-estrutura-do-projeto)
* [Limitações](#-limitações)
* [Roadmap](#-melhorias-planejadas)
* [Contribuindo](#-contribuindo)
* [Sobre o projeto](#-sobre-o-projeto)
* [Sobre o autor](#-sobre-o-autor)
* [Agradecimentos](#-agradecimentos)
* [Licença](#-licença)

---

# 💻 Sobre o projeto

O **HDD Blocks Tester** tem como objetivo simplificar a utilização do `badblocks` para diagnóstico de dispositivos de armazenamento em sistemas Linux.

Em vez de executar manualmente comandos como:

```bash
sudo badblocks -sv -c 1024 /dev/sdX
```

o usuário pode utilizar os scripts do projeto para executar diferentes tipos de testes de forma mais simples.

A ferramenta pode ser útil em situações como:

* Diagnóstico de HDs;
* Diagnóstico de SSDs;
* Manutenção preventiva;
* Identificação de setores defeituosos;
* Testes antes da reutilização de um dispositivo;
* Avaliação de dispositivos utilizados em computadores de clientes;
* Estudos de Linux e Shell Script.

---

# 🚀 Funcionalidades

Atualmente o projeto possui três modos principais de teste:

| Modo                             | Leitura | Escrita | Preserva dados |
| -------------------------------- | :-----: | :-----: | :------------: |
| Somente leitura                  |    ✅    |    ❌    |        ✅       |
| Leitura e escrita não destrutivo |    ✅    |    ✅    |       ✅*       |
| Leitura e escrita destrutivo     |    ✅    |    ✅    |        ❌       |

* O modo não destrutivo tenta preservar os dados existentes, mas deve ser utilizado com cautela e **backup previamente realizado**.

---

# 🧪 Modos de teste

## 1. 🔎 Teste somente leitura

Executa uma varredura no dispositivo procurando blocos defeituosos sem realizar operações de escrita.

```bash
sudo badblocks -sv -c 1024 /dev/sdX
```

### Parâmetros utilizados

| Parâmetro | Função                                         |
| --------- | ---------------------------------------------- |
| `-s`      | Exibe o progresso do teste                     |
| `-v`      | Exibe informações detalhadas                   |
| `-c 1024` | Define a quantidade de blocos testados por vez |

### Indicado para

* Diagnóstico inicial;
* Discos contendo dados importantes;
* Verificação de integridade sem escrita;
* Primeira análise de um dispositivo suspeito.

### Exemplo

```bash
sudo badblocks -sv -c 1024 /dev/sda
```

---

## 2. 🔄 Teste de leitura e escrita não destrutivo

Executa testes de leitura e escrita utilizando o modo não destrutivo do `badblocks`.

```bash
sudo badblocks -nsv -c 10240 /dev/sdX
```

O parâmetro `-n` solicita um teste de leitura e escrita **não destrutivo**, tentando preservar os dados existentes.

### Parâmetros utilizados

| Parâmetro  | Função                                            |
| ---------- | ------------------------------------------------- |
| `-n`       | Teste de leitura e escrita não destrutivo         |
| `-s`       | Exibe o progresso                                 |
| `-v`       | Exibe informações detalhadas                      |
| `-c 10240` | Define a quantidade de blocos processados por vez |

### Indicado para

* Diagnósticos mais completos;
* Identificação de setores instáveis;
* Testes de dispositivos que ainda possuem dados;
* Avaliação de possíveis problemas de armazenamento.

> ⚠️ **Importante:** mesmo sendo um teste não destrutivo, **sempre faça backup dos dados antes de executar o procedimento**.

---

## 3. ⚠️ Teste de leitura e escrita destrutivo

Executa um teste completo de leitura e escrita sobrescrevendo os dados existentes no dispositivo.

```bash
sudo badblocks -wsv -c 10240 /dev/sdX
```

O parâmetro `-w` ativa o modo de teste destrutivo.

### Parâmetros utilizados

| Parâmetro  | Função                                            |
| ---------- | ------------------------------------------------- |
| `-w`       | Teste de escrita destrutivo                       |
| `-s`       | Exibe o progresso                                 |
| `-v`       | Exibe informações detalhadas                      |
| `-c 10240` | Define a quantidade de blocos processados por vez |

### Indicado para

* Discos que serão descartados;
* Discos que serão reutilizados;
* Dispositivos sem dados importantes;
* Testes completos antes da reutilização do dispositivo.

## 🚨 ATENÇÃO

> **O modo destrutivo APAGA os dados do dispositivo.**

Nunca execute esse teste em:

* HD do sistema;
* SSD principal;
* Pendrive contendo arquivos importantes;
* Discos utilizados para armazenamento de dados;
* Qualquer dispositivo cujo conteúdo você deseja preservar.

Antes de executar, confirme várias vezes o dispositivo correto.

---

# 📦 Pré-requisitos

Para utilizar o projeto é necessário possuir:

* Sistema operacional Linux;
* Bash;
* `badblocks`;
* Permissões administrativas (`sudo`);
* Dispositivo de armazenamento a ser testado.

O `badblocks` normalmente faz parte do pacote **e2fsprogs** em diversas distribuições Linux.

## Verificando o Badblocks

Execute:

```bash
which badblocks
```

Ou:

```bash
badblocks -V
```

Também é possível verificar:

```bash
badblocks --help
```

---

# 📥 Instalação

Clone o repositório:

```bash
git clone https://github.com/QuevemCruzDev/hdd-blocks-tester.git
```

Entre no diretório:

```bash
cd hdd-blocks-tester
```

Conceda permissão de execução aos scripts:

```bash
chmod +x *.sh
```

Caso seja necessário, execute os scripts utilizando `sudo`.

---

# ▶️ Utilização

O projeto possui scripts separados para cada tipo de teste.

## Somente leitura

```bash
sudo ./somente-leitura.sh
```

## Leitura e escrita não destrutivo

```bash
sudo ./leitura-escrita.sh
```

## Leitura e escrita destrutivo

```bash
sudo ./reparo-formatacao.sh
```

Ao iniciar, o script deverá solicitar o dispositivo que será analisado.

Exemplos:

```text
/dev/sda
```

```text
/dev/sdb
```

Para dispositivos NVMe:

```text
/dev/nvme0n1
```

> **Nunca informe uma partição quando a intenção for testar o dispositivo inteiro.**

Por exemplo:

```text
/dev/sda
```

representa o dispositivo inteiro, enquanto:

```text
/dev/sda1
```

representa uma partição.

---

# 🔍 Identificando o dispositivo

Antes de executar qualquer teste, utilize:

```bash
lsblk
```

Para obter informações adicionais:

```bash
lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS,MODEL,SERIAL
```

Exemplo:

```text
NAME        SIZE TYPE FSTYPE MOUNTPOINTS MODEL
sda       931.5G disk              ST1000DM010
├─sda1      100G part ext4   /
└─sda2    831.5G part ext4   /home
sdb       465.8G disk              SSD
└─sdb1    465.8G part ext4   /mnt/dados
```

Nesse exemplo:

```text
/dev/sda
```

e:

```text
/dev/sdb
```

são os dispositivos físicos.

Enquanto:

```text
/dev/sda1
/dev/sda2
/dev/sdb1
```

são partições.

## ⚠️ Confira o tamanho e o modelo

Não escolha um dispositivo apenas pelo nome.

Compare:

* Capacidade;
* Modelo;
* Ponto de montagem;
* Sistema de arquivos;
* Número de série, quando disponível.

---

# 🛡️ Cuidados importantes

Antes de iniciar qualquer teste:

### 1. Faça backup

Tenha uma cópia dos arquivos importantes antes de executar qualquer teste.

### 2. Identifique corretamente o dispositivo

Utilize:

```bash
lsblk
```

e, se necessário:

```bash
sudo fdisk -l
```

### 3. Cuidado com o modo destrutivo

O comando:

```bash
badblocks -w
```

pode sobrescrever os dados do dispositivo.

### 4. Evite testar o disco do sistema

Não execute testes destrutivos no dispositivo que contém o sistema operacional em execução.

### 5. Verifique pontos de montagem

Antes de realizar determinados testes, verifique se o dispositivo ou suas partições estão montados:

```bash
lsblk
```

ou:

```bash
findmnt
```

### 6. Tenha paciência

Testes completos podem levar **muitas horas**, especialmente em discos de grande capacidade.

A duração depende de fatores como:

* Capacidade do dispositivo;
* Velocidade de leitura;
* Velocidade de escrita;
* Interface utilizada;
* Estado de saúde do dispositivo;
* Quantidade de erros encontrados.

---

# 📁 Estrutura do projeto

```text
hdd-blocks-tester/
│
├── main.sh
├── somente-leitura.sh
├── leitura-escrita.sh
├── reparo-formatacao.sh
├── README.md
└── LICENSE
```

### Descrição dos arquivos

| Arquivo                | Descrição                        |
| ---------------------- | -------------------------------- |
| `main.sh`              | Script principal / menu          |
| `somente-leitura.sh`   | Executa teste somente de leitura |
| `leitura-escrita.sh`   | Executa teste não destrutivo     |
| `reparo-formatacao.sh` | Executa teste destrutivo         |
| `README.md`            | Documentação do projeto          |
| `LICENSE`              | Licença do projeto               |

---

# ⚙️ Portabilidade

O projeto foi desenvolvido para ambientes Linux utilizando Bash e ferramentas disponíveis no sistema.

Dependendo da distribuição utilizada, podem ser necessários pequenos ajustes.

Distribuições que podem ser utilizadas incluem:

* Ubuntu;
* Debian;
* Linux Mint;
* Fedora;
* Arch Linux;
* Manjaro;
* Pop!_OS;
* Outras distribuições compatíveis com Bash e `badblocks`.

## Verificando o Shell

É possível verificar o Bash com:

```bash
bash --version
```

---

# ⚠️ Limitações

O projeto ainda possui algumas limitações.

Atualmente:

* A seleção dos dispositivos ainda pode ser manual;
* Não existe detecção completa de dispositivos;
* O projeto não possui integração com SMART;
* Não existe histórico estruturado dos testes;
* Os resultados ainda não são exportados automaticamente;
* O tratamento de erros pode ser melhorado;
* O tempo restante do teste não é calculado;
* Ainda não existe uma interface TUI completa;
* A ferramenta não substitui ferramentas profissionais de diagnóstico.

Além disso, o `badblocks` é apenas uma parte do diagnóstico de um dispositivo.

Para uma análise mais completa, é interessante utilizar também ferramentas como:

```bash
smartctl
```

do pacote **smartmontools**.

---

# 🗺️ Melhorias planejadas

O projeto será evoluído gradualmente.

## Interface

* [ ] Criar menu interativo no terminal;
* [ ] Utilizar `Whiptail` ou `Dialog`;
* [ ] Criar interface TUI;
* [ ] Melhorar mensagens e indicadores de progresso.

## Detecção de dispositivos

* [ ] Detectar automaticamente os discos disponíveis;
* [ ] Mostrar modelo e capacidade;
* [ ] Identificar HDD, SSD e NVMe;
* [ ] Exibir pontos de montagem;
* [ ] Impedir seleção acidental do disco do sistema.

## Segurança

* [ ] Criar confirmação dupla para testes destrutivos;
* [ ] Detectar dispositivos montados;
* [ ] Bloquear execução acidental no disco do sistema;
* [ ] Validar se o dispositivo informado realmente existe;
* [ ] Validar permissões antes da execução.

## Diagnóstico

* [ ] Integrar com `smartctl`;
* [ ] Exibir informações SMART;
* [ ] Identificar temperatura;
* [ ] Exibir horas de funcionamento;
* [ ] Exibir setores realocados;
* [ ] Identificar setores pendentes;
* [ ] Identificar possíveis falhas do dispositivo.

## Relatórios

* [ ] Criar sistema de logs;
* [ ] Salvar data e hora do teste;
* [ ] Registrar dispositivo analisado;
* [ ] Registrar resultado;
* [ ] Exportar relatório em `.txt`;
* [ ] Exportar relatório em `.csv`;
* [ ] Criar relatório em HTML.

## Usabilidade

* [ ] Exibir tempo estimado;
* [ ] Exibir percentual de conclusão;
* [ ] Melhorar tratamento de interrupção com `Ctrl+C`;
* [ ] Criar mensagens de erro mais amigáveis;
* [ ] Criar modo silencioso para automação;
* [ ] Permitir parâmetros via linha de comando.

---

# 🧪 Exemplo de uso futuro

Uma possível evolução do projeto será permitir comandos como:

```bash
./hdd-blocks-tester --list
```

Para listar os dispositivos.

```bash
./hdd-blocks-tester --read /dev/sdb
```

Para executar um teste somente de leitura.

```bash
./hdd-blocks-tester --non-destructive /dev/sdb
```

Para executar um teste não destrutivo.

E, para o modo destrutivo:

```bash
./hdd-blocks-tester --destructive /dev/sdb
```

Nesse último caso, o programa deverá solicitar confirmação explícita antes de iniciar o teste.

---

# 🤝 Contribuindo

Contribuições são muito bem-vindas!

Se você possui experiência com:

* Shell Script;
* Linux;
* Administração de sistemas;
* Armazenamento;
* Recuperação de dados;
* DevOps;
* Automação;
* Segurança de sistemas;

sinta-se à vontade para contribuir.

Você pode:

* Reportar bugs;
* Sugerir melhorias;
* Refatorar scripts;
* Corrigir problemas de documentação;
* Adicionar funcionalidades;
* Melhorar o tratamento de erros;
* Compartilhar boas práticas.

## Pull Requests

Para contribuir:

1. Faça um fork do projeto;
2. Crie uma branch para sua alteração;
3. Faça suas modificações;
4. Teste as alterações;
5. Faça commit;
6. Envie um Pull Request.

Exemplo:

```bash
git checkout -b feature/nova-funcionalidade
```

Depois:

```bash
git add .
git commit -m "feat: adiciona nova funcionalidade"
git push origin feature/nova-funcionalidade
```

---

# 📚 Sobre o projeto

O **HDD Blocks Tester** foi criado inicialmente como uma ferramenta de apoio para manutenção de computadores e diagnóstico de dispositivos de armazenamento durante atendimentos técnicos.

Além da utilidade prática, o projeto representa uma etapa do meu aprendizado em:

* Linux;
* Shell Script;
* Bash;
* Administração de sistemas;
* Armazenamento;
* Automação;
* Boas práticas de desenvolvimento.

Embora seja um projeto simples, ele representa um dos meus primeiros projetos utilizando Shell Script de forma mais estruturada, indo além dos comandos básicos do terminal.

A ideia é evoluir a ferramenta gradualmente enquanto continuo estudando, desenvolvendo novas funcionalidades e compartilhando conhecimento com a comunidade.

---

# 👨‍💻 Sobre o autor

## Quevem Costa da Cruz

**Técnico de TI | Desenvolvimento de Software | Suporte e Infraestrutura**

Atuo com:

* Manutenção preventiva e corretiva de computadores;
* Manutenção de impressoras;
* Configuração de redes;
* Suporte técnico;
* Diagnóstico de hardware;
* Sistemas Linux e Windows;
* Desenvolvimento de software;
* Automação de processos.

Sou formado em **Análise e Desenvolvimento de Sistemas** e atuo na área de suporte e manutenção de informática desde 2018.

---

# 🙏 Agradecimentos

Se você dedicou algum tempo para testar, analisar ou sugerir melhorias para este projeto, muito obrigado!

Todo feedback é uma oportunidade de aprender algo novo e tornar a ferramenta melhor.

---

# 📄 Licença

Este projeto está disponível sob os termos da licença definida no arquivo:

```text
LICENSE
```

Caso o projeto ainda não possua uma licença, recomenda-se adicionar uma antes de disponibilizá-lo publicamente.

---

## ⭐ Gostou do projeto?

Se este projeto foi útil para você, considere:

* ⭐ Dar uma estrela no repositório;
* 🐛 Reportar problemas;
* 💡 Sugerir melhorias;
* 🤝 Contribuir com Pull Requests;
* 📢 Compartilhar o projeto.

**Obrigado por visitar o HDD Blocks Tester!**
