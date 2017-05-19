#!/bin/bash

# Versão do script
# ================
VERSION="1.0"

# Flag de loop (s = Sim; n = Não)
# ===============================
LOOP="s"

# O programa estará em loop até o usuário clicar em sair ou cancelar
# ==================================================================
while [[ "$LOOP" == "s" ]]
do
	# Menu principal do script
	# ========================
	OPTION=$(dialog \
		--stdout \
		--title "Agenda Telefônica - v$VERSION" \
		--menu 'Escolha uma das opções abaixo:' \
		0 0 0 \
		Listar 'Lista todos os contatos' \
		Adicionar 'Adiciona um novo contato' \
		Remover 'Remove um contato existente' \
		Sair 'Fechar o programa')

	# Se o usuário clicar em cancelar, encerra o loop
	# ===============================================
	if [[ -z "$OPTION" ]]; then
		dialog --title "Agenda Telefônica - v$VERSION" --msgbox 'Obrigado por usar a Agenda Telefônica!' 6 45
		LOOP="n"
	# Caso contrário, continua a execução do programa
	# ================================================
	else
		case "$OPTION" in
		# Opção de Sair
		# Encerrando o loop e saindo do programa
		# ======================================
			"Sair")
				dialog --title "Agenda Telefônica - v$VERSION" --msgbox 'Obrigado por usar a Agenda Telefônica!' 6 45
				LOOP="n"
				;;
		# Opção de Listar
		# Acusará erro caso a lista de contatos não exista
		# ================================================
			"Listar")
			if [[ -e "contatos.txt" ]]; then
				dialog --title 'Contatos' --textbox contatos.txt 0 0
			else
				dialog --title 'Erro!' --msgbox 'Lista de contatos não existe!' 6 45
			fi
			;;
		# Opção de Adicionar
		# Acusará erro quando contato já existir ou usuário não inserir valor
		# ===================================================================
			"Adicionar")
				NAME=$(	dialog \
					--stdout \
					--title 'Nome do contato' \
					--inputbox 'Adicione o nome do contato' \
					0 0)

				if [[ -z "$NAME" ]]; then
					dialog --title 'Erro!' --msgbox 'Nenhum nome inserido!' 6 45
				else
					CONTACTNAME=$(cat contatos.txt |
						grep "$NAME" |
						cut -d ":" -f1)

					if [[ -z "$CONTACTNAME" ]]; then
							PHONE=$(dialog \
								--stdout \
								--title 'Telefone' \
								--inputbox 'Adicione o número de telefone' \
								0 0)

							if [[ -z "$PHONE" ]]; then
								dialog --title 'Erro!' --msgbox 'Nenhum número de telefone inserido!' 6 45
							else
								echo "$NAME: $PHONE" >> contatos.txt
								dialog --title 'Adicionado!' --msgbox 'Contato adicionado com sucesso!' 6 45
							fi
					else
						dialog --title 'Erro!' --msgbox 'Contato já existe!' 6 45
					fi
				fi
				;;
		# Opção de Remover
		# Acusará erro caso contato não exista ou usuário não inserir valor
		# =================================================================
			"Remover")
				NAME=$( dialog \
					--stdout \
					--title 'Remover contato' \
					--inputbox 'Insira o nome de contato a ser removido' \
					0 0)

				if [[ -z "$NAME" ]]; then
					dialog --title 'Erro!' --msgbox 'Nenhum nome inserido!' 6 45
				else
					CONTACTNAME=$(cat contatos.txt |
						grep "$NAME" |
						cut -d ":" -f1)

					if [[ -z "$CONTACTNAME" ]]; then
						dialog --title 'Erro!' --msgbox 'Contato não existe!' 6 45
					else
						sed -i /"$CONTACTNAME"/d contatos.txt
						dialog --title 'Removido!' --msgbox 'Contato removido com sucesso!' 6 45
					fi
				fi
				;;
		esac
	fi
done
clear
