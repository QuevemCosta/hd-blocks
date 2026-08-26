# HDD Blocks Tester

Ferramenta simples desenvolvida em **Shell Script** para automatizar testes de integridade em discos rígidos (HDs e SSDs) utilizando o utilitário **Badblocks** no Linux.

O projeto nasceu durante meus estudos de Linux e Shell Script com o objetivo de facilitar a execução de testes em dispositivos de armazenamento através de um menu simples, evitando a necessidade de decorar parâmetros e opções do comando `badblocks`.

> Este é um projeto de aprendizado. Shell Script ainda não é minha principal linguagem e este foi um dos meus primeiros projetos além dos comandos básicos do terminal. Portanto, sugestões, melhorias e correções são muito bem-vindas.

---

# Funcionalidades

Atualmente o projeto possui três modos de operação:

## 1. Teste Somente Leitura

Realiza uma varredura no disco procurando setores defeituosos sem realizar alterações nos dados.

```bash
badblocks -sv -c 1024 /dev/sdX
```

### Ideal para:

- Diagnóstico inicial
- Discos contendo dados importantes
- Verificações rápidas de integridade

---

## 2. Teste de Leitura e Escrita Não Destrutivo

Executa testes de leitura e escrita preservando os dados existentes sempre que possível.

```bash
badblocks -nsv -c 10240 /dev/sdX
```

### Ideal para:

- Diagnósticos mais completos
- Identificação de setores instáveis
- Avaliação de discos em uso

---

## 3. Teste de Leitura e Escrita Destrutivo

Executa a verificação completa sobrescrevendo todo o conteúdo do dispositivo.

```bash
badblocks -wsv -c 10240 /dev/sdX
```

> ⚠️ **ATENÇÃO:** Este modo apaga completamente todos os dados do disco.

Utilize apenas quando tiver certeza de que o conteúdo do dispositivo pode ser descartado.

---

# Pré-requisitos

Antes de utilizar os scripts, certifique-se de possuir:

- Sistema Linux
- Utilitário Badblocks instalado
- Permissões administrativas (sudo)

Verifique se o Badblocks está instalado:

```bash
which badblocks
```

ou

```bash
badblocks -V
```

---

# Instalação

Clone o repositório:

```bash
git clone https://github.com/seu-usuario/hdd-blocks-tester.git
```

Entre na pasta do projeto:

```bash
cd hdd-blocks-tester
```

Conceda permissão de execução aos scripts:

```bash
chmod +x *.sh
```

---

# Utilização

Execut* o script desejado.

### Som*nte leitura

```bash
./somente-lei*ura.sh
```

*## Leitura e escrita não destrutiv*

```bash
./le*tura-escrita.sh
```

### Leitura e*escrita destrut*vo

```bash
./reparo-formatacao.sh*```

Ao iniciar* o script solicitará o dispositivo*que será analisado.

Exemplos:

``*bash
/dev/sda
```

```bash
/dev/sd*
```

```*ash
/dev/nvme0n1
```

---

# Cu*dados*Importantes

Antes de iniciar qual*uer teste:

1. Confirme o disco co*reto utilizando:

```bash
lsblk*```

2. Nunca execute testes destr*tivos em discos contendo dados imp*rtantes.

3. Faça backup dos*arquivos antes de qualquer procedi*ento.

4. Leia atentamente as mens*gens apresentadas pelos scripts.

*. Certifique-se de que nenhum proc*sso crítico esteja utilizando o di*positivo durante o teste.

---

# *strutura*do Projeto

```text
hdd-blocks-tes*er/
│
├── main.sh
├── somente-leit*ra.sh
├── leitura-escrita.sh
├── r*paro-formatacao.sh
└── README.md
`*`

---

# Portabilidade

*ara executar este projeto em outra* máquinas pode ser necessário ajus*ar*alguns caminhos ou configurações e*pecíficas da distribuição Linux ut*lizada.

As instruções para essas *lterações encontram-se comentadas *o arquivo:

```bash
main.sh
```

-*-

# Melhorias Planejadas

Pret*ndo implementar futuramente:

- Me*u interativo em terminal
- Detecçã* automática dos discos disponíveis*- Registro de logs dos testes real*zados
- Exportação dos resultados *ara arquivo
- Integração*com SMART através*do Smartmontools
- Identificação a*tomática de HDD ou SSD
- Tratament* avançado de erros
- Tempo*estimado de execução
- Interface T*I com Whiptail ou Dialog

---

# C*ntribuindo

Toda contribuição*é bem-vinda.

Caso você tenha expe*iência com:

* Shell Script
- Linux
- Administra*ão de sistemas
* Armazenamento e recuperação*de dados

Sinta-se à*vontade*para:

- Reportar bugs
- Melhor*r o código
- Refatorar scripts
-*Corr*gir problemas de documentação
- Ad*cionar funcionalidades
- Compartil*ar boas práticas

Pull Requests e *ssues são extremamente bem-vindos.*
---

# Sobre o Projeto

Este*projeto*foi criado inicialmente como uma f*rramenta de*apoio para manutenção de computado*es e diagnóstico de discos durante*atendimentos técnicos.

Além da ut*lidade prática, ele representa tam*ém minha evolução no aprendizado d* Linux e automação em Shell Script*

Embora simples, foi um dos*primeiros projetos que desenvolvi *tilizando algo além dos comandos b*sicos do terminal. Por esse motivo* sei que*ainda há muito espaço para melhori*s, otimizações e boas práticas que*ainda estou aprendendo.

A ideia p*incipal é evoluir o projeto gradua*mente enquanto compartilho conheci*ento e recebo feedback da comunida*e.

---

# Sobre o Autor

**Quevem*Costa da Cruz**

**cnico de TI, especializado em manu*enção de computadores, impressoras* redes e suporte técnico.

Atuo di*riamente*com diagnósticos, manutenção preve*tiva*e corretiva, automação de*processos e soluções de infraestru*ura para clientes residenciais e e*presariais.

---

##*Agradecimentos

Se você dedicou um*tempo para testar, analisar ou sug*rir melhorias para este projeto, m*u muito obrigado.

Todo feedback é*uma oportunidade de aprender algo *ovo*e tornar a ferramenta melhor para *odos.

**Apr*nder* compartilhar conhecimento e evolu*r constantemente.**
````*
