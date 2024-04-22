
# Mayo

Uma rede social simples, criada em Ruby on Rails para o teste técnico de estágio da Mainô.


## O Desafio

O teste é diviido em três "níveis", dos quais eu optei por seguir como se fossem níveis de dificuldade.

### Requisitos Básicos: 
**Nível 1:**
- [x]  Ver os posts publicados por todos os usuários ordenados do mais novo para o mais antigo; 
- [x]  Os posts publicados devem ter paginação ao atingirem 3 publicações, onde o 4º post irá para a página 2 e daí em diante, ou seja, cada página deverá ter até 3 posts; 
- [x]  Fazer comentários anônimos
- [x]  Cadastrar um novo usuário
- [x]  Fazer login com um usuário cadastrado
- [x]  Recuperar a senha do usuário
- [x]  Editar e apagar posts já publicados pelo próprio usuário loggado
- [x]  Área logada onde é possível: redigir e publicar um post
- [x]  Fazer comentários identificados através do login
- [x]  Editar o seu cadastro de usuário
- [x]  Alterar a senha do usuário logado

**Nível 2:**
- [ ]  Se conseguir, escrever testes automatizados simples
- [ ]  Se conseguir, implemente internacionalização
- [x]  Se conseguir, adicione tags aos seus post, assim como filtros para utilizar as tags cadastradas. As tags deverão ser implementadas como uma nova tabela no seu modelo, associada aos posts

**Nível 3:**
- [ ]  Se conseguir, crie a possibilidade de upload de arquivo TXT para criação de um ou mais posts, ou criação de múltiplas tags, utilizando Sidekiq para processamento assíncrono.
## Aprendizados

Como esse seria o meu primeiro projeto completo que eu faria sozinha, eu já esperava alguns desafios além de apenas código, e sem dúvidas eu tive muitos. Desde não saber qual senha eu deveria colocar para conseguir conectar ao banco de dados, até entender - só no final do processo - como eu deveria ter feito tudo desde o início. 
 

Eu escolhi criar uma linha do tempo através dos commits, com uma branch para cada dia e foi uma ótima decisão, principalmente no na sexta-feira a noite, quando eu percebi que estava no caminho errado, e já tinha feito tanta bagunça que o melhor era descartar todo o trabalho recente e voltar para quarta-feira. 

Eis aqui algumas lições que aprendi, documentadas através de commits: 

- A documentação quase sempre tem um starting guide que é exatamente aquilo que eu preciso;
- Não tenha medo de começar já com as coisas complicadas. Eu perdi um bom tempo fazendo a autenticação sozinha, porque o readme do Devise diz "Se você é iniciante, não recomendamos começar por aqui."
- O mesmo vale para a internacionalização, que no fim das contas nem era complicada, apenas trabalhosa;
- Saber pesquisar melhor, não só perguntar ao ChatGPT (e Copilot, Gemini, BlackboxIA);
- Aprendi a usar branches como espaços seguros para testar e corrigir coisas específicas.

### Stack

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)

![Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)

![Database](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

### Conclusões Finais

> — Mari, você sabe nadar?
>
> — Não, mas eu sei aprender.  — Mari, 2 anos (@frasesdecrianças)

Esse desafio foi extremamente enriquecedor para o meu aprendizado, e certamente essa é só a versão 1.0 da Mayo, vou continuar usando esse projeto pessoal para me desenvolver, até que ele esteja com todas as Issues finalizadas (o que talvez nunca aconteça, já que eu fecho uma e abro três 🫠)
