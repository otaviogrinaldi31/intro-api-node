CREATE TABLE Condominio (
    cond_id INT AUTO_INCREMENT PRIMARY KEY,
    cond_nome VARCHAR(60) NOT NULL,
    cond_endereco VARCHAR(120) NOT NULL,
    cond_cidade VARCHAR(40) NOT NULL
);

CREATE TABLE Bloco (
    bloc_id INT AUTO_INCREMENT PRIMARY KEY,
    cond_id INT NOT NULL,
    bloc_nome VARCHAR(60) NOT NULL,
    FOREIGN KEY (cond_id) REFERENCES Condominio(cond_id)
);

CREATE TABLE Apartamentos (
    ap_id INT AUTO_INCREMENT PRIMARY KEY,
    bloco_id INT NOT NULL,
    ap_numero VARCHAR(15) NOT NULL,
    ap_andar INT NOT NULL,
    FOREIGN KEY (bloco_id) REFERENCES Bloco(bloc_id)
);

CREATE TABLE Usuarios (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_nome VARCHAR(60) NOT NULL,
    user_email VARCHAR(60) NOT NULL UNIQUE,
    user_senha VARCHAR(60) NOT NULL,
    user_telefone VARCHAR(60),
    user_tipo VARCHAR(30) NOT NULL
);

CREATE TABLE Usuario_Apartamentos (
    userap_id INT AUTO_INCREMENT PRIMARY KEY,
    userid INT NOT NULL,
    ap_id INT NOT NULL,
    FOREIGN KEY (userid) REFERENCES Usuarios(user_id),
    FOREIGN KEY (ap_id) REFERENCES Apartamentos(ap_id)
);

CREATE TABLE Gerenciamento (
    ger_id INT AUTO_INCREMENT PRIMARY KEY,
    cond_id INT NOT NULL,
    ger_data DATE NOT NULL,
    ger_descricao VARCHAR(60) NOT NULL,
    ger_valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (cond_id) REFERENCES Condominio(cond_id)
);

CREATE TABLE Mensagens (
    msg_id INT AUTO_INCREMENT PRIMARY KEY,
    cond_id INT NOT NULL,
    userap_id INT NOT NULL,
    msg_mensagem VARCHAR(128) NOT NULL,
    msg_data_envio DATETIME NOT NULL,
    msg_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (cond_id) REFERENCES Condominio(cond_id),
    FOREIGN KEY (userap_id) REFERENCES Usuario_Apartamentos(userap_id)
);

CREATE TABLE Ambientes (
    amd_id INT AUTO_INCREMENT PRIMARY KEY,
    cond_id INT NOT NULL,
    amd_descricao VARCHAR(100) NOT NULL,
    amd_nome VARCHAR(40) NOT NULL,
    amd_capacidade INT NOT NULL,
    FOREIGN KEY (cond_id) REFERENCES Condominio(cond_id)
);

CREATE TABLE Reservas_Ambientes (
    res_id INT AUTO_INCREMENT PRIMARY KEY,
    userap_id INT NOT NULL,
    ambiid INT NOT NULL,
    res_horario_inicio TIME NOT NULL,
    res_horario_fim TIME NOT NULL,
    res_status VARCHAR(25) NOT NULL,
    res_data_reserva DATE NOT NULL,
    FOREIGN KEY (userap_id) REFERENCES Usuario_Apartamentos(userap_id),
    FOREIGN KEY (ambiid) REFERENCES Ambientes(amd_id)
);

CREATE TABLE Visitantes (
    vst_id INT AUTO_INCREMENT PRIMARY KEY,
    vst_nome VARCHAR(60) NOT NULL,
    vst_documento VARCHAR(60) NOT NULL,
    ap_id INT NOT NULL,
    vst_data_visita DATETIME NOT NULL,
    FOREIGN KEY (ap_id) REFERENCES Apartamentos(ap_id)
);

CREATE TABLE Notificacoes (
    not_id INT AUTO_INCREMENT PRIMARY KEY,
    userAP_id INT NOT NULL,
    not_mensagem TEXT NOT NULL,
    not_data_envio DATETIME NOT NULL,
    not_lida BOOLEAN NOT NULL,
    FOREIGN KEY (userAP_id) REFERENCES Usuario_Apartamentos(userap_id)
);
