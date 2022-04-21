# Gestao-Fisico-Nutricional
Projeto de Engenharia de Software II

## Primeiros Passos
### Na pasta raiz usando o command prompt do windows faça:
## Por que criar um ambiente virtual?
O ambiente virtual vai fazer uma cópia da instalação do python que você tem na sua máquina, criando assim um ambiente isolado, onde todas dependências instaladas nele não interfere a versão original da máquina, fazendo assim não ter conflitos entre versões de dependências e também deixar o interpretador o mais leve possível, tendo somente os módulos e pacotes necessários para o projeto. É imensamente recomendado criar um ambiente virtual para cada projeto python.

```python -m venv .venv``` Para criar um ambiente virtual.

```cd ./.venv``` Para entrar dentro da pasta do ambiente virtual recentemente criado.

```cd ./Scripts``` Para entrar na pasta de scripts que podem ser executados pelo ambiente virtual.

```activate.bat``` Para ativar o ambiente virtual, a partir daqui qualquer comando realizado, esta sendo executado com o "python" deste ambiente.

Agora vamos voltar para a raiz do projeto:
```cd ..```
```cd ..```
```pip install -r requiriments``` Para instalar todas depedências necessárias dentro da instalação do ambiente virtual.
    Então o arquivo requiriments.txt sempre deve estar atualizado com todos módulos e sua versão utilizada dentro do projeto para facilitar o deploy no futuro.

No nosso caso como é um projeto flask somente será necessário executar o seguinte comando, estando na raiz, para que o projeto rode:
```python main.py```
ou 
```py main.py``` ** dependendo de como a instalação foi feita


