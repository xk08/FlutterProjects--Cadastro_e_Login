# FlutterProjects: Cadastro e Login de Usuário utilizando armazanamento local com SharedPreferences

Este é um projeto de estudo, destinado a revisão de conceitos básicos e inicias do desenvolvimento com o Flutter.

## Objetivos do projeto
- Possibilitar que um usuário realize vários cadastros no app;
- Os dados de acesso, devem ser salvos de forma local no armazenamento do celular;
- Não será utilizado nenhum gerenciador de estado e/ou reatividade externo ao flutter;
- O projeto deve adotar alguma arquitetura e/ou padrão de projeto;
- O projeto deve utilizar validações em tempo real;
- Será utilizado o SharedPreferences para compor o armazenamento local das informações.


### Validações
- Para fazer login, o e-mail e senha devem existir no armazenamento local;
- A senha deve possuir pelo menos 6 caracteres;
- O e-mail deve ser de um tipo válido (verificado com RegExp);
- O nome e sobrenome do usuário devem possuir ao menos 3 caracteres;
- Os botões de acesso (acessar e criar cadastro) só devem estar disponíveis após todas as validações obterem sucesso;
- Não deve ser possível cadastrar um usuário já existente (esta validação acontece pelo e-mail).

### Tópicos revisados neste projeto
- Arquitetura empregada: MVW (Model, View, Whatever) 
  - Composta aqui por:
    - **Model:** Representação dos dados de Login e de Cadastro + Métodos de conversão de objetos dart para JSON (e vice-versa);
    - **Page:** Desenho das telas e interações previstas + Validações em tempo real + Widgets reativos;
    - **Controller:** Manipulação das regras de negocio, lógicas e validações, entre as Pages e os Repositories + Controlle da reatividade do app;
    - **Repository:** Interação com os dados do armazenamento local.
  
- Reatividade: Foi utilizado no Controller o ValueNotifier e na Page o ValueListenableBuilder (Recursos nativos);
- Armazenamento Local: Utilizado o plugin SharedPreferences;
- Rotas e Navegação: Foi utilizado o Navigator com o MaterialPageRoute (Recursos nativos)

### Veja como ficou o app

#### GIF
![gif](https://user-images.githubusercontent.com/60719351/202909320-4299116e-54bb-48a7-b77f-c30966049fb2.gif)

#### Vídeo (melhor qualidade)
https://user-images.githubusercontent.com/60719351/202907326-88f91c06-6511-4a58-84fa-ba21febed7bf.mp4

### Tem dúvidas e/ou sugestões sobre este projeto?
Entre em contato comigo!
  - E-mail: mmartins@digitalhouse.com
  - Linkedin: https://www.linkedin.com/in/xk08/



