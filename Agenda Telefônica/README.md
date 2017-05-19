# Agenda Telefônica
## Gerencie seus contatos com este simples script em Dialog!

### Descrição:

###### Este é um simples script que possui a função de gerenciar seus contatos de telefone através de uma interface simples utilizando o Dialog.
###### Com este script, é possível adicionar, remover e listar os seus contatos. Basta executar o script no seu emulador de terminal preferido e um belo menu com as opções serão mostradas a você.

![Agenda Telefônica](http://i.imgur.com/3vPaCYJ.png)

###### O script, então, irá criar o arquivo 'contatos.txt' no diretório atual do script. É neste arquivo que todos os seus contatos estarão armazenados.
###### Para adicionar um contato, basta selecionar a opção Adicionar, inserir um nome para o contato e o seu número de telefone, celular, e-mail, etc (apesar do nome, o script não limita o tipo de contato que você deseja adicionar).
###### Para remover um contato, basta selecionar a opção Remover e inserir o nome do contato que você deseja apagar.
###### Para listar os seus contatos, basta selecionar a opção Listar e o script irá mostrar todos os seus contatos.

### Requisitos:
- Bash
- Dialog

### Download:

###### Para baixar o script, basta executar os comandos abaixo (requer o git instalado):

    git clone https://github.com/Wolfterro/Projetos-em-Shell.git
    cd "Projetos-em-Shell/Agenda Telefônica"
    ./agenda.sh

###### Você também poderá baixar o script utilizando o wget:

    wget "https://raw.github.com/Wolfterro/Projetos-em-Shell/master/Agenda%20Telefônica/agenda.sh"
    chmod +x agenda.sh
    ./agenda.sh
