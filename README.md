# Restaurante - Sistema de Gestão

Este é um sistema de gestão de restaurante desenvolvido em PHP utilizando o framework Laravel. O objetivo deste projeto é fornecer uma solução eficiente para o gerenciamento de pedidos, cardápio e clientes em um restaurante.

## Funcionalidades

- **Gestão de Pedidos**: Registre e acompanhe os pedidos feitos pelos clientes.
- **Gestão de Cardápio**: Adicione, edite ou remova pratos e bebidas do cardápio.
- **Gestão de Clientes**: Acompanhe o histórico de pedidos e preferências dos clientes.
- **Relatórios**: Gere relatórios de vendas, consumo e desempenho do restaurante.

## Tecnologias Utilizadas

- **PHP**: Linguagem de programação utilizada no backend.
- **Laravel**: Framework PHP utilizado para a estruturação do projeto.
- **MySQL**: Banco de dados relacional para armazenamento de dados.
- **Blade**: Motor de templates do Laravel para construção das interfaces.
- **Bootstrap**: Framework CSS para estilização da interface.

## Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/Restaurante-da-gula.git
   ```

2. Acesse a pasta do projeto:
   ```bash
   cd Restaurante-da-gula
   ```

3. Instale as dependências:
   ```bash
   composer install
   ```

4. Crie o arquivo `.env` a partir do exemplo e configure suas credenciais de banco de dados:
   ```bash
   cp .env.example .env
   ```

5. Gere a chave da aplicação:
   ```bash
   php artisan key:generate
   ```

6. Execute as migrações para criar as tabelas no banco de dados:
   ```bash
   php artisan migrate
   ```

7. Inicie o servidor de desenvolvimento:
   ```bash
   php artisan serve
   ```

8. Acesse o sistema no navegador:
   ```
   http://localhost:8000
   ```

## Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b minha-feature`)
3. Commit suas alterações (`git commit -m 'Adicionei nova feature'`)
4. Faça o push para a branch (`git push origin minha-feature`)
5. Abra um Pull Request

---
