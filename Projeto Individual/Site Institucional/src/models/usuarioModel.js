var database = require("../database/config")

function listar() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT * FROM usuario;
    `;
    var instrucao2 = `
        SELECT * FROM dados;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao + instrucao2);
    database.executar(instrucao);
    return database.executar(instrucao2);
}

function entrar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT * FROM usuario JOIN dados ON email = fkUsuario WHERE email = '${email}' AND senha = sha2('${senha}', 256);
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(nome, sobrenome, email, senha, idade, peso, altura, genero, caloriaIdeal, aguaIdeal) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, sobrenome, email, senha, idade, peso, altura, genero, caloriaIdeal);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO usuario (nome, sobrenome, email, senha) VALUES ('${nome}', '${sobrenome}', '${email}', sha2('${senha}',256));
    `;
    var instrucao2 = `
    INSERT INTO dados (idade, peso, altura, genero, caloriaIdeal, aguaIdeal, fkUsuario) VALUES ('${idade}', '${peso}', '${altura}', '${genero}', '${caloriaIdeal}', '${aguaIdeal}', '${email}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao + instrucao2);
    database.executar(instrucao);
    return database.executar(instrucao2);
}

function salvar(idade, peso, altura, email) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", idade, peso, altura, email);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
    UPDATE dados SET idade = '${idade}', peso = '${peso}', altura = '${altura}' where fkUsuario = "'${email}'";
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    entrar,
    cadastrar,
    listar,
    salvar,
};