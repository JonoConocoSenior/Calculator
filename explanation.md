# Vamos imaginar que estamos construindo um brinquedo de calculadora. Aqui está o que cada parte do código faz:

1. **Importar tkinter**: É como pegar uma caixa de ferramentas que nos ajuda a construir janelas e botões no computador.

2. **Função para calcular**:
   - Quando você aperta o botão de igual (=), a calculadora tenta resolver a conta que você digitou.
   - Se a conta estiver certa, ela mostra o resultado.
   - Se a conta estiver errada, ela mostra uma mensagem dizendo que algo deu errado.

3. **Criação da aplicação**:
   - Estamos criando a janela da calculadora, dando um nome para ela ("Calculadora") e definindo o tamanho dela (400x400).

4. **Caixa de entrada**:
   - É onde você digita os números e as operações (como +, -, *, /).

5. **Rótulo para exibir o resultado**:
   - É onde a calculadora mostra o resultado da conta.

6. **Função para adicionar números ou operadores**:
   - Quando você aperta um botão de número ou operação, ele aparece na caixa de entrada.

7. **Função para limpar a entrada**:
   - Quando você aperta o botão "C", ele apaga tudo que está na caixa de entrada.

8. **Botões da calculadora**:
   - Estamos criando todos os botões (0-9, +, -, *, /, =, C) e colocando-os na janela da calculadora.

9. **Inicia a aplicação**:
   - Faz a calculadora aparecer na tela e funcionar.

```python
import tkinter as tk
from tkinter import messagebox

# Função para calcular a expressão
def calcular():
    try:
        # Avalia a expressão digitada pelo usuário
        resultado = eval(entrada.get())
        # Exibe o resultado na tela
        label_resultado.config(text=f"Resultado: {resultado}")
    except Exception as e:
        # Se ocorrer um erro (como sintaxe inválida), exibe uma mensagem de erro
        messagebox.showerror("Erro", f"Erro na expressão: {str(e)}")

# Criação da aplicação
app = tk.Tk()
app.title("Calculadora")
app.geometry("400x400")

# Caixa de entrada para o usuário digitar a expressão
entrada = tk.Entry(app, width=25, font=("Arial", 14))
entrada.grid(row=0, column=0, padx=10, pady=10, columnspan=4)

# Rótulo para exibir o resultado
label_resultado = tk.Label(app, text="Resultado:", font=("Arial", 14))
label_resultado.grid(row=1, column=0, padx=10, pady=10, columnspan=4)

# Função para adicionar números ou operadores à expressão
def adicionar_caracter(caracter):
    entrada.insert(tk.END, caracter)

# Função para limpar a entrada
def limpar():
    entrada.delete(0, tk.END)

# Botões da calculadora
botões = [
    ('7', 2, 0), ('8', 2, 1), ('9', 2, 2), ('/', 2, 3),
    ('4', 3, 0), ('5', 3, 1), ('6', 3, 2), ('*', 3, 3),
    ('1', 4, 0), ('2', 4, 1), ('3', 4, 2), ('-', 4, 3),
    ('0', 5, 0), ('.', 5, 1), ('+', 5, 2), ('=', 5, 3),
    ('C', 6, 0, 2)
]

# Adiciona os botões na interface
for (texto, linha, coluna, *extra) in botões:
    if texto == 'C':
        tk.Button(app, text=texto, width=5, height=2, font=("Arial", 14), command=limpar).grid(row=linha, column=coluna, columnspan=2)
    elif texto == '=':
        tk.Button(app, text=texto, width=5, height=2, font=("Arial", 14), command=calcular).grid(row=linha, column=coluna)
    else:
        tk.Button(app, text=texto, width=5, height=2, font=("Arial", 14), command=lambda t=texto: adicionar_caracter(t)).grid(row=linha, column=coluna)

# Inicia a aplicação
app.mainloop()