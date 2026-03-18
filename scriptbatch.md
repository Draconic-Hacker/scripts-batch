# Registro 1 - 12/03/2026-15:27
## Scripts.bat
os scripts .bat utiliza o cmd padrão do windows, ou seja, o prompt de comando.

vou anotar algumas observações que vou fazer enquanto vou testando alguns comandos para criar um novo script. (eu poderia pegar da internet mas no momento estou sem)

- comentários
aparentemente os comentários na linguagem do script.bat é definido pela duplicidade do sinal "dois pontos".

***Exemplo:***
```
:: isso é um comentário em script.bat
```

- escrita
como eu introduzi na programação pela linguagem python, então tomarei como referencia.

na linguagem python, quanto queremos escrever algo no terminal utilizamos o comando 

```
print("hello world")
```

já aqui nos ´´.bat´´ para usarmos o "print()" nós usamos o comando ***echo*** para essa utilidade.

***Exemplo:***
```
echo Hello World
```

Nota-se que não há necessidade da utilização das aspas duplas para escrever-mos algo, pois o comando _echo_ já escreve diretamente no terminal. 

- Limpando o terminal
quando nós digitamos muitos comandos no nosso prompt de comando, fica como se fosse um histórico de comandos executados, poluindo um pouco com comandos passados.

para que possamos "limpar" o terminal, nós utilizamos o comando cls