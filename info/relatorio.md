# Relatório do Projecto MVTI


##### autor:

Francisco Maria Calisto

João Miranda


##### data:

(Inicio da elaboração deste Relatório)

24/03/2015


##### intervenientes:

 - João Fonseca George
 - Pedro Paula


#### Orçamento:

20€/h


#### Estimativa de Horas:

(ALTERAR SEMPRE QUE NECESSÁRIO)

10h

Nota: esta estimativa a contabilização de horas efectivas para programação do site
e respectivas implementações, etc... Assim como o tempo de obtenção de conhecimento, etc...




### Introdução

Este relatório serve para objectivamente relatar o numero de horas estimadas para a elaboração
deste projecto, não só como também pormenores do mesmo, assim como justificar toda a estrutura
no desenvolvimento da aplicação.

Este projecto foi encomendado dia 23/03/2015 por João George, foi re-enviado para mim,
Francisco Maria Calisto, informação via E-Mail sobre o seguimento do problema.

Quem está neste momento a trabalhar no mesmo:

- Francisco Maria Calisto, como Front-end Developer;

- João Miranda, como Back-end Developer;

- João George, como Gestor;

- Pedro Paula, pelo Departamento Técnico da Companhia;

Este Projecto vai ter um valor final da com a soma total do número de horas dependidos tanto
no seu desenvolvimento como na obtenção de conhecimento para o desenvolver.

O valor é simbólicamente amigável dado a relação de amizade para com o cliente.

Notar que este relatório não serve para documentação oficial do site e para isso será feita à parte
a documentação própria para o mesmo se tal for necessário e adequado.


#### Ideias

### 25/03/2015

Colocar a resposta ao serviço da SIBS através de Base de Dados não relacional via E-Mail
no E-Mail gerado automáticamente pela plataforma do site da Minitel após o Cliente
efectuar a respectiva encomenda.


### 24/03/2015

@author: Francisco Maria Calisto

Foi enviado para o eu E-Mail:

```
francisco.mcalisto@gmail.com
```

Informação que considero confidencial e de que não partilhei com o meu Exemo. colega João Miranda directamente
e detalhadamente de forma a evitar a perda de informação fidedigna, sendo que o mesmo compreendeu a minha atitude.

Compreender melhor a solução, abordar as necessidades da equipa e do cliente, metas, prazos e objectivos sobre o
projecto em causa.

Constatar informação e todos os pontos pendentes.



## Reuniões

### 24/03/2015

@author: Francisco Maria Calisto

Falei via telemóvel com o Pedro Paula e com o Pai do João George, sendo que amobos me enviaram os E-Mails com
a informação necessária ao mapeaento e compreendão de uma solução viável.

Tive a primeira Reunião com o meu colega João Miranda sobre as abordagens do projecto, chamada que durou
21 minutos.

### 25/03/2015

@author: Francisco Maria Calisto


Estive na Minitel presencialmente junto ao Pateo da Bagatela onde me reuni às 14:25, que durou até às 15:57,
com o Pai do João George e os colabradores da empresa Rui Martinha (Departamento de TI)
e Pedro Paula (Departamento de Sistemas).

Inicialmente falamos de toda a envolvente do projecto e do problema/solução.

Ficou estipulado de que a primeira estimativa de horas estava completamente errada visto já ter excedido esse
tempo neste mesmo dia, avisando assim que uma nova estimativa bateria nas 8h/10h mas que iria ser melhor
analisada toda esta situação.

#### Parte 1

O problema base é a necessidade de desenvolver e integrar a plataforma TPA Virtual da Caixa Geral de Depósitos no
web-site da Minitel para que os clientes possam de uma forma alternativa pagar assim via ***Multibanco*** ou
via ***VISA*** e desta forma agilizar o processo de compra e encomenda.

É por isso vital Analisar no Código onde é feito e de como é feito o pagamento no site, apurando assim onde se
irá integrar o serviço.

No dia de ontem foi-me passado através de E-Mail os ficheiros enviados para a Minitel pela CGD onde temos as
seguintes linguagens de programação à escolha:

 - HTML + Javascript;
 - ASPX;
 - JSP;
 - PHP;

No nosso caso muito provavelmente iremos optar pela linguagem ASPX pois é a linguagem nativa do site.

#### Parte 2

Falamos da possibilidade em implementar um segundo projecto e integra-lo também no site da Minitel, um
Configurador de Memórias que consiste em o Cliente acede o site e na secção das Memórias vais descrevendo
as caracteristicas do seu PC ou Laptop, Modelo, Ano de Produção, etc... Após isto o sistema devolve um
conjunto de memórias compativeis com a máquina do Cliente.

#### Parte 3

Por ultimo foi aberta a proposta por parte da Minitel em desenvolver um novo site da sua recente aquisição
a empresa Exabyte, site esse que é especialista em memórias mas tem uma Interface web muito fraca.

A ideia aqui é criar um site User Friendly e com uma boa Interface onde o cliente pode aceder e pode
selecionar todas as caracteristicas que deseja numa memória, assim que uma dada fase de selecção das
caracteristicas chega a um certo ponto que abre um chat onde operadoras da marca irão ajudar o Cliente
a comprender e aconselhar a sua compra.

Numa versão inicial ```(v1.0)``` será feito e integrado primitivamente na plataforma da ***Prestashop*** e mais
tarde numa segunda versão ```(v2.0)``` será então aprimorado a parte da Interface se assim for necessário assim
como incorporar o sistema PHC no mesmo.


### 25/03/2015

@author: Francisco Maria Calisto

Reuni-me com o eu colega João Miranda via Skype para discutir assuntos do projecto e abordagens possiveis assim
como orçamentos e metodologias de trabalho.


### 26/03/2015

@author: Francisco Maria Calisto

Tive uma Reunião via Skype, que durou 36:19 minutos, das 19:52 às 20:28, onde começamos a analisar o PDF do Netcaixa, escrito pela CaixaTec, o "Guia de Implementação
Técnica ASPX.NET 4.0, do TPA Virtual Hosted, com o objectivo de melhor mapear as inforações necessária para efeitos de
metas, orçamentos e concretização da implementação.

Começamos por debater o problema da falta de tempo para conseguirmos chegar a uma Análise conclusiva e realista e, por
tanto, chegamos à conclusão que dado a problemas de agenda, teremos que alargar o extender o periodo de Análise para
para que a conclusão seja fidedigna.

Por essa razão achamos por bem agendar uma data para a semana seguinte a esta, no dia 31/03/2015, Terça Feira, enviando
a Análise antes de almoço, pelas 12:00.


### 31/03/2015

@author: João Miranda

Iniciei uma análise profunda código do site da Minitel. Deparei me com a dificuldade de não poder testar alterações nem
perceber a localidade, no código, das várias zonas do website. Isso deveu-se, respectivamente, aos seguintes factos. Em
primeiro lugar, não posso fazer deploy de uma versão fora do alojamento actual da Minitel e não tenho ainda acesso ao mesmo.
Em segundo lugar, não possuo as credenciais de um utilizador de teste, por forma a simular uma compra. Este processo durou 30
minutos sozinho, mais 1 hora e 30 minutos em reunião com o Francisco Calisto via Skype, fazendo assim um total de 2 horas.

@author: Francisco Maria Calisto

Estive com o meu colega João Miranda em Reunião via skype para delimitar e analisar de uma forma mais profunda desta vez todo o código envolvente do site da Minitel.

Estivemos para isso numa Reunião que durou aproximadamente 2h, delimitando uma série de metas para os nossos objectivos e entregas:

#### Parte 1

1) Relatar para com a Minitel a falta de Documentação no que toca ao site e às tecnologias do mesmo;

2) Estimamos que o trabalho ficaria num Total de 20h de trabalho;

3) O mesmo estaria acabado no final de Quarta Feira, dia 01/03/2015, ou inicio de Quita Feira, dia 02/03/2015, caso contrário será cancelado;

3.1) A inviabilidade de concluir numero de horas deve-se sobretudo aos pontos acia referidos, o limite estabelecido em 2) deve-se às nossas restrições de tempo;

#### Parte 2

Necessidades do projecto:

a) Será necessário pedir um ```Utilizador Registado``` para compreender em que ficheiros está a ser efectuada a compra;

b) Também será fundamental criar uma VPN para se testar directamente no lado servidor;




## Glossário de Termos

CGD - Caixa Geral de Depósitos

MVTI - Minitel Virtual TPA Implementation

TPA - Terminal de Pagamento Automático
