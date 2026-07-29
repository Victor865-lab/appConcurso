-- Insercao de 480 questoes ineditas (estilo VUNESP) sobre fotografia
-- tecnico-pericial em geral (exposicao, sensores, objetivas, arquivos, iluminacao,
-- fluxo de trabalho pericial etc.)
-- Fonte: arquivos quest10.pdf a quest33.pdf (conteudo autoral, gabarito ja vinha
-- no proprio PDF - nenhuma resposta foi inventada, apenas transcrita e conferida).
-- quest34.pdf foi excluido por ser duplicata integral de quest29.pdf (20 questoes
-- identicas, mesmo enunciado/alternativas/gabarito).
-- referencia = "Inéditas Padrão VUNESP", banca = VUNESP, ano = NULL (conteudo
-- nao-oficial, nao e prova real de banca). Numeracao continua a partir de Q101
-- (o lote anterior, quest1-9, usou Q011-Q100).

USE ConcursosDB;
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Diafragma')
    INSERT INTO temas (nome) VALUES (N'Diafragma');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'ISO')
    INSERT INTO temas (nome) VALUES (N'ISO');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Histograma')
    INSERT INTO temas (nome) VALUES (N'Histograma');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Tipos de Arquivos')
    INSERT INTO temas (nome) VALUES (N'Tipos de Arquivos');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Fotometria')
    INSERT INTO temas (nome) VALUES (N'Fotometria');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Objetivas')
    INSERT INTO temas (nome) VALUES (N'Objetivas');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'EV')
    INSERT INTO temas (nome) VALUES (N'EV');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Obturador')
    INSERT INTO temas (nome) VALUES (N'Obturador');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Triângulo de Exposição')
    INSERT INTO temas (nome) VALUES (N'Triângulo de Exposição');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Sensor e Fator de Corte')
    INSERT INTO temas (nome) VALUES (N'Sensor e Fator de Corte');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Tipos de Luzes')
    INSERT INTO temas (nome) VALUES (N'Tipos de Luzes');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Filtros')
    INSERT INTO temas (nome) VALUES (N'Filtros');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Flash')
    INSERT INTO temas (nome) VALUES (N'Flash');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Balanço de Branco')
    INSERT INTO temas (nome) VALUES (N'Balanço de Branco');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Resolução e Qualidade de Imagem')
    INSERT INTO temas (nome) VALUES (N'Resolução e Qualidade de Imagem');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Protocolo e Cartão de Memória')
    INSERT INTO temas (nome) VALUES (N'Protocolo e Cartão de Memória');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Impressão')
    INSERT INTO temas (nome) VALUES (N'Impressão');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'RGB')
    INSERT INTO temas (nome) VALUES (N'RGB');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Edição de Imagens')
    INSERT INTO temas (nome) VALUES (N'Edição de Imagens');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Composição e Enquadramento')
    INSERT INTO temas (nome) VALUES (N'Composição e Enquadramento');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Focagem')
    INSERT INTO temas (nome) VALUES (N'Focagem');
GO

BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- QUESTÃO 101 (arquivo quest10.txt, original Q01)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q101', N'Durante uma perícia em local de crime, o fotógrafo deseja congelar completamente o movimento de gotas de água provenientes de um vazamento. A configuração mais adequada é utilizar', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'velocidade baixa e ISO baixo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'velocidade alta e abertura ampla, se necessário.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'velocidade baixa e diafragma fechado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'velocidade de 1 segundo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'modo Bulb.', 0);

    -- QUESTÃO 102 (arquivo quest10.txt, original Q02)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q102', N'A abertura do diafragma influencia diretamente', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas a profundidade de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apenas a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apenas a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a quantidade de luz e a profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente o foco automático.', 0);

    -- QUESTÃO 103 (arquivo quest10.txt, original Q03)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q103', N'Uma fotografia foi realizada em f/8, 1/250 s e ISO 100. Para utilizar f/5,6 mantendo a mesma exposição, deve-se ajustar a velocidade para', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/125 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/250 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/500 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/1000 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/60 s.', 0);

    -- QUESTÃO 104 (arquivo quest10.txt, original Q04)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q104', N'O aumento do valor ISO normalmente provoca', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminuição do ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento da sensibilidade à luz e possibilidade de maior ruído.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução da resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da profundidade de campo.', 0);

    -- QUESTÃO 105 (arquivo quest10.txt, original Q05)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q105', N'Em fotografia digital, uma imagem subexposta caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'excesso de luminosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'perda de detalhes principalmente nas sombras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'excesso de saturação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'profundidade de campo excessiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'temperatura de cor incorreta.', 0);

    -- QUESTÃO 106 (arquivo quest10.txt, original Q06)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q106', N'O histograma é utilizado para', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'medir a distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'indicar a distribuição dos tons de luminosidade da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'calcular automaticamente o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'medir a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ajustar o foco automático.', 0);

    -- QUESTÃO 107 (arquivo quest10.txt, original Q07)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q107', N'Assinale a alternativa correta sobre profundidade de campo.', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Aumenta com aberturas maiores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Diminui quando se fecha o diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Aumenta quando se utiliza abertura menor (número f maior).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Independe da objetiva utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Depende apenas do ISO.', 0);

    -- QUESTÃO 108 (arquivo quest10.txt, original Q08)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q108', N'O principal objetivo do formato RAW é', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permitir maior flexibilidade na edição da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar completamente o ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir o JPEG em qualquer equipamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'produzir imagens em preto e branco.', 0);

    -- QUESTÃO 109 (arquivo quest10.txt, original Q09)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q109', N'Na fotometria refletida, o equipamento mede', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a luz emitida pelo flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a luz refletida pelo assunto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apenas a iluminação ambiente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'exclusivamente a luz incidente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente a luz infravermelha.', 0);

    -- QUESTÃO 110 (arquivo quest10.txt, original Q10)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q110', N'Uma objetiva de 200 mm apresenta, quando comparada a uma objetiva de 35 mm,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'menor distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'menor campo de visão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'maior profundidade de campo em qualquer situação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'menor ampliação.', 0);

    -- QUESTÃO 111 (arquivo quest10.txt, original Q11)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q111', N'O modo Prioridade de Abertura (A ou Av) permite ao fotógrafo', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'controlar apenas o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'definir a abertura enquanto a câmera calcula a velocidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar simultaneamente abertura e velocidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'definir apenas a velocidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar somente foco manual.', 0);

    -- QUESTÃO 112 (arquivo quest10.txt, original Q12)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q112', N'Ao dobrar o ISO de 100 para 200, mantendo a mesma exposição, é possível', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar velocidade duas vezes mais rápida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar velocidade duas vezes mais lenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fechar quatro pontos o diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar automaticamente a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir a resolução do sensor.', 0);

    -- QUESTÃO 113 (arquivo quest10.txt, original Q13)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q113', N'Uma velocidade de 1/30 s apresenta maior probabilidade de', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'congelar objetos extremamente rápidos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'gerar borramento causado pelo movimento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar a temperatura de cor.', 0);

    -- QUESTÃO 114 (arquivo quest10.txt, original Q14)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q114', N'A principal função do obturador é controlar', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o tempo durante o qual a luz alcança o sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a profundidade de bits.', 0);

    -- QUESTÃO 115 (arquivo quest10.txt, original Q15)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q115', N'Em uma cena extremamente contrastada, o formato que oferece maior latitude para recuperação das altas luzes é', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'GIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'BMP.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'RAW.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'PNG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'JPEG Básico.', 0);

    -- QUESTÃO 116 (arquivo quest10.txt, original Q16)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q116', N'O efeito conhecido como "panning" consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fotografar exclusivamente em preto e branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'acompanhar o movimento do objeto durante o disparo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a velocidade do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar apenas objetivas grande-angulares.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'fotografar sempre com tripé.', 0);

    -- QUESTÃO 117 (arquivo quest10.txt, original Q17)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q117', N'Fechar o diafragma de f/4 para f/5,6 significa', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a entrada de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir pela metade a quantidade de luz que entra.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'dobrar a quantidade de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar o ISO automaticamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a distância focal.', 0);

    -- QUESTÃO 118 (arquivo quest10.txt, original Q18)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q118', N'Uma fotografia corretamente exposta depende principalmente da combinação entre', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO, abertura e velocidade do obturador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'megapixels, foco e zoom.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'temperatura de cor e contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'distância focal e balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'resolução e formato do arquivo.', 0);

    -- QUESTÃO 119 (arquivo quest10.txt, original Q19)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q119', N'Ao utilizar ISO muito elevado, espera-se, em condições normais,', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'redução do ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento da latitude dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento do ruído eletrônico.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'redução da distância focal.', 0);

    -- QUESTÃO 120 (arquivo quest10.txt, original Q20)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q120', N'Em fotografia pericial, uma exposição correta é importante porque', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduz o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'garante maior fidelidade na documentação dos vestígios.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumenta automaticamente a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'elimina a necessidade de pós-processamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substitui a utilização de escalas métricas.', 0);

    -- QUESTÃO 121 (arquivo quest11.txt, original Q21)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q121', N'Ao substituir uma objetiva de 35 mm por uma objetiva de 85 mm, mantendo o fotógrafo na mesma posição, espera-se que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumente o ângulo de visão da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminua a aproximação aparente do assunto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduza o campo de visão e aumente a ampliação do assunto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumente a profundidade de campo em qualquer situação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a perspectiva seja alterada exclusivamente pela objetiva.', 0);

    -- QUESTÃO 122 (arquivo quest11.txt, original Q22)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q122', N'A principal finalidade de uma objetiva macro é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'produzir imagens panorâmicas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permitir grandes ampliações com elevada nitidez em curtas distâncias.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar o zoom digital da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'corrigir automaticamente aberrações cromáticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ampliar a profundidade de campo independentemente da abertura.', 0);

    -- QUESTÃO 123 (arquivo quest11.txt, original Q23)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q123', N'As lentes close-up são caracterizadas por', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'serem instaladas entre o sensor e a objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'substituírem completamente a objetiva principal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'serem rosqueadas na parte frontal da objetiva, reduzindo a distância mínima de foco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentarem automaticamente a luminosidade da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminarem a necessidade de foco manual.', 0);

    -- QUESTÃO 124 (arquivo quest11.txt, original Q24)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q124', N'Uma lente close-up de +4 dioptrias possui distância focal aproximada de', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'4 m.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'2 m.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1 m.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'50 cm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'25 cm.', 1);

    -- QUESTÃO 125 (arquivo quest11.txt, original Q25)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q125', N'Na macrofotografia, ao aumentar significativamente a ampliação da imagem, ocorre normalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da luminosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução da perda de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'necessidade de compensação da exposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento da velocidade do obturador sem alteração da exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'redução da profundidade de bits.', 0);

    -- QUESTÃO 126 (arquivo quest11.txt, original Q26)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q126', N'O tubo extensor caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'possuir elementos ópticos que ampliam a imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar eletronicamente a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'afastar a objetiva do sensor, permitindo maior ampliação sem utilizar elementos ópticos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir o diafragma da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar automaticamente a profundidade de campo.', 0);

    -- QUESTÃO 127 (arquivo quest11.txt, original Q27)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q127', N'Uma objetiva olho-de-peixe caracteriza-se principalmente por apresentar', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'distância focal superior a 300 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ângulo de visão extremamente amplo, podendo atingir aproximadamente 180°.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ausência total de distorções geométricas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilização exclusiva em fotografia macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'profundidade de campo extremamente reduzida.', 0);

    -- QUESTÃO 128 (arquivo quest11.txt, original Q28)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q128', N'As objetivas catadióptricas utilizam', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas lentes convergentes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'exclusivamente elementos eletrônicos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'combinação de lentes e espelhos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas prismas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente espelhos planos.', 0);

    -- QUESTÃO 129 (arquivo quest11.txt, original Q29)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q129', N'Uma característica típica das objetivas catadióptricas é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'grande ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'baixa distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'efeito de desfoque em forma de anel ("donut bokeh").', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'profundidade de campo extremamente elevada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'abertura variável entre f/1,4 e f/2.', 0);

    -- QUESTÃO 130 (arquivo quest11.txt, original Q30)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q130', N'Em uma objetiva zoom de 24–70 mm, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a distância focal permanece fixa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o fotógrafo pode variar a distância focal dentro do intervalo especificado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'trata-se obrigatoriamente de uma objetiva macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o ângulo de visão permanece constante.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'não pode ser utilizada em câmeras digitais.', 0);

    -- QUESTÃO 131 (arquivo quest11.txt, original Q31)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q131', N'Quanto maior a distância focal da objetiva,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior tende a ser a ampliação do assunto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'maior será obrigatoriamente a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'menor será a resolução da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'maior será o ISO utilizado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'menor será a distância mínima de foco.', 0);

    -- QUESTÃO 132 (arquivo quest11.txt, original Q32)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q132', N'A profundidade de campo tende a diminuir quando', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utiliza-se abertura menor (f/16).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utiliza-se objetiva grande-angular.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utiliza-se teleobjetiva associada a grande abertura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumenta-se a distância entre câmera e assunto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduz-se o ISO.', 0);

    -- QUESTÃO 133 (arquivo quest11.txt, original Q33)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q133', N'Uma objetiva considerada "rápida" caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'possuir foco automático mais veloz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apresentar grande abertura máxima.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar obturador eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'possuir maior resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apresentar estabilização óptica.', 0);

    -- QUESTÃO 134 (arquivo quest11.txt, original Q34)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q134', N'Na fotografia pericial de pequenos vestígios, a objetiva mais indicada é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'olho-de-peixe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'superteleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'macro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'pinhole.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'catadióptrica.', 0);

    -- QUESTÃO 135 (arquivo quest11.txt, original Q35)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q135', N'A principal vantagem de uma objetiva de distância focal fixa ("prime") é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'permitir variação contínua da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apresentar, em geral, elevada qualidade óptica e grande abertura máxima.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar completamente aberrações ópticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir objetivas macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'dispensar foco manual.', 0);

    -- QUESTÃO 136 (arquivo quest11.txt, original Q36)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q136', N'Ao utilizar uma objetiva de 24 mm, espera-se obter', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pequeno ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'campo de visão amplo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'efeito típico de teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'compressão intensa da perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ampliação semelhante à de uma objetiva de 200 mm.', 0);

    -- QUESTÃO 137 (arquivo quest11.txt, original Q37)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q137', N'As objetivas grande-angulares são frequentemente utilizadas porque', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'permitem registrar áreas maiores da cena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apresentam obrigatoriamente maior luminosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentam automaticamente a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzem a profundidade de campo em qualquer situação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminam distorções de perspectiva.', 0);

    -- QUESTÃO 138 (arquivo quest11.txt, original Q38)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q138', N'Uma objetiva de 50 mm em sensor full frame é tradicionalmente considerada', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ultra grande-angular.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'normal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'superteleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'olho-de-peixe.', 0);

    -- QUESTÃO 139 (arquivo quest11.txt, original Q39)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q139', N'Em relação às objetivas zoom e prime, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As objetivas prime possuem distância focal variável.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'As objetivas zoom apresentam distância focal fixa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'As objetivas prime normalmente oferecem maior luminosidade máxima.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Não existe diferença óptica entre ambas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Objetivas zoom não possuem foco automático.', 0);

    -- QUESTÃO 140 (arquivo quest11.txt, original Q40)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q140', N'Na documentação pericial, a escolha correta da objetiva influencia principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas o tamanho final do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o enquadramento, a perspectiva registrada e o nível de detalhamento do vestígio.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusivamente a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas a velocidade de gravação no cartão de memória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente o balanço de branco.', 0);

    -- QUESTÃO 141 (arquivo quest12.txt, original Q41)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q141', N'Em fotografia pericial realizada ao meio-dia, sob céu totalmente limpo, a luz incidente tende a apresentar características de', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'baixa intensidade e sombras suaves.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alta difusão e baixo contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'elevada intensidade e sombras bem definidas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'temperatura de cor inferior à da luz de tungstênio.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'iluminação uniforme semelhante à produzida por um softbox.', 0);

    -- QUESTÃO 142 (arquivo quest12.txt, original Q42)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q142', N'A principal função de um difusor é', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a potência do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'concentrar o feixe luminoso.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'suavizar a iluminação, reduzindo sombras intensas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diminuir a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a profundidade de campo.', 0);

    -- QUESTÃO 143 (arquivo quest12.txt, original Q43)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q143', N'O softbox é utilizado principalmente para produzir', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'luz dura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'luz difusa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'luz monocromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'iluminação infravermelha.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'luz ultravioleta.', 0);

    -- QUESTÃO 144 (arquivo quest12.txt, original Q44)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q144', N'O refletor fotográfico possui como principal finalidade', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'refletir a luz existente para preencher sombras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substituir completamente o flash.', 0);

    -- QUESTÃO 145 (arquivo quest12.txt, original Q45)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q145', N'O filtro polarizador é utilizado principalmente para', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir reflexos em superfícies não metálicas e aumentar a saturação do céu.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'diminuir a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a potência do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'corrigir distorções geométricas.', 0);

    -- QUESTÃO 146 (arquivo quest12.txt, original Q46)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q146', N'Um filtro ND8 reduz aproximadamente', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1 stop.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'2 stops.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'3 stops.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'4 stops.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'5 stops.', 0);

    -- QUESTÃO 147 (arquivo quest12.txt, original Q47)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q147', N'O filtro ND é empregado quando se deseja', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a nitidez da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a quantidade de luz que chega ao sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a resolução da imagem.', 0);

    -- QUESTÃO 148 (arquivo quest12.txt, original Q48)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q148', N'A temperatura de cor aproximada da luz do flash eletrônico é', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'2.000 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'3.200 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'4.000 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'5.500 K.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'9.000 K.', 0);

    -- QUESTÃO 149 (arquivo quest12.txt, original Q49)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q149', N'Lâmpadas incandescentes de tungstênio apresentam temperatura de cor aproximada de', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1.500 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'3.200 K.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'5.500 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'7.000 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'9.500 K.', 0);

    -- QUESTÃO 150 (arquivo quest12.txt, original Q50)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q150', N'Quando o balanço de branco está incorretamente ajustado, a consequência mais comum é', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'alteração da reprodução das cores.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento do ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'redução da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alteração da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'perda da profundidade de campo.', 0);

    -- QUESTÃO 151 (arquivo quest12.txt, original Q51)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q151', N'O balanço de branco personalizado (Custom White Balance) permite', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'adaptar a reprodução das cores às condições reais de iluminação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar automaticamente o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ampliar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'modificar a distância focal.', 0);

    -- QUESTÃO 152 (arquivo quest12.txt, original Q52)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q152', N'Em relação ao flash eletrônico, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Sua principal função é aumentar a resolução da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'É utilizado para fornecer iluminação adicional quando necessário.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Elimina completamente as sombras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Dispensa qualquer ajuste de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Pode ser utilizado apenas em ambientes internos.', 0);

    -- QUESTÃO 153 (arquivo quest12.txt, original Q53)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q153', N'O Número Guia (NG) do flash representa', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sua temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sua potência luminosa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a velocidade máxima de sincronismo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a distância focal ideal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a resolução máxima do equipamento.', 0);

    -- QUESTÃO 154 (arquivo quest12.txt, original Q54)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q154', N'Um flash possui NG 56 (ISO 100). Para fotografar um objeto situado a 7 metros, a abertura aproximada deverá ser', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/2.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/8.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/11.', 0);

    -- QUESTÃO 155 (arquivo quest12.txt, original Q55)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q155', N'Ao dobrar a distância entre o flash e o objeto fotografado,', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumenta a intensidade luminosa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminui significativamente a iluminação recebida pelo objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a exposição permanece inalterada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumenta automaticamente a abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduz o ruído eletrônico.', 0);

    -- QUESTÃO 156 (arquivo quest12.txt, original Q56)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q156', N'Na fotografia pericial, recomenda-se evitar sombras excessivas porque elas podem', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ocultar detalhes importantes dos vestígios.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'melhorar o contraste sem qualquer desvantagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a profundidade de campo.', 0);

    -- QUESTÃO 157 (arquivo quest12.txt, original Q57)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q157', N'Quando uma cena apresenta iluminação mista (flash e luz de tungstênio), pode ocorrer', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'perda automática do foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diferença de tonalidade entre áreas iluminadas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração da profundidade de campo.', 0);

    -- QUESTÃO 158 (arquivo quest12.txt, original Q58)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q158', N'Na fotometria incidente, mede-se', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a luz refletida pelo objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a luz que incide diretamente sobre o assunto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apenas a iluminação emitida pelo flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'exclusivamente a luz ambiente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a resolução luminosa da objetiva.', 0);

    -- QUESTÃO 159 (arquivo quest12.txt, original Q59)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q159', N'O fotômetro de mão utilizado no modo incidente fornece medições', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'independentes da refletância do objeto fotografado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'influenciadas pela cor do objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'baseadas exclusivamente no histograma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'impossíveis em ambientes externos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'limitadas ao uso com flash.', 0);

    -- QUESTÃO 160 (arquivo quest12.txt, original Q60)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q160', N'Durante uma fotografia pericial de um objeto altamente reflexivo, o equipamento mais útil para minimizar reflexos indesejados é', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'filtro UV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'filtro polarizador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'filtro Skylight.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'filtro ND.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'filtro infravermelho.', 0);

    -- QUESTÃO 161 (arquivo quest13.txt, original Q61)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q161', N'O sensor de imagem de uma câmera digital tem como principal função', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'armazenar permanentemente as fotografias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'converter a luz captada pela objetiva em sinais elétricos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'realizar automaticamente o foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'definir a distância focal da objetiva.', 0);

    -- QUESTÃO 162 (arquivo quest13.txt, original Q62)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q162', N'Os sensores CMOS diferenciam-se dos CCD, principalmente, por', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'consumirem menos energia e permitirem leitura mais rápida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apresentarem menor resolução máxima.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'não produzirem ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'dispensarem conversão analógico-digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'funcionarem apenas em câmeras profissionais.', 0);

    -- QUESTÃO 163 (arquivo quest13.txt, original Q63)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q163', N'Em relação aos sensores BSI CMOS (Backside Illuminated), é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzem a quantidade de luz captada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentam a eficiência na captação de luz, especialmente em ambientes pouco iluminados.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminam completamente o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituem o uso do ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'são exclusivos de câmeras analógicas.', 0);

    -- QUESTÃO 164 (arquivo quest13.txt, original Q64)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q164', N'Quanto maior o número de megapixels de um sensor, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'obrigatoriamente a qualidade da imagem será superior.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumenta apenas a capacidade de ampliação e resolução espacial, sem garantir melhor qualidade geral.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'diminui a latitude dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduz automaticamente o ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'elimina a necessidade de foco preciso.', 0);

    -- QUESTÃO 165 (arquivo quest13.txt, original Q65)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q165', N'A profundidade de bits está relacionada à', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'quantidade de cores ou tons que cada pixel pode representar.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'potência do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'temperatura de cor.', 0);

    -- QUESTÃO 166 (arquivo quest13.txt, original Q66)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q166', N'Um arquivo RAW caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'conter os dados capturados pelo sensor com mínimo processamento interno.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apresentar compressão com perdas obrigatoriamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'possuir tamanho sempre inferior ao JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'não permitir edição posterior.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'armazenar apenas imagens em preto e branco.', 0);

    -- QUESTÃO 167 (arquivo quest13.txt, original Q67)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q167', N'O formato JPEG caracteriza-se por utilizar, normalmente,', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'compressão sem perdas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'compressão com perdas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ausência de compressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'criptografia obrigatória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apenas imagens monocromáticas.', 0);

    -- QUESTÃO 168 (arquivo quest13.txt, original Q68)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q168', N'Entre os formatos abaixo, aquele mais indicado para arquivamento de imagens com alta qualidade e possibilidade de edição é', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'GIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'BMP.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'TIFF.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'JPEG Básico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'WEBP com perdas.', 0);

    -- QUESTÃO 169 (arquivo quest13.txt, original Q69)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q169', N'Os metadados EXIF armazenam informações como', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'senha do cartão de memória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'velocidade do obturador, abertura, ISO, data e modelo da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'conteúdo textual da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'compressão do disco rígido.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'localização do fotógrafo em tempo real obrigatoriamente.', 0);

    -- QUESTÃO 170 (arquivo quest13.txt, original Q70)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q170', N'O padrão IPTC é utilizado principalmente para', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'armazenar informações descritivas, autoria e identificação das imagens.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'controlar a exposição automática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir o EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir ruído eletrônico.', 0);

    -- QUESTÃO 171 (arquivo quest13.txt, original Q71)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q171', N'O pixel quente ("hot pixel") caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'deixar de registrar qualquer informação luminosa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apresentar brilho excessivo, principalmente em exposições longas ou ISO elevado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aparecer apenas em sensores CCD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar a distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ocorrer exclusivamente em sensores antigos.', 0);

    -- QUESTÃO 172 (arquivo quest13.txt, original Q72)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q172', N'O pixel morto ("dead pixel") caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'registrar permanentemente um ponto escuro, sem resposta à luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar o contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'modificar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir o tamanho do arquivo.', 0);

    -- QUESTÃO 173 (arquivo quest13.txt, original Q73)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q173', N'O chamado "stuck pixel" caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'permanecer constantemente aceso em uma ou mais cores.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'deixar de captar luz definitivamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'modificar a distância focal.', 0);

    -- QUESTÃO 174 (arquivo quest13.txt, original Q74)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q174', N'O fenômeno conhecido como "banding" corresponde', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao aparecimento de faixas visíveis em transições suaves de tonalidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao aumento da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à redução da latitude dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao superaquecimento da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'à perda do foco automático.', 0);

    -- QUESTÃO 175 (arquivo quest13.txt, original Q75)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q175', N'A principal função do conversor analógico-digital (A/D) é', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'transformar sinais elétricos analógicos em informações digitais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'controlar o flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'corrigir aberrações cromáticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'realizar o foco automático.', 0);

    -- QUESTÃO 176 (arquivo quest13.txt, original Q76)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q176', N'O processo denominado "demosaicing" consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reconstruir a imagem colorida a partir das informações captadas pelos filtros do sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'converter JPEG em RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a profundidade de bits.', 0);

    -- QUESTÃO 177 (arquivo quest13.txt, original Q77)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q177', N'Quanto à resolução de impressão, uma fotografia de aproximadamente 20 × 30 cm em 300 dpi necessita, aproximadamente,', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'600 × 900 pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1200 × 1800 pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1800 × 2400 pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'2400 × 3600 pixels.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'4800 × 7200 pixels.', 0);

    -- QUESTÃO 178 (arquivo quest13.txt, original Q78)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q178', N'O espaço de cor sRGB caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ser amplamente compatível com monitores, navegadores e internet.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'possuir gama obrigatoriamente maior que Adobe RGB em todas as situações.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ser exclusivo para impressão gráfica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar a necessidade de gerenciamento de cores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'armazenar arquivos RAW.', 0);

    -- QUESTÃO 179 (arquivo quest13.txt, original Q79)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q179', N'Ao fotografar em RAW e JPEG simultaneamente, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas o RAW será gravado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apenas o JPEG será gravado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ambos os formatos serão registrados simultaneamente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o RAW será automaticamente apagado após a edição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o JPEG possuirá obrigatoriamente maior qualidade.', 0);

    -- QUESTÃO 180 (arquivo quest13.txt, original Q80)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q180', N'Na fotografia pericial digital, a preservação dos arquivos originais é importante porque', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduz o tempo de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'mantém a integridade das evidências registradas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumenta automaticamente a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'elimina a necessidade de backup.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substitui a cadeia de custódia.', 0);

    -- QUESTÃO 181 (arquivo quest14.txt, original Q81)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q181', N'Durante o registro fotográfico de um local de crime, a principal finalidade das imagens produzidas é', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'produzir fotografias com finalidade artística.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'registrar fielmente o estado dos vestígios no momento do exame.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a resolução das evidências.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir o laudo pericial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar a necessidade de descrição escrita.', 0);

    -- QUESTÃO 182 (arquivo quest14.txt, original Q82)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q182', N'Na fotografia pericial, antes da realização de imagens de detalhe, recomenda-se registrar', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas fotografias macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apenas imagens em preto e branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fotografias gerais e de aproximação progressiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'exclusivamente imagens com flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente imagens panorâmicas em 360°.', 0);

    -- QUESTÃO 183 (arquivo quest14.txt, original Q83)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q183', N'Na documentação de um vestígio de pequenas dimensões, a utilização de escala métrica tem como principal finalidade', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fornecer referência dimensional ao objeto fotografado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir reflexos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'corrigir perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a profundidade de campo.', 0);

    -- QUESTÃO 184 (arquivo quest14.txt, original Q84)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q184', N'Durante a fotografia de um vestígio, o uso de zoom digital deve ser evitado principalmente porque', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'altera fisicamente a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'normalmente reduz a qualidade da imagem ao ampliar digitalmente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'impede o funcionamento do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'modifica a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumenta o ruído do sensor por aquecimento.', 0);

    -- QUESTÃO 185 (arquivo quest14.txt, original Q85)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q185', N'Ao registrar uma impressão papilar sobre superfície brilhante, uma medida que pode auxiliar na redução de reflexos é', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar ISO máximo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'empregar filtro polarizador quando aplicável.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar apenas foco automático contínuo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar o zoom digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar balanço de branco automático.', 0);

    -- QUESTÃO 186 (arquivo quest14.txt, original Q86)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q186', N'Em relação ao backup de imagens periciais, a regra 3-2-1 recomenda manter', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'três cópias em um único dispositivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'duas cópias em dispositivos idênticos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'três cópias dos dados, em dois tipos de mídia, sendo uma fora do local principal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas uma cópia em nuvem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apenas duas cópias no mesmo computador.', 0);

    -- QUESTÃO 187 (arquivo quest14.txt, original Q87)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q187', N'Um cartão de memória corrompido contendo fotografias periciais deve, prioritariamente,', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ser imediatamente formatado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ter os arquivos sobrescritos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ser preservado e submetido a procedimentos adequados de recuperação, quando cabíveis.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ser descartado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ser utilizado normalmente até o término da perícia.', 0);

    -- QUESTÃO 188 (arquivo quest14.txt, original Q88)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q188', N'Na gravação de vídeos periciais, a resolução 1920 × 1080 pixels corresponde ao padrão', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'SD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'HD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Full HD.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Quad HD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'4K.', 0);

    -- QUESTÃO 189 (arquivo quest14.txt, original Q89)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q189', N'Uma gravação em 3840 × 2160 pixels corresponde, convencionalmente, ao padrão', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'VGA.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'HD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Full HD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'2K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'4K UHD.', 1);

    -- QUESTÃO 190 (arquivo quest14.txt, original Q90)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q190', N'A gravação de vídeo em 60 quadros por segundo (60 fps), quando comparada a 30 fps, tende a apresentar', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'menor fluidez dos movimentos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'maior fluidez na reprodução de movimentos rápidos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'menor quantidade de informações por segundo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução automática da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'impossibilidade de reprodução em monitores atuais.', 0);

    -- QUESTÃO 191 (arquivo quest14.txt, original Q91)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q191', N'O principal objetivo da calibração de monitores é', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a velocidade de processamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'garantir maior fidelidade na reprodução das cores.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o tamanho dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar completamente o ruído eletrônico.', 0);

    -- QUESTÃO 192 (arquivo quest14.txt, original Q92)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q192', N'O uso do formato RAW é especialmente recomendado em fotografia pericial porque', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduz significativamente o espaço ocupado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'oferece maior flexibilidade para ajustes técnicos sem comprometer os dados originais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'elimina a necessidade de backups.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substitui a cadeia de custódia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'impede alterações na exposição.', 0);

    -- QUESTÃO 193 (arquivo quest14.txt, original Q93)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q193', N'A transferência de arquivos diretamente do cartão de memória para um computador deve ser realizada, preferencialmente,', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'interrompendo a alimentação elétrica durante a cópia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'removendo o cartão antes do término da transferência.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aguardando a conclusão da gravação e utilizando a ejeção segura quando aplicável.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizando apenas conexões sem fio.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apagando imediatamente os arquivos do cartão.', 0);

    -- QUESTÃO 194 (arquivo quest14.txt, original Q94)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q194', N'Uma objetiva estabilizada (VR, IS, OSS, conforme o fabricante) tem como principal finalidade', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'compensar pequenas vibrações da câmera durante o disparo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar automaticamente a abertura do diafragma.', 0);

    -- QUESTÃO 195 (arquivo quest14.txt, original Q95)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q195', N'Ao fotografar utilizando tripé, recomenda-se, sempre que possível,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o ISO ao máximo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'desativar o estabilizador óptico, quando o fabricante assim recomendar.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar exclusivamente foco automático contínuo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fotografar apenas em JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar apenas velocidades superiores a 1/1000 s.', 0);

    -- QUESTÃO 196 (arquivo quest14.txt, original Q96)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q196', N'Em uma câmera digital, o buffer corresponde', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao sensor responsável pela captação da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'à memória temporária utilizada para armazenar imagens antes da gravação definitiva no cartão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao sistema de foco automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao conjunto óptico da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao cartão de memória.', 0);

    -- QUESTÃO 197 (arquivo quest14.txt, original Q97)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q197', N'Quando o buffer da câmera está completamente ocupado,', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o foco automático deixa de funcionar permanentemente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a câmera pode reduzir temporariamente a velocidade de disparos contínuos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a resolução das imagens aumenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o ISO é reduzido automaticamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o obturador permanece aberto continuamente.', 0);

    -- QUESTÃO 198 (arquivo quest14.txt, original Q98)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q198', N'Em relação ao histograma, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Um histograma concentrado apenas na extremidade direita indica predominância de tons claros.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O histograma informa a distância focal utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O histograma determina automaticamente a exposição correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O histograma substitui a avaliação visual da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O histograma mede exclusivamente a nitidez da imagem.', 0);

    -- QUESTÃO 199 (arquivo quest14.txt, original Q99)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q199', N'Na fotografia técnico-pericial, a fidelidade da documentação depende, entre outros fatores,', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'exclusivamente do número de megapixels da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apenas da utilização de objetivas profissionais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da correta exposição, do enquadramento adequado e da preservação dos arquivos originais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas do uso do formato RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'exclusivamente da utilização de flash.', 0);

    -- QUESTÃO 200 (arquivo quest14.txt, original Q100)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q200', N'Durante uma perícia, o fotógrafo deve priorizar procedimentos que assegurem', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a produção de imagens esteticamente impactantes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a modificação digital dos vestígios para melhorar sua visualização.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a documentação fiel, objetiva e tecnicamente reproduzível dos vestígios.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a eliminação de elementos considerados pouco importantes pelo fotógrafo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a substituição das anotações do perito pelas fotografias.', 0);

    -- QUESTÃO 201 (arquivo quest15.txt, original Q101)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q201', N'Durante a documentação fotográfica de um acidente de trânsito, o fotógrafo pretende registrar simultaneamente um veículo localizado a cerca de 2 metros da câmera e a sinalização existente aproximadamente a 40 metros de distância, mantendo ambos nítidos. A configuração mais adequada é utilizar', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diafragma bastante aberto (f/1,8).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'teleobjetiva de 300 mm em abertura máxima.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'diafragma fechado, visando maior profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO máximo disponível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'velocidade de 1/4000 s.', 0);

    -- QUESTÃO 202 (arquivo quest15.txt, original Q102)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q202', N'Ao fotografar um vestígio metálico sob iluminação intensa, observa-se um reflexo especular que impede a correta visualização da superfície. A solução mais indicada é', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar filtro polarizador, quando tecnicamente aplicável.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar zoom digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diminuir a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar apenas o formato do arquivo para JPEG.', 0);

    -- QUESTÃO 203 (arquivo quest15.txt, original Q103)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q203', N'Uma câmera foi ajustada para ISO 100, f/8 e 1/250 s. Mantendo a mesma exposição, caso o ISO seja alterado para 400, a velocidade mais adequada será', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/60 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/125 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/500 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/1000 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/2000 s.', 0);

    -- QUESTÃO 204 (arquivo quest15.txt, original Q104)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q204', N'Na fotografia digital, o aumento da distância focal de uma objetiva provoca, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento do ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução do campo de visão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento automático da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução do ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da temperatura de cor.', 0);

    -- QUESTÃO 205 (arquivo quest15.txt, original Q105)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q205', N'Durante uma perícia realizada à noite, utilizando tripé e assunto totalmente imóvel, a melhor estratégia para obter elevada qualidade de imagem é', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o ISO ao máximo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar velocidade mais longa e ISO baixo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar apenas JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'abrir totalmente o diafragma independentemente da profundidade de campo desejada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar zoom digital.', 0);

    -- QUESTÃO 206 (arquivo quest15.txt, original Q106)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q206', N'Em relação ao histograma, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Um histograma concentrado à esquerda indica predominância de tons escuros.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O histograma mede a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O histograma determina automaticamente o foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O histograma informa a distância focal utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O histograma substitui o fotômetro.', 0);

    -- QUESTÃO 207 (arquivo quest15.txt, original Q107)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q207', N'Uma fotografia foi registrada em RAW. Comparativamente ao JPEG, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'possui menor latitude para edição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'armazena menor quantidade de informações.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'permite maior recuperação de altas luzes e sombras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'elimina completamente o ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'não necessita conversão.', 0);

    -- QUESTÃO 208 (arquivo quest15.txt, original Q108)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q208', N'O principal motivo para utilizar uma objetiva macro em fotografia pericial é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a velocidade de sincronismo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'registrar pequenos vestígios com elevada ampliação e nitidez.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar o campo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diminuir a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir o tamanho dos arquivos.', 0);

    -- QUESTÃO 209 (arquivo quest15.txt, original Q109)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q209', N'Ao utilizar uma lente close-up de +10 dioptrias, espera-se', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da distância mínima de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'possibilidade de fotografar muito mais próximo do objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'redução da ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminação da necessidade de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da profundidade de campo.', 0);

    -- QUESTÃO 210 (arquivo quest15.txt, original Q110)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q210', N'O buffer da câmera é responsável por', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'armazenar temporariamente as imagens antes da gravação definitiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'controlar a temperatura do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'realizar o foco automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'controlar o diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'armazenar permanentemente os arquivos RAW.', 0);

    -- QUESTÃO 211 (arquivo quest15.txt, original Q111)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q211', N'Em uma sequência contínua de disparos, quando o buffer é totalmente preenchido,', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a câmera tende a reduzir temporariamente a velocidade de disparo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o cartão de memória deixa de funcionar.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o sensor é desligado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o foco passa obrigatoriamente para manual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ocorre perda automática das imagens anteriores.', 0);

    -- QUESTÃO 212 (arquivo quest15.txt, original Q112)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q212', N'Na fotografia de vestígios biológicos, a iluminação deve ser escolhida de forma que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'privilegie efeitos artísticos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'preserve a visualização dos detalhes relevantes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'produza sombras intensas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'elimine completamente qualquer contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilize exclusivamente flash direto.', 0);

    -- QUESTÃO 213 (arquivo quest15.txt, original Q113)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q213', N'Em relação ao EXIF, é correto afirmar que ele registra', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas o nome do fotógrafo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'informações técnicas da captura, como ISO, abertura e velocidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusivamente a localização geográfica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'somente a resolução da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apenas a data da fotografia.', 0);

    -- QUESTÃO 214 (arquivo quest15.txt, original Q114)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q214', N'Uma objetiva 24–70 mm caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'distância focal fixa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'possibilidade de variar a distância focal dentro desse intervalo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ser obrigatoriamente macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'possuir foco exclusivamente manual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apresentar ângulo de visão constante.', 0);

    -- QUESTÃO 215 (arquivo quest15.txt, original Q115)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q215', N'Ao fotografar um objeto extremamente pequeno utilizando tubo extensor, é esperado', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da ampliação e perda de luminosidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução da ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento automático da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminação do foco manual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'redução da distância focal da objetiva.', 0);

    -- QUESTÃO 216 (arquivo quest15.txt, original Q116)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q216', N'O espaço de cor sRGB é amplamente utilizado porque', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apresenta elevada compatibilidade entre dispositivos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'elimina a necessidade de calibração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'possui obrigatoriamente gama superior ao Adobe RGB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'é exclusivo para impressão offset.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente pode ser utilizado em RAW.', 0);

    -- QUESTÃO 217 (arquivo quest15.txt, original Q117)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q217', N'Uma fotografia apresenta áreas totalmente brancas, sem qualquer textura. Esse fenômeno indica', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'subexposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'superexposição das altas luzes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'excesso de nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'banding.', 0);

    -- QUESTÃO 218 (arquivo quest15.txt, original Q118)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q218', N'Ao utilizar um filtro ND8, o fotógrafo pretende principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a saturação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir aproximadamente três pontos de luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a potência do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'corrigir aberrações ópticas.', 0);

    -- QUESTÃO 219 (arquivo quest15.txt, original Q119)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q219', N'Na documentação de locais de crime, recomenda-se preservar os arquivos originais porque', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'permitem maior compressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'constituem parte importante da integridade da documentação produzida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzem automaticamente o tamanho do backup.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminam a necessidade de metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substituem a cadeia de custódia.', 0);

    -- QUESTÃO 220 (arquivo quest15.txt, original Q120)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q220', N'Durante uma perícia fotográfica, a escolha da objetiva deve considerar principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas o preço do equipamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o enquadramento, a distância de trabalho e o nível de detalhamento necessário.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusivamente a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas a abertura máxima disponível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente a marca do fabricante.', 0);

    -- QUESTÃO 221 (arquivo quest16.txt, original Q121)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q221', N'Durante o registro de um vestígio em ambiente externo, sob forte iluminação solar, o fotógrafo pretende utilizar velocidade de 1/30 s para registrar o movimento da água de uma fonte existente ao fundo. Sem alterar a abertura do diafragma, a solução mais adequada é', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar filtro ND.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar filtro UV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar uma teleobjetiva.', 0);

    -- QUESTÃO 222 (arquivo quest16.txt, original Q122)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q222', N'Ao fotografar em RAW, comparativamente ao JPEG, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o arquivo normalmente ocupa menor espaço.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'os dados sofrem maior compressão com perdas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'há maior flexibilidade para ajustes posteriores de exposição e balanço de branco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'não são armazenados metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o arquivo é incompatível com softwares de edição.', 0);

    -- QUESTÃO 223 (arquivo quest16.txt, original Q123)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q223', N'Uma objetiva de 14 mm é classificada, em regra, como', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'objetiva normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ultra grande-angular.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'catadióptrica.', 0);

    -- QUESTÃO 224 (arquivo quest16.txt, original Q124)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q224', N'Na fotografia técnico-pericial, a sequência recomendada de registro do local consiste, preferencialmente, em', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'detalhes, aproximação e visão geral.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'visão geral, aproximação e detalhes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'macrofotografia seguida de panorâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas detalhes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apenas fotografias panorâmicas.', 0);

    -- QUESTÃO 225 (arquivo quest16.txt, original Q125)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q225', N'Em uma câmera configurada para ISO 100, f/11 e 1/125 s, o fotógrafo deseja utilizar f/8 mantendo a mesma exposição. A velocidade deverá ser ajustada para', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/60 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/125 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/250 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/500 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/1000 s.', 0);

    -- QUESTÃO 226 (arquivo quest16.txt, original Q126)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q226', N'Em relação ao foco seletivo, é correto afirmar que ele é favorecido por', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diafragma fechado e grande profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'grande abertura do diafragma e reduzida profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'filtro polarizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'objetiva olho-de-peixe.', 0);

    -- QUESTÃO 227 (arquivo quest16.txt, original Q127)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q227', N'O principal objetivo do uso de escalas métricas na fotografia pericial é', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fornecer referência dimensional ao vestígio.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir reflexos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'corrigir distorções ópticas.', 0);

    -- QUESTÃO 228 (arquivo quest16.txt, original Q128)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q228', N'Em sensores digitais, a latitude dinâmica representa', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a distância focal máxima da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a capacidade de registrar detalhes simultaneamente em altas luzes e sombras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o número de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a potência do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a profundidade de bits.', 0);

    -- QUESTÃO 229 (arquivo quest16.txt, original Q129)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q229', N'A função principal das microlentes presentes sobre muitos sensores digitais é', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'direcionar mais luz para os fotodiodos, aumentando a eficiência luminosa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o tamanho do cartão de memória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar aberrações cromáticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'controlar a velocidade do obturador.', 0);

    -- QUESTÃO 230 (arquivo quest16.txt, original Q130)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q230', N'Durante uma sequência de disparos contínuos, o fator que mais influencia o tempo necessário para esvaziar o buffer é', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a velocidade de gravação do cartão de memória.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a profundidade de campo.', 0);

    -- QUESTÃO 231 (arquivo quest16.txt, original Q131)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q231', N'O formato TIFF é amplamente utilizado quando se deseja', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'máxima compressão com perdas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'preservar elevada qualidade de imagem para arquivamento ou edição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir drasticamente o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'gravar vídeos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'registrar metadados EXIF apenas.', 0);

    -- QUESTÃO 232 (arquivo quest16.txt, original Q132)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q232', N'Ao utilizar uma objetiva de 400 mm, o fotógrafo deverá esperar, em relação a uma objetiva de 50 mm,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'menor aproximação aparente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'campo de visão significativamente menor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'maior profundidade de campo em qualquer situação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'menor distância focal.', 0);

    -- QUESTÃO 233 (arquivo quest16.txt, original Q133)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q233', N'O uso de iluminação difusa é especialmente recomendado quando se pretende', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'evidenciar sombras profundas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir sombras marcadas e distribuir melhor a luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'produzir contraste extremo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a potência do flash.', 0);

    -- QUESTÃO 234 (arquivo quest16.txt, original Q134)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q234', N'Em relação ao pixel quente (hot pixel), assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apresenta brilho excessivo, principalmente em longas exposições.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Permanece permanentemente preto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Surge apenas em sensores CCD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Ocorre exclusivamente em ISO 100.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Altera a distância focal.', 0);

    -- QUESTÃO 235 (arquivo quest16.txt, original Q135)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q235', N'Uma câmera apresenta capacidade de gravação em RAW + JPEG. Essa configuração permite', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'registrar apenas o RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'registrar apenas o JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'gravar simultaneamente os dois formatos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'converter automaticamente RAW em TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'gravar exclusivamente arquivos comprimidos.', 0);

    -- QUESTÃO 236 (arquivo quest16.txt, original Q136)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q236', N'Em relação ao histograma, uma distribuição concentrada à direita indica, normalmente,', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'predominância de tons escuros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'predominância de tons claros.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fotografia desfocada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'baixa resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'profundidade de campo reduzida.', 0);

    -- QUESTÃO 237 (arquivo quest16.txt, original Q137)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q237', N'O principal objetivo da calibração periódica do monitor é', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o brilho máximo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'garantir reprodução consistente das cores durante a análise e edição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o tamanho dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a velocidade do computador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'melhorar o foco automático.', 0);

    -- QUESTÃO 238 (arquivo quest16.txt, original Q138)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q238', N'Na macrofotografia em escala 1:1, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o objeto é projetado no sensor em tamanho real.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a imagem é reduzida à metade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'não ocorre perda de luminosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'não há necessidade de foco preciso.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a objetiva passa a funcionar como teleobjetiva.', 0);

    -- QUESTÃO 239 (arquivo quest16.txt, original Q139)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q239', N'Em uma fotografia realizada sob iluminação fluorescente, utilizando balanço de branco ajustado para luz de tungstênio, é esperado que', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'as cores apresentem dominante inadequada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a resolução aumente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o ISO seja reduzido automaticamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a distância focal seja alterada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a profundidade de campo aumente.', 0);

    -- QUESTÃO 240 (arquivo quest16.txt, original Q140)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q240', N'Na documentação fotográfica pericial, a confiabilidade das imagens depende, entre outros fatores,', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'exclusivamente da quantidade de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apenas do uso de objetivas profissionais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da correta técnica fotográfica aliada à preservação da integridade dos arquivos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas da utilização de flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'exclusivamente do formato RAW.', 0);

    -- QUESTÃO 241 (arquivo quest17.txt, original Q141)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q241', N'Durante a fotografia de uma arma de fogo apreendida, o fotógrafo pretende registrar todos os detalhes da inscrição existente no cano, mantendo elevada nitidez em toda a extensão da peça. A configuração mais adequada é', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'grande abertura do diafragma (f/1,8).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diafragma fechado, aumentando a profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO máximo disponível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'zoom digital máximo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'obturador em modo Bulb.', 0);

    -- QUESTÃO 242 (arquivo quest17.txt, original Q142)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q242', N'Ao utilizar uma objetiva de 24 mm para fotografar um ambiente interno, é esperado que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o campo de visão seja amplo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ocorra forte compressão da perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a objetiva funcione como teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o ângulo de visão seja inferior ao de uma objetiva de 85 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a profundidade de campo seja sempre reduzida.', 0);

    -- QUESTÃO 243 (arquivo quest17.txt, original Q143)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q243', N'Na fotografia digital, a função dos fotodiodos presentes no sensor é', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'armazenar os arquivos RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'captar a luz incidente e convertê-la em sinais elétricos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar a abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'realizar o foco automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a distância focal.', 0);

    -- QUESTÃO 244 (arquivo quest17.txt, original Q144)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q244', N'Em uma fotografia corretamente exposta, deseja-se aumentar a profundidade de campo sem alterar a exposição. Uma solução possível consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fechar o diafragma e reduzir proporcionalmente a velocidade do obturador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'abrir o diafragma e aumentar a velocidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar apenas o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar zoom digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o balanço de branco.', 0);

    -- QUESTÃO 245 (arquivo quest17.txt, original Q145)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q245', N'A utilização de uma objetiva macro de 100 mm, quando comparada a uma objetiva macro de 50 mm na mesma ampliação, proporciona, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'menor distância de trabalho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'maior distância de trabalho.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'menor nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'menor ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'menor profundidade de bits.', 0);

    -- QUESTÃO 246 (arquivo quest17.txt, original Q146)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q246', N'Ao fotografar um documento utilizando tripé e temporizador, o uso do temporizador tem como principal finalidade', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir vibrações provocadas pelo acionamento do obturador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir a potência do flash.', 0);

    -- QUESTÃO 247 (arquivo quest17.txt, original Q147)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q247', N'Uma câmera registra fotografias em RAW de 14 bits. Comparativamente a um arquivo de 12 bits, espera-se, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'menor quantidade de informações tonais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'maior capacidade de representar transições suaves de tonalidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'redução da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diminuição da latitude dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'menor tamanho de arquivo.', 0);

    -- QUESTÃO 248 (arquivo quest17.txt, original Q148)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q248', N'Na fotografia pericial de um objeto plano, recomenda-se posicionar o sensor da câmera', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'inclinado em relação ao objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'paralelo ao plano do objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'obrigatoriamente a 45 graus.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'perpendicular apenas quando houver flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'em qualquer posição.', 0);

    -- QUESTÃO 249 (arquivo quest17.txt, original Q149)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q249', N'O filtro UV, nas câmeras digitais atuais, é utilizado principalmente para', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'proteger o elemento frontal da objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a saturação do céu.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir o polarizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir três pontos de luz.', 0);

    -- QUESTÃO 250 (arquivo quest17.txt, original Q150)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q250', N'Em uma objetiva marcada como 70–200 mm f/2.8, a indicação "f/2.8" refere-se', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao número de elementos ópticos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'à abertura máxima da objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao diâmetro do filtro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao peso da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao ângulo de visão.', 0);

    -- QUESTÃO 251 (arquivo quest17.txt, original Q151)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q251', N'Na fotografia de vestígios com superfície altamente brilhante, uma técnica eficiente para minimizar reflexos consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar iluminação difusa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar apenas ISO elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar somente flash direto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir o número de megapixels.', 0);

    -- QUESTÃO 252 (arquivo quest17.txt, original Q152)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q252', N'Uma fotografia apresenta sombras sem detalhes, enquanto as altas luzes permanecem preservadas. Esse resultado indica, principalmente,', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'superexposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'subexposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'excesso de saturação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'erro de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'banding.', 0);

    -- QUESTÃO 253 (arquivo quest17.txt, original Q153)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q253', N'A principal vantagem da estabilização óptica da imagem é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'permitir fotografar com velocidades mais lentas, reduzindo o efeito da trepidação da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar automaticamente o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'corrigir distorções geométricas.', 0);

    -- QUESTÃO 254 (arquivo quest17.txt, original Q154)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q254', N'Em relação ao Adobe RGB, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'possui gama de cores, em geral, mais ampla que o sRGB.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'é incompatível com impressões.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'substitui os arquivos RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'elimina a necessidade de calibração do monitor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduz automaticamente o tamanho dos arquivos.', 0);

    -- QUESTÃO 255 (arquivo quest17.txt, original Q155)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q255', N'Ao fotografar um vestígio utilizando flash dedicado, a sincronização incorreta entre flash e obturador pode resultar em', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'perda parcial da iluminação registrada na imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento automático do ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alteração da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da resolução.', 0);

    -- QUESTÃO 256 (arquivo quest17.txt, original Q156)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q256', N'O principal objetivo do foco manual em determinadas situações periciais é', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permitir maior precisão quando o foco automático apresenta dificuldades.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar a temperatura de cor.', 0);

    -- QUESTÃO 257 (arquivo quest17.txt, original Q157)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q257', N'Na documentação fotográfica de um local de crime, recomenda-se evitar edições que alterem o conteúdo da imagem porque', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'podem comprometer a autenticidade e o valor documental do registro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzem o número de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'diminuem a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alteram a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentam o ruído do sensor.', 0);

    -- QUESTÃO 258 (arquivo quest17.txt, original Q158)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q258', N'Ao utilizar uma teleobjetiva de longa distância focal, é esperado que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o campo de visão diminua.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o campo de visão aumente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a perspectiva dependa exclusivamente da lente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a temperatura de cor seja alterada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o sensor passe a captar mais megapixels.', 0);

    -- QUESTÃO 259 (arquivo quest17.txt, original Q159)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q259', N'Em relação ao histograma, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ele permite avaliar a distribuição tonal da fotografia, mas não substitui a análise visual da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'informa automaticamente a distância focal utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'mede exclusivamente o contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substitui o fotômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'determina a resolução do sensor.', 0);

    -- QUESTÃO 260 (arquivo quest17.txt, original Q160)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q260', N'Na fotografia técnico-pericial, a qualidade do registro depende da combinação de fatores como', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'técnica fotográfica, correta exposição, escolha adequada da objetiva e preservação dos arquivos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apenas quantidade de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apenas formato RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas utilização de flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apenas calibração do monitor.', 0);

    -- QUESTÃO 261 (arquivo quest18.txt, original Q161)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q261', N'Durante a fotografia de um vestígio muito pequeno, o fotógrafo pretende obter a maior ampliação possível sem substituir a objetiva macro instalada. O acessório mais indicado é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'filtro UV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'tubo extensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'filtro ND.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'para-sol (lens hood).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'disparador remoto.', 0);

    -- QUESTÃO 262 (arquivo quest18.txt, original Q162)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q262', N'Uma objetiva de 85 mm é geralmente mais indicada para retratos porque', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apresenta ângulo de visão extremamente amplo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'tende a produzir perspectiva agradável quando utilizada a uma distância adequada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'elimina completamente distorções ópticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'possui profundidade de campo obrigatoriamente maior que uma objetiva de 35 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente pode ser utilizada em câmeras full frame.', 0);

    -- QUESTÃO 263 (arquivo quest18.txt, original Q163)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q263', N'Durante uma fotografia em RAW, o fotógrafo percebe pequena subexposição. Em comparação ao JPEG, o RAW oferece maior possibilidade de', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'recuperar detalhes das sombras com menor perda de qualidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar os megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'modificar o foco após a captura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar automaticamente o ruído.', 0);

    -- QUESTÃO 264 (arquivo quest18.txt, original Q164)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q264', N'Uma câmera digital apresenta resolução de 6000 × 4000 pixels. O número aproximado de megapixels é', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'12 MP.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'18 MP.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'24 MP.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'30 MP.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'36 MP.', 0);

    -- QUESTÃO 265 (arquivo quest18.txt, original Q165)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q265', N'Ao utilizar uma objetiva olho-de-peixe, espera-se obter', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pequeno campo de visão e ausência de distorções.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'campo de visão extremamente amplo com distorção característica.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'grande ampliação para macrofotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'compressão intensa da perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'profundidade de campo sempre reduzida.', 0);

    -- QUESTÃO 266 (arquivo quest18.txt, original Q166)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q266', N'A função principal do para-sol (lens hood) é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a luminosidade da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a entrada de luz lateral indesejada, diminuindo flare e perda de contraste.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'proteger o sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a distância focal.', 0);

    -- QUESTÃO 267 (arquivo quest18.txt, original Q167)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q267', N'Em uma fotografia com predominância de tons muito claros, a fotometria automática pode tender a', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'escurecer a imagem em relação à cena real.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar automaticamente a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o espaço de cor.', 0);

    -- QUESTÃO 268 (arquivo quest18.txt, original Q168)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q268', N'Ao fotografar um objeto totalmente preto sobre fundo branco, utilizando apenas a fotometria matricial, é possível que a câmera', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'registre obrigatoriamente uma exposição perfeita.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'tente transformar a média tonal em cinza médio, exigindo compensação de exposição em algumas situações.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'altere automaticamente a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumente a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'elimine o contraste da cena.', 0);

    -- QUESTÃO 269 (arquivo quest18.txt, original Q169)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q269', N'O principal objetivo do cartão cinza de 18% é', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fornecer referência para exposição e, em muitos casos, para o balanço de branco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'substituir o fotômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'corrigir aberrações cromáticas.', 0);

    -- QUESTÃO 270 (arquivo quest18.txt, original Q170)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q270', N'Na fotografia digital, o ruído eletrônico tende a ser mais perceptível quando se utiliza', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO elevado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO baixo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'filtro polarizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'tripé.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'objetiva macro.', 0);

    -- QUESTÃO 271 (arquivo quest18.txt, original Q171)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q271', N'Uma fotografia apresenta todas as áreas importantes nítidas, desde o primeiro plano até o fundo. Esse resultado está relacionado principalmente à', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzida profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'elevada profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'baixa resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alta temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilização de zoom digital.', 0);

    -- QUESTÃO 272 (arquivo quest18.txt, original Q172)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q272', N'Na macrofotografia, a profundidade de campo costuma ser', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'muito ampla.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzida, exigindo maior cuidado com o foco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'independente da abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'determinada apenas pelo ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'maior que na fotografia convencional em qualquer situação.', 0);

    -- QUESTÃO 273 (arquivo quest18.txt, original Q173)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q273', N'Ao utilizar um filtro polarizador circular, o fotógrafo normalmente observa', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diminuição de reflexos e aumento da saturação em determinadas condições.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alteração da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminação completa das sombras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento automático da potência do flash.', 0);

    -- QUESTÃO 274 (arquivo quest18.txt, original Q174)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q274', N'A principal vantagem da gravação simultânea em RAW + JPEG é', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'eliminar a necessidade de pós-processamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'disponibilizar um arquivo pronto para uso e outro com maior flexibilidade de edição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o espaço ocupado no cartão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'dobrar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'impedir alterações futuras.', 0);

    -- QUESTÃO 275 (arquivo quest18.txt, original Q175)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q275', N'Ao fotografar em formato JPEG com compressão elevada, é esperado que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a qualidade da imagem permaneça sempre inalterada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ocorram perdas de informação devido ao algoritmo de compressão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumente a profundidade de bits.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumente a latitude dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o arquivo se torne equivalente ao RAW.', 0);

    -- QUESTÃO 276 (arquivo quest18.txt, original Q176)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q276', N'Durante uma sequência de disparos contínuos em RAW, o fator que normalmente limita a duração da sequência é', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a capacidade do buffer.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o espaço de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a distância focal.', 0);

    -- QUESTÃO 277 (arquivo quest18.txt, original Q177)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q277', N'Na fotografia pericial, a utilização de tripé apresenta como principal vantagem', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a quantidade de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'proporcionar maior estabilidade e repetibilidade dos registros.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar automaticamente a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar completamente a necessidade de iluminação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'corrigir distorções ópticas.', 0);

    -- QUESTÃO 278 (arquivo quest18.txt, original Q178)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q278', N'Durante uma perícia, um fotógrafo registra imagens em RAW e realiza apenas ajustes globais de exposição e balanço de branco, sem modificar o conteúdo da cena. Essa conduta é, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'compatível com um fluxo técnico, desde que preserve a integridade e a rastreabilidade dos arquivos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'proibida em qualquer hipótese.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'equivalente à manipulação do conteúdo da prova.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'suficiente para dispensar os arquivos originais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'incompatível com fotografia digital.', 0);

    -- QUESTÃO 279 (arquivo quest18.txt, original Q179)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q279', N'Ao comparar sensores de mesmo tamanho físico, um sensor com quantidade muito maior de megapixels pode apresentar, em determinadas condições,', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fotodiodos menores, o que pode influenciar o desempenho em baixa luminosidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'maior distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'menor profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'maior ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'maior potência do flash.', 0);

    -- QUESTÃO 280 (arquivo quest18.txt, original Q180)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q280', N'Em fotografia técnico-pericial, a escolha do equipamento deve priorizar', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas a marca do fabricante.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'exclusivamente a maior resolução disponível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a capacidade de produzir registros tecnicamente confiáveis, reproduzíveis e compatíveis com a finalidade pericial.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas objetivas de grande abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'exclusivamente equipamentos mirrorless.', 0);

    -- QUESTÃO 281 (arquivo quest19.txt, original Q181)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q281', N'Durante uma perícia, o fotógrafo pretende registrar um vestígio de pequenas dimensões utilizando uma objetiva macro em escala 1:1. Nessa situação, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o objeto será projetado no sensor com metade do seu tamanho real.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'não haverá perda de luminosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o objeto será projetado no sensor com tamanho real.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a objetiva funcionará como uma teleobjetiva comum.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a profundidade de campo será obrigatoriamente ampla.', 0);

    -- QUESTÃO 282 (arquivo quest19.txt, original Q182)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q282', N'Em relação à profundidade de campo, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Quanto maior a abertura do diafragma, maior será a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O ISO determina diretamente a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas a distância focal interfere na profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A profundidade de campo depende, entre outros fatores, da abertura, da distância focal e da distância até o assunto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O formato do arquivo (RAW ou JPEG) altera a profundidade de campo.', 0);

    -- QUESTÃO 283 (arquivo quest19.txt, original Q183)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q283', N'Durante a documentação de um local de crime, o fotógrafo percebe que a câmera demorará alguns segundos para concluir a gravação da sequência de disparos em RAW. Esse comportamento está relacionado principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao histograma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à capacidade do buffer e à velocidade de gravação do cartão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao tipo de objetiva utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao espaço de cor selecionado.', 0);

    -- QUESTÃO 284 (arquivo quest19.txt, original Q184)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q284', N'O formato TIFF é frequentemente utilizado porque', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utiliza apenas compressão com perdas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'oferece boa qualidade para arquivamento e edição, podendo inclusive não utilizar compressão com perdas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'é incompatível com softwares profissionais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'elimina a necessidade de metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'possui tamanho sempre inferior ao JPEG.', 0);

    -- QUESTÃO 285 (arquivo quest19.txt, original Q185)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q285', N'Uma objetiva catadióptrica caracteriza-se principalmente por', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar apenas elementos refrativos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'possuir distância focal variável.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar somente espelhos planos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'combinar lentes e espelhos na formação da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ser destinada exclusivamente à macrofotografia.', 0);

    -- QUESTÃO 286 (arquivo quest19.txt, original Q186)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q286', N'Ao utilizar um filtro ND de maior densidade, o fotógrafo poderá', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar tempos de exposição mais longos em ambientes iluminados.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar automaticamente a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar completamente os reflexos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir a distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a resolução do sensor.', 0);

    -- QUESTÃO 287 (arquivo quest19.txt, original Q187)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q287', N'Na fotografia digital, o principal objetivo do demosaicing é', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reconstruir a informação de cores a partir do padrão do sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a resolução da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'corrigir a perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substituir o balanço de branco.', 0);

    -- QUESTÃO 288 (arquivo quest19.txt, original Q188)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q288', N'Durante uma fotografia realizada sob iluminação fluorescente, utilizando balanço de branco configurado para luz do dia, é esperado que', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a resolução diminua.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a profundidade de campo aumente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a distância focal seja alterada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'as cores apresentem dominante inadequada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o histograma seja automaticamente corrigido.', 0);

    -- QUESTÃO 289 (arquivo quest19.txt, original Q189)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q289', N'Em relação ao formato RAW, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Sofre compressão com perdas obrigatoriamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Não permite ajustes de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Contém maior quantidade de informações captadas pelo sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Não armazena metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Possui tamanho sempre inferior ao JPEG.', 0);

    -- QUESTÃO 290 (arquivo quest19.txt, original Q190)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q290', N'Ao fotografar utilizando tripé e disparador remoto, a principal vantagem é', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir vibrações que poderiam comprometer a nitidez da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar automaticamente a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a potência do flash.', 0);

    -- QUESTÃO 291 (arquivo quest19.txt, original Q191)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q291', N'Uma objetiva de 16 mm, em uma câmera full frame, é normalmente classificada como', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ultra grande-angular.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'catadióptrica.', 0);

    -- QUESTÃO 292 (arquivo quest19.txt, original Q192)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q292', N'Ao comparar arquivos RAW e JPEG obtidos na mesma câmera, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ambos possuem exatamente a mesma quantidade de informações.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o JPEG normalmente resulta de processamento interno realizado pela câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o RAW elimina completamente a necessidade de pós-processamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o JPEG possui sempre maior latitude dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o RAW não registra informações de exposição.', 0);

    -- QUESTÃO 293 (arquivo quest19.txt, original Q193)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q293', N'Na documentação de vestígios, a utilização de uma objetiva grande-angular exige atenção porque', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduz obrigatoriamente a nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'impede o foco manual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'pode produzir distorções de perspectiva quando utilizada muito próxima ao objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumenta automaticamente o ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'elimina a profundidade de campo.', 0);

    -- QUESTÃO 294 (arquivo quest19.txt, original Q194)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q294', N'A principal função das microlentes existentes em muitos sensores digitais é', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'proteger os fotodiodos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o tamanho do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'direcionar mais luz aos fotodiodos, aumentando a eficiência luminosa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a velocidade do obturador.', 0);

    -- QUESTÃO 295 (arquivo quest19.txt, original Q195)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q295', N'Na fotografia pericial, uma exposição incorreta pode comprometer', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apenas o foco automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apenas o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas os metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a visualização adequada dos vestígios documentados.', 1);

    -- QUESTÃO 296 (arquivo quest19.txt, original Q196)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q296', N'O espaço de cor Adobe RGB apresenta como característica principal', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'menor gama de cores que o sRGB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'maior gama de cores em diversas regiões do espectro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'incompatibilidade com impressão profissional.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituição do formato RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'redução automática do tamanho do arquivo.', 0);

    -- QUESTÃO 297 (arquivo quest19.txt, original Q197)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q297', N'Ao utilizar uma objetiva zoom 70–200 mm ajustada para 200 mm, o fotógrafo obterá', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior campo de visão que em 70 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'menor aproximação do assunto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'campo de visão reduzido e maior ampliação aparente do assunto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento automático da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento obrigatório da profundidade de campo.', 0);

    -- QUESTÃO 298 (arquivo quest19.txt, original Q198)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q298', N'Em relação ao histograma, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'permite avaliar a distribuição tonal da imagem, mas não substitui a análise visual da fotografia.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'determina automaticamente o enquadramento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'mede a distância focal utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'informa exclusivamente a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'elimina a necessidade de fotometria.', 0);

    -- QUESTÃO 299 (arquivo quest19.txt, original Q199)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q299', N'Durante uma sequência de fotografias em RAW, o uso de um cartão de memória mais rápido tende a', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'permitir que o buffer seja liberado mais rapidamente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar o número de megapixels.', 0);

    -- QUESTÃO 300 (arquivo quest19.txt, original Q200)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q300', N'Na fotografia técnico-pericial, a finalidade primordial do registro fotográfico é', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'produzir imagens de elevado valor artístico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'registrar apenas os objetos de maior interesse visual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'substituir completamente o laudo pericial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir o tempo de investigação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'documentar fielmente os vestígios, preservando sua integridade e valor probatório.', 1);

    -- QUESTÃO 301 (arquivo quest20.txt, original Q201)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q301', N'Ao fotografar um vestígio utilizando uma objetiva macro na escala 2:1, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o objeto será registrado com metade do tamanho real no sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'não haverá necessidade de compensação da exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a profundidade de campo aumentará significativamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o objeto será projetado no sensor com tamanho duas vezes maior que o real.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a distância focal da objetiva será duplicada.', 0);

    -- QUESTÃO 302 (arquivo quest20.txt, original Q202)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q302', N'Durante a documentação fotográfica de uma arma de fogo, o fotógrafo pretende registrar simultaneamente a arma inteira e a numeração gravada no cano. O procedimento tecnicamente mais adequado consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'realizar apenas uma fotografia panorâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar exclusivamente uma teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar apenas uma fotografia macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'registrar apenas imagens em JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'realizar fotografias gerais, médias e de detalhe (macro), preservando a sequência documental.', 1);

    -- QUESTÃO 303 (arquivo quest20.txt, original Q203)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q303', N'Sobre o histograma, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Pode indicar perda de detalhes por subexposição ou superexposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Informa a distância focal utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Mede a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Corrige automaticamente a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Substitui completamente o fotômetro.', 0);

    -- QUESTÃO 304 (arquivo quest20.txt, original Q204)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q304', N'Ao utilizar uma objetiva de 400 mm, espera-se que a imagem apresente', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'menor ampliação aparente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'maior distorção olho-de-peixe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'menor campo de visão e maior aproximação aparente do assunto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'obrigatoriamente maior profundidade de campo.', 0);

    -- QUESTÃO 305 (arquivo quest20.txt, original Q205)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q305', N'O principal benefício do formato RAW é', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'gerar arquivos menores que JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'eliminar completamente o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'oferecer maior quantidade de informações para edição posterior.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'dispensar o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'impedir alterações futuras.', 0);

    -- QUESTÃO 306 (arquivo quest20.txt, original Q206)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q306', N'Na fotografia pericial, a utilização de uma escala métrica ao lado do vestígio tem como principal finalidade', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'melhorar a composição artística.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'corrigir a perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fornecer referência dimensional confiável.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir reflexos.', 0);

    -- QUESTÃO 307 (arquivo quest20.txt, original Q207)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q307', N'Em uma câmera digital, o aumento do ISO provoca, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diminuição da sensibilidade do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento da sensibilidade e possibilidade de maior ruído.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diminuição da abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração da temperatura de cor.', 0);

    -- QUESTÃO 308 (arquivo quest20.txt, original Q208)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q308', N'O filtro polarizador é especialmente indicado para', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminuir a distância mínima de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir reflexos em superfícies não metálicas e aumentar a saturação em determinadas situações.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a potência do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir o tamanho do arquivo.', 0);

    -- QUESTÃO 309 (arquivo quest20.txt, original Q209)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q309', N'Em relação ao buffer da câmera, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'armazena definitivamente as fotografias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'substitui o cartão de memória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controla o foco automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'funciona como memória temporária durante a captura contínua.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumenta a resolução das imagens.', 0);

    -- QUESTÃO 310 (arquivo quest20.txt, original Q210)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q310', N'Durante uma perícia realizada em ambiente escuro, utilizando tripé e assunto estático, a configuração que tende a proporcionar melhor qualidade de imagem é', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO elevado e velocidade rápida.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO baixo e tempo de exposição mais longo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'JPEG com compressão máxima.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'abertura máxima em qualquer situação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'zoom digital.', 0);

    -- QUESTÃO 311 (arquivo quest20.txt, original Q211)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q311', N'O principal objetivo do para-sol (lens hood) é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'proteger o sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a luminosidade da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'evitar a entrada de luz lateral indesejada, reduzindo flare e perda de contraste.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir o filtro UV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a distância focal.', 0);

    -- QUESTÃO 312 (arquivo quest20.txt, original Q212)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q312', N'Em sensores digitais, um hot pixel caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'permanecer permanentemente apagado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apresentar brilho excessivo, especialmente em longas exposições ou ISOs elevados.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'impedir o funcionamento do autofoco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o balanço de branco.', 0);

    -- QUESTÃO 313 (arquivo quest20.txt, original Q213)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q313', N'Ao utilizar uma objetiva grande-angular muito próxima ao objeto fotografado, pode ocorrer', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução da nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminação da perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'distorção de perspectiva, com exagero aparente das proporções.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'perda automática de resolução.', 0);

    -- QUESTÃO 314 (arquivo quest20.txt, original Q214)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q314', N'A principal vantagem da gravação simultânea em RAW + JPEG consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'dobrar a resolução da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir o espaço ocupado no cartão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar a necessidade de pós-processamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'permitir apenas edição profissional.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'disponibilizar um arquivo pronto para uso e outro com maior flexibilidade de edição.', 1);

    -- QUESTÃO 315 (arquivo quest20.txt, original Q215)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q315', N'Na fotografia digital, o processo de demosaicing tem por finalidade', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir a distorção geométrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reconstruir as informações de cor captadas pelo sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'corrigir aberrações cromáticas da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar ruído eletrônico.', 0);

    -- QUESTÃO 316 (arquivo quest20.txt, original Q216)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q316', N'Em uma fotografia corretamente exposta, o fotógrafo decide fechar o diafragma em dois pontos (stops). Para manter a mesma exposição, deverá', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o ISO obrigatoriamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar filtro polarizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar o tempo de exposição em dois pontos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o espaço de cor.', 0);

    -- QUESTÃO 317 (arquivo quest20.txt, original Q217)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q317', N'Na macrofotografia em escala 1:1, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o objeto é projetado no sensor com tamanho real.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'não ocorre perda de luminosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a profundidade de campo torna-se muito ampla.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o uso do foco deixa de ser importante.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a objetiva passa a funcionar como teleobjetiva.', 0);

    -- QUESTÃO 318 (arquivo quest20.txt, original Q218)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q318', N'A preservação dos arquivos originais produzidos durante uma perícia é importante porque', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduz o tamanho do backup.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'facilita a impressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'elimina a necessidade de laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'permite alterar livremente o conteúdo da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'contribui para preservar a autenticidade e o valor probatório do registro.', 1);

    -- QUESTÃO 319 (arquivo quest20.txt, original Q219)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q319', N'Ao comparar os espaços de cor sRGB e Adobe RGB, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ambos possuem exatamente a mesma gama de cores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o sRGB possui gama mais ampla que o Adobe RGB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o Adobe RGB, em regra, possui gama de cores mais ampla.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o Adobe RGB somente pode ser utilizado em arquivos RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o espaço de cor altera a resolução da fotografia.', 0);

    -- QUESTÃO 320 (arquivo quest20.txt, original Q220)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q320', N'Durante a documentação de um local de crime, um fotógrafo altera digitalmente o conteúdo de uma imagem para remover um objeto considerado "sem importância". Sob a ótica da fotografia técnico-pericial, essa conduta é', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'recomendada para melhorar a composição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aceitável, desde que o arquivo seja salvo em RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'irrelevante, pois não altera o laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'permitida apenas em fotografias de detalhe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'incompatível com os princípios da documentação pericial, pois compromete a autenticidade do registro.', 1);

    -- QUESTÃO 321 (arquivo quest21.txt, original Q221)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q321', N'Durante a documentação de uma impressão papilar revelada sobre uma superfície brilhante, o fotógrafo observa intensa reflexão especular, dificultando a visualização das cristas papilares. Mantendo a posição da câmera, a medida mais adequada para minimizar esse problema consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'substituir a objetiva macro por uma teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar o ISO para reduzir o tempo de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar iluminação difusa e, quando tecnicamente possível, filtro polarizador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar o formato do arquivo para JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a resolução da câmera.', 0);

    -- QUESTÃO 322 (arquivo quest21.txt, original Q222)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q322', N'Uma câmera registra arquivos RAW de 14 bits. Comparada ao registro em 12 bits, essa configuração proporciona, principalmente,', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior capacidade de representar variações tonais sutis.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento da distância focal efetiva da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'maior profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução automática do ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminação da necessidade de fotometria.', 0);

    -- QUESTÃO 323 (arquivo quest21.txt, original Q223)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q323', N'Durante uma perícia em ambiente fechado, o fotógrafo pretende fotografar um vestígio utilizando abertura f/16 para maximizar a profundidade de campo. Considerando que a iluminação ambiente é insuficiente, a solução tecnicamente mais adequada é', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar zoom digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'combinar tripé e aumento do tempo de exposição, quando a cena permitir.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar o espaço de cor para Adobe RGB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar somente JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir a resolução da câmera.', 0);

    -- QUESTÃO 324 (arquivo quest21.txt, original Q224)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q324', N'Ao comparar duas objetivas de mesma distância focal, sendo uma f/1.4 e outra f/4, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ambas transmitem exatamente a mesma quantidade de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a objetiva f/4 possui maior abertura física.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a objetiva f/1.4 permite maior entrada de luz e menor profundidade de campo, em igualdade das demais condições.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a objetiva f/1.4 produz obrigatoriamente maior nitidez em qualquer abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apenas a objetiva f/4 pode ser utilizada em fotografia pericial.', 0);

    -- QUESTÃO 325 (arquivo quest21.txt, original Q225)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q325', N'Em relação ao EXIF, ao IPTC e ao XMP, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Os três armazenam exclusivamente informações de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O EXIF normalmente registra dados técnicos da captura, enquanto IPTC e XMP podem armazenar informações descritivas e administrativas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas o IPTC acompanha arquivos RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O XMP substitui completamente o EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Nenhum deles pode ser preservado após edição da imagem.', 0);

    -- QUESTÃO 326 (arquivo quest21.txt, original Q226)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q326', N'Durante uma sequência contínua em RAW, o fotógrafo percebe que a velocidade de disparo diminui após alguns segundos, embora ainda exista espaço livre no cartão de memória. A explicação tecnicamente mais provável é', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'saturação temporária do buffer da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alteração automática da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'superaquecimento obrigatório do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução automática dos megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'mudança do balanço de branco.', 0);

    -- QUESTÃO 327 (arquivo quest21.txt, original Q227)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q327', N'Na fotografia pericial, uma objetiva grande-angular utilizada muito próxima ao vestígio pode provocar', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diminuição obrigatória da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento da distância mínima de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'compressão da perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'exagero da perspectiva e alteração aparente das proporções.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'perda automática do foco.', 0);

    -- QUESTÃO 328 (arquivo quest21.txt, original Q228)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q328', N'Durante a fotografia de um documento parcialmente carbonizado, o objetivo principal da iluminação utilizada deve ser', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'produzir sombras intensas para aumentar o contraste visual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'preservar a legibilidade e evidenciar detalhes sem mascarar informações relevantes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a temperatura de cor da cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar completamente qualquer sombra.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar exclusivamente flash frontal.', 0);

    -- QUESTÃO 329 (arquivo quest21.txt, original Q229)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q329', N'Na macrofotografia em escala 2:1, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a imagem formada no sensor possui metade do tamanho do objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a ampliação corresponde ao dobro do tamanho real do objeto no sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'não ocorre perda de luminosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a profundidade de campo aumenta em relação à escala 1:1.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a objetiva deixa de funcionar em foco automático obrigatoriamente.', 0);

    -- QUESTÃO 330 (arquivo quest21.txt, original Q230)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q330', N'Sobre a regra prática de backup 3-2-1, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Consiste em manter três cópias dos dados, em dois tipos diferentes de mídia, sendo uma delas armazenada em local distinto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Exige obrigatoriamente três HDs externos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Dispensa armazenamento externo quando utilizado RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'É aplicável apenas a vídeos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Foi substituída pelos sistemas em nuvem.', 0);

    -- QUESTÃO 331 (arquivo quest21.txt, original Q231)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q331', N'Ao comparar um sensor Full Frame com um sensor APS-C de mesma tecnologia e mesma resolução, é correto afirmar que, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o APS-C sempre apresentará menor ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o Full Frame tende a oferecer melhor desempenho em baixa luminosidade, desde que os demais fatores sejam equivalentes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ambos apresentam obrigatoriamente o mesmo fator de corte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a profundidade de bits depende apenas do tamanho físico do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o tamanho do sensor determina automaticamente a resolução final da imagem.', 0);

    -- QUESTÃO 332 (arquivo quest21.txt, original Q232)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q332', N'Durante uma perícia de acidente de trânsito, o fotógrafo precisa registrar a posição relativa entre os veículos e os vestígios existentes na pista. A conduta tecnicamente mais adequada é', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'registrar apenas fotografias de detalhe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'iniciar pelos detalhes e finalizar com as panorâmicas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'realizar apenas fotografias em macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'iniciar por fotografias gerais, evoluindo para médias e detalhes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar exclusivamente drone.', 0);

    -- QUESTÃO 333 (arquivo quest21.txt, original Q233)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q333', N'O fenômeno conhecido como flare ocorre, principalmente,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pela reflexão interna da luz entre elementos ópticos da objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'por excesso de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'devido ao uso de ISO elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'exclusivamente em objetivas zoom.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apenas em sensores CCD.', 0);

    -- QUESTÃO 334 (arquivo quest21.txt, original Q234)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q334', N'Uma fotografia apresenta histograma concentrado à esquerda, sem perda significativa de detalhes. Isso indica, predominantemente,', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'superexposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'predominância de tons escuros.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'excesso de saturação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'erro de balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'foco incorreto.', 0);

    -- QUESTÃO 335 (arquivo quest21.txt, original Q235)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q335', N'Durante a análise de uma fotografia, verifica-se que determinadas áreas claras perderam completamente sua textura, formando regiões sem informação recuperável. Esse fenômeno é denominado', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aliasing.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'clipping nas altas luzes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'vinhetagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'moiré.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'banding.', 0);

    -- QUESTÃO 336 (arquivo quest21.txt, original Q236)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q336', N'A utilização de um disparador remoto tem como principal finalidade', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alterar automaticamente o foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir vibrações provocadas pelo acionamento manual da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a potência do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir o ruído eletrônico.', 0);

    -- QUESTÃO 337 (arquivo quest21.txt, original Q237)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q337', N'Em relação às objetivas catadióptricas, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizam exclusivamente lentes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'são normalmente empregadas em macrofotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'possuem distância focal variável.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'combinam espelhos e lentes para formação da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminam completamente as aberrações ópticas.', 0);

    -- QUESTÃO 338 (arquivo quest21.txt, original Q238)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q338', N'Ao utilizar um filtro ND de 3 pontos (ND8), o fotógrafo pretende, principalmente,', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir a intensidade luminosa que atinge o sensor sem alterar significativamente as cores.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a saturação da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'corrigir aberrações cromáticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar reflexos em superfícies não metálicas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a profundidade de bits.', 0);

    -- QUESTÃO 339 (arquivo quest21.txt, original Q239)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q339', N'Na documentação fotográfica pericial, a edição destinada a remover elementos existentes originalmente na cena é', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'recomendada para melhorar a composição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aceitável desde que realizada em RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'indiferente para fins probatórios.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'permitida quando não houver testemunhas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'incompatível com a preservação da autenticidade do registro.', 1);

    -- QUESTÃO 340 (arquivo quest21.txt, original Q240)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q340', N'Ao fotografar um vestígio utilizando foco manual, tripé, iluminação controlada e disparador remoto, o fotógrafo busca, principalmente,', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir o tamanho do arquivo RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a velocidade de gravação do cartão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'maximizar a precisão técnica e a reprodutibilidade do registro fotográfico.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar completamente qualquer ruído eletrônico.', 0);

    -- QUESTÃO 341 (arquivo quest22.txt, original Q241)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q341', N'Durante a documentação de um projétil deformado, o fotógrafo utiliza uma objetiva macro em f/22 buscando máxima profundidade de campo. Apesar disso, a imagem apresenta leve perda de nitidez geral. A explicação tecnicamente mais adequada é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o aumento do ISO provoca obrigatoriamente difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'objetivas macro não permitem utilização de f/22.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a difração pode reduzir a nitidez em aberturas muito pequenas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o foco automático sempre falha em f/22.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a profundidade de campo diminui em aberturas pequenas.', 0);

    -- QUESTÃO 342 (arquivo quest22.txt, original Q242)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q342', N'Um fotógrafo registra uma cena em RAW e observa clipping apenas no canal vermelho do histograma RGB. Essa informação indica que', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'houve perda de informação apenas nos tons escuros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o canal vermelho atingiu saturação antes dos demais canais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'toda a fotografia está inutilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'obrigatoriamente o balanço de branco está correto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ocorreu erro de foco.', 0);

    -- QUESTÃO 343 (arquivo quest22.txt, original Q243)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q343', N'Na documentação de um documento antigo, a utilização de iluminação rasante tem como principal objetivo', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir a resolução da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'evidenciar relevos, sulcos e deformações superficiais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar completamente as sombras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a profundidade de campo.', 0);

    -- QUESTÃO 344 (arquivo quest22.txt, original Q244)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q344', N'Ao comparar uma objetiva 50 mm f/1.4 com uma 50 mm f/2.8, ambas ajustadas para f/4, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a objetiva originalmente f/1.4 necessariamente produzirá imagem mais clara.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ambas receberão a mesma quantidade de luz, considerando a mesma exposição e transmissão ideal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a objetiva f/2.8 terá maior ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a objetiva f/1.4 sempre apresentará menor nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente a objetiva f/2.8 poderá focar no infinito.', 0);

    -- QUESTÃO 345 (arquivo quest22.txt, original Q245)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q345', N'Durante uma sequência contínua de fotografias em RAW, um cartão UHS-II tende a oferecer vantagem sobre um cartão mais lento porque', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumenta os megapixels do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduz a distância focal efetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'altera o espaço de cor automaticamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'acelera a gravação dos arquivos, liberando o buffer mais rapidamente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'elimina completamente o atraso entre disparos.', 0);

    -- QUESTÃO 346 (arquivo quest22.txt, original Q246)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q346', N'Na fotografia técnico-pericial, preservar o arquivo RAW original é importante porque ele', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'impede qualquer tipo de edição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'contém a maior quantidade de informações registradas na captura original.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'substitui integralmente a cadeia de custódia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'elimina a necessidade de laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'possui sempre validade jurídica superior ao JPEG.', 0);

    -- QUESTÃO 347 (arquivo quest22.txt, original Q247)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q347', N'Uma objetiva tilt-shift diferencia-se das objetivas convencionais por permitir, entre outras funções,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'alterar mecanicamente o plano focal e controlar a perspectiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar automaticamente a profundidade de bits.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'modificar a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir objetivas macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar aberrações cromáticas.', 0);

    -- QUESTÃO 348 (arquivo quest22.txt, original Q248)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q348', N'Ao fotografar um vestígio metálico altamente polido utilizando flash direto, a principal consequência esperada é', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diminuição da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução do ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aparecimento de reflexos intensos capazes de ocultar detalhes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alteração automática da temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da profundidade de campo.', 0);

    -- QUESTÃO 349 (arquivo quest22.txt, original Q249)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q349', N'O fenômeno denominado banding caracteriza-se principalmente por', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aparecimento de padrões ou faixas visíveis em transições tonais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'perda definitiva de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alteração da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento da latitude dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'surgimento de hot pixels.', 0);

    -- QUESTÃO 350 (arquivo quest22.txt, original Q250)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q350', N'Na fotografia pericial, a escolha entre foco manual e automático deve considerar principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas a marca da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'exclusivamente a distância focal utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a situação prática, priorizando o método que proporcione maior precisão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o espaço de cor selecionado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apenas o formato do arquivo.', 0);

    -- QUESTÃO 351 (arquivo quest22.txt, original Q251)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q351', N'Em sensores digitais modernos, a tecnologia BSI CMOS apresenta como característica principal', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar exclusivamente espelhos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'posicionar a fiação atrás da camada fotossensível, aumentando a eficiência de captação luminosa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar completamente o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir o filtro Bayer.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'impedir o aparecimento de hot pixels.', 0);

    -- QUESTÃO 352 (arquivo quest22.txt, original Q252)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q352', N'Ao utilizar uma objetiva de 14 mm muito próxima de um objeto, o fotógrafo deve estar atento porque', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'poderá ocorrer exagero de perspectiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a resolução diminuirá obrigatoriamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'haverá compressão da perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ocorrerá redução automática da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a objetiva deixará de focar.', 0);

    -- QUESTÃO 353 (arquivo quest22.txt, original Q253)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q353', N'Na fotografia de um vestígio biológico, a iluminação mais adequada deve priorizar', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'efeitos estéticos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'máxima saturação das cores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'preservação da fidelidade das características observadas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'contraste extremo em qualquer situação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilização obrigatória de flash frontal.', 0);

    -- QUESTÃO 354 (arquivo quest22.txt, original Q254)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q354', N'Em relação aos metadados EXIF, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'normalmente registram parâmetros técnicos da captura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'armazenam apenas informações administrativas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'não podem acompanhar arquivos JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituem o IPTC.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'registram exclusivamente dados de GPS.', 0);

    -- QUESTÃO 355 (arquivo quest22.txt, original Q255)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q355', N'Na documentação de uma cena pericial, o enquadramento deve ser escolhido de forma a', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'privilegiar exclusivamente a estética da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'destacar apenas o vestígio principal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'registrar somente detalhes microscópicos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'preservar a relação espacial entre os vestígios e o ambiente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'evitar fotografias panorâmicas.', 0);

    -- QUESTÃO 356 (arquivo quest22.txt, original Q256)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q356', N'Durante uma longa exposição, o recurso de levantamento prévio do espelho (Mirror Lock- Up), quando disponível, tem como principal finalidade', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar os megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir vibrações mecânicas provocadas pelo movimento do espelho.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'corrigir distorções ópticas.', 0);

    -- QUESTÃO 357 (arquivo quest22.txt, original Q257)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q357', N'Na fotografia digital, o moiré ocorre principalmente quando', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'padrões repetitivos finos interagem com a estrutura de amostragem do sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o ISO está muito elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ocorre clipping.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'há excesso de profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utiliza-se filtro polarizador.', 0);

    -- QUESTÃO 358 (arquivo quest22.txt, original Q258)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q358', N'Ao fotografar uma impressão digital com objetiva macro, o uso de disparador remoto associado ao tripé contribui principalmente para', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a ampliação óptica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir vibrações durante a captura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'modificar a escala de reprodução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a sensibilidade ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o fator de corte do sensor.', 0);

    -- QUESTÃO 359 (arquivo quest22.txt, original Q259)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q359', N'Em uma perícia fotográfica, o registro em sequência "visão geral → média distância → detalhe" justifica-se porque', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduz o tamanho dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'melhora a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'permite compreender progressivamente o contexto e a localização dos vestígios.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'elimina a necessidade de croquis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduz a profundidade de campo.', 0);

    -- QUESTÃO 360 (arquivo quest22.txt, original Q260)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q360', N'Ao final de uma documentação fotográfica pericial, a conferência imediata das imagens capturadas tem como principal objetivo', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'verificar se os registros apresentam qualidade técnica suficiente e, se necessário, repetir a captura ainda no local.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar os metadados EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar o formato RAW para TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir o tamanho dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar ruído eletrônico automaticamente.', 0);

    -- QUESTÃO 361 (arquivo quest23.txt, original Q261)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q361', N'Durante a fotografia de um projétil para confronto balístico, o perito pretende registrar simultaneamente a base e a ogiva com elevada nitidez. Considerando apenas a profundidade de campo, a medida mais eficiente é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar ISO máximo disponível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a distância focal da objetiva sem alterar o enquadramento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar abertura maior (f/2.8).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'realizar empilhamento de foco (focus stacking), quando tecnicamente permitido e documentado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o espaço de cor para Adobe RGB.', 0);

    -- QUESTÃO 362 (arquivo quest23.txt, original Q262)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q362', N'Uma fotografia foi registrada em RAW apresentando clipping apenas nas altas luzes. Em relação à recuperação dessas informações, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o RAW pode permitir recuperação parcial, desde que a informação ainda exista nos dados capturados.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'toda região branca pode ser recuperada integralmente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'somente arquivos JPEG permitem essa recuperação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a recuperação depende exclusivamente do monitor utilizado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o espaço de cor define a possibilidade de recuperação.', 0);

    -- QUESTÃO 363 (arquivo quest23.txt, original Q263)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q363', N'Na fotografia pericial de um local de arrombamento, a principal finalidade das fotografias panorâmicas é', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'demonstrar a textura dos vestígios.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'registrar a relação espacial entre os elementos da cena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'medir automaticamente distâncias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir o croqui pericial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'evidenciar impressões papilares.', 0);

    -- QUESTÃO 364 (arquivo quest23.txt, original Q264)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q364', N'Ao comparar duas imagens produzidas pela mesma câmera, uma em ISO 100 e outra em ISO 3200, mantendo a mesma exposição final, espera-se, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior latitude dinâmica em ISO elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'menor ruído eletrônico em ISO elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'redução da resolução em ISO baixo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'maior probabilidade de ruído e menor alcance dinâmico na imagem obtida em ISO elevado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração da distância focal.', 0);

    -- QUESTÃO 365 (arquivo quest23.txt, original Q265)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q365', N'Na fotografia digital, a vinhetagem caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'perda de nitidez causada pelo foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aparecimento de faixas horizontais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'escurecimento gradual das bordas da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'distorção em barril.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração do balanço de branco.', 0);

    -- QUESTÃO 366 (arquivo quest23.txt, original Q266)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q366', N'Durante a documentação de um documento com relevo seco, a técnica de iluminação que tende a evidenciar melhor essas irregularidades é', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'iluminação frontal uniforme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'iluminação rasante.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'iluminação difusa proveniente de várias direções.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'flash rebatido no teto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento do ISO.', 0);

    -- QUESTÃO 367 (arquivo quest23.txt, original Q267)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q367', N'Uma objetiva apresenta distância mínima de foco de 30 cm. Isso significa que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'não poderá fotografar objetos além dessa distância.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'objetos mais próximos que essa distância dificilmente serão focalizados adequadamente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'produzirá sempre macro real.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sua distância focal é de 30 cm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sua ampliação máxima será obrigatoriamente 1:1.', 0);

    -- QUESTÃO 368 (arquivo quest23.txt, original Q268)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q368', N'Ao utilizar uma objetiva macro de 100 mm em vez de uma macro de 60 mm, mantendo a mesma ampliação, a principal vantagem prática costuma ser', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'maior profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'maior distância de trabalho entre a objetiva e o vestígio.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'menor perda de luminosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'menor peso do equipamento.', 0);

    -- QUESTÃO 369 (arquivo quest23.txt, original Q269)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q369', N'O principal objetivo do filtro passa-baixa óptico (anti-aliasing), presente em diversos sensores digitais, é', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir o efeito moiré e o aliasing.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir o ruído térmico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o fator de corte.', 0);

    -- QUESTÃO 370 (arquivo quest23.txt, original Q270)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q370', N'Durante uma perícia, uma fotografia apresenta excelente exposição, porém foco ligeiramente deslocado. Nessas condições,', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o problema poderá ser totalmente corrigido em qualquer software.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a imagem continuará tecnicamente adequada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a perda de foco pode comprometer o valor documental daquele registro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'bastará converter o arquivo para TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a nitidez digital recuperará integralmente os detalhes perdidos.', 0);

    -- QUESTÃO 371 (arquivo quest23.txt, original Q271)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q371', N'Na documentação de um vestígio biológico extremamente pequeno, a principal limitação óptica ao fechar excessivamente o diafragma é', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento do flare.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aparecimento da difração.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alteração da temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da compressão JPEG.', 0);

    -- QUESTÃO 372 (arquivo quest23.txt, original Q272)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q372', N'O fenômeno denominado "compressão da perspectiva" está relacionado principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao formato RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao sensor Full Frame.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao aumento da distância entre fotógrafo e assunto, normalmente associado ao uso de teleobjetivas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao espaço de cor Adobe RGB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao ISO elevado.', 0);

    -- QUESTÃO 373 (arquivo quest23.txt, original Q273)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q373', N'Em relação ao histograma RGB, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Um canal pode apresentar clipping enquanto os demais permanecem dentro da faixa tonal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Todos os canais sempre apresentam comportamento idêntico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O histograma RGB mede resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O histograma RGB substitui o fotômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O histograma RGB depende apenas da objetiva utilizada.', 0);

    -- QUESTÃO 374 (arquivo quest23.txt, original Q274)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q374', N'Na fotografia técnico-pericial, a utilização de zoom digital deve ser evitada principalmente porque', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduz a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'altera o EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduz a potência do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'normalmente amplia a imagem por processamento, sem acrescentar detalhes ópticos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'impede a gravação em RAW.', 0);

    -- QUESTÃO 375 (arquivo quest23.txt, original Q275)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q375', N'Durante a captura de um vestígio utilizando flash eletrônico, o sincronismo acima da velocidade máxima suportada pela câmera pode provocar', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'registro parcial da imagem iluminada pelo flash.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alteração do espaço de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'redução do ruído eletrônico.', 0);

    -- QUESTÃO 376 (arquivo quest23.txt, original Q276)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q376', N'A função principal do padrão Bayer presente na maioria dos sensores digitais é', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'organizar filtros de cores para permitir a reconstrução cromática da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir a compressão JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar aberrações ópticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substituir o balanço de branco.', 0);

    -- QUESTÃO 377 (arquivo quest23.txt, original Q277)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q377', N'Na documentação fotográfica de uma arma de fogo, a sequência tecnicamente mais adequada consiste em registrar', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas fotografias de detalhe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'exclusivamente imagens em macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fotografias gerais, médias e detalhes, preservando o contexto e as características individuais do objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas imagens da numeração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente fotografias panorâmicas.', 0);

    -- QUESTÃO 378 (arquivo quest23.txt, original Q278)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q378', N'Um fotógrafo pretende reduzir reflexos em um vidro sem alterar significativamente a exposição. O recurso mais indicado é', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'filtro UV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'filtro polarizador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'filtro ND64.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento do ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'conversão para preto e branco.', 0);

    -- QUESTÃO 379 (arquivo quest23.txt, original Q279)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q379', N'Na fotografia digital, o termo latitude de exposição refere-se, principalmente,', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'à capacidade do equipamento registrar detalhes úteis em diferentes níveis de luminosidade antes da perda de informação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao ângulo de visão da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao fator de corte do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao tempo de gravação do cartão.', 0);

    -- QUESTÃO 380 (arquivo quest23.txt, original Q280)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q380', N'Ao final de uma documentação pericial, a preservação dos arquivos originais juntamente com seus metadados contribui diretamente para', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o tamanho do backup.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a resolução das fotografias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar a cadeia de custódia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'preservar a autenticidade, rastreabilidade e confiabilidade dos registros produzidos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar a necessidade de laudo complementar.', 0);

    -- QUESTÃO 381 (arquivo quest24.txt, original Q281)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q381', N'Durante a documentação de um estojo deflagrado, o fotógrafo pretende obter máxima nitidez dos microsulcos produzidos pelo mecanismo da arma. Considerando exclusivamente a técnica fotográfica, a melhor combinação é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO elevado, flash direto e JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Objetiva grande-angular, abertura f/2 e foco automático contínuo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Teleobjetiva de 300 mm sem tripé.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Objetiva macro, tripé, disparador remoto e iluminação cuidadosamente controlada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Zoom digital máximo e ISO 6400.', 0);

    -- QUESTÃO 382 (arquivo quest24.txt, original Q282)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q382', N'Durante uma fotografia realizada em RAW, o fotógrafo aumenta a exposição em +2 EV na pós-produção. O resultado dependerá principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'da quantidade de informação efetivamente registrada pelo sensor na captura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'exclusivamente da potência do processador da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apenas da resolução em megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'somente do espaço de cor utilizado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apenas da objetiva empregada.', 0);

    -- QUESTÃO 383 (arquivo quest24.txt, original Q283)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q383', N'Uma objetiva apresenta excelente resolução no centro da imagem, mas perda perceptível de nitidez nas extremidades quando utilizada em abertura máxima. Esse comportamento', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'indica defeito obrigatório da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'é incompatível com objetivas profissionais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'pode ocorrer em diversas objetivas e costuma melhorar ao fechar moderadamente o diafragma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'depende exclusivamente do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ocorre apenas em objetivas macro.', 0);

    -- QUESTÃO 384 (arquivo quest24.txt, original Q284)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q384', N'Durante uma perícia, o fotógrafo utiliza uma teleobjetiva de longa distância focal para registrar um vestígio sem se aproximar da área isolada. Além da ampliação aparente, espera-se que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumente significativamente o ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a perspectiva aparente fique mais comprimida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumente automaticamente a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'desapareçam as aberrações ópticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumente a resolução do sensor.', 0);

    -- QUESTÃO 385 (arquivo quest24.txt, original Q285)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q385', N'Ao fotografar um documento plastificado sob iluminação intensa, a utilização simultânea de iluminação difusa e filtro polarizador tem como principal objetivo', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir reflexos que dificultam a leitura do documento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a velocidade de sincronismo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir o tamanho do arquivo.', 0);

    -- QUESTÃO 386 (arquivo quest24.txt, original Q286)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q386', N'Na fotografia digital, um pixel morto (dead pixel) caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apresentar brilho intenso apenas em longas exposições.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alterar automaticamente a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'permanecer permanentemente apagado, independentemente da iluminação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'surgir apenas em sensores CCD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar o ruído eletrônico.', 0);

    -- QUESTÃO 387 (arquivo quest24.txt, original Q287)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q387', N'Em uma cena com contraste extremamente elevado, a principal limitação física do sensor digital é', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'não conseguir registrar simultaneamente toda a faixa dinâmica quando ela excede sua capacidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alterar automaticamente a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'impedir o funcionamento do histograma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a profundidade de campo.', 0);

    -- QUESTÃO 388 (arquivo quest24.txt, original Q288)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q388', N'Na fotografia pericial, a utilização de escalas fotográficas junto ao vestígio NÃO tem como finalidade', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'permitir estimativas dimensionais posteriores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'preservar referência métrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'facilitar futuras análises comparativas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir medições periciais realizadas por outros métodos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'auxiliar na documentação técnica.', 0);

    -- QUESTÃO 389 (arquivo quest24.txt, original Q289)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q389', N'O fenômeno denominado ghosting diferencia-se do flare porque', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ocorre exclusivamente em sensores CCD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'normalmente produz imagens fantasmas decorrentes de reflexões internas mais definidas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduz automaticamente a nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'depende exclusivamente do ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'altera o balanço de branco.', 0);

    -- QUESTÃO 390 (arquivo quest24.txt, original Q290)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q390', N'Ao comparar sensores de mesma geração tecnológica, porém com diferentes tamanhos físicos, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sensores maiores tendem a captar mais luz quando mantidas condições equivalentes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sensores menores apresentam obrigatoriamente maior latitude dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'sensores Full Frame possuem sempre maior resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o tamanho físico não interfere em nenhum aspecto da captura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sensores APS-C eliminam completamente o ruído eletrônico.', 0);

    -- QUESTÃO 391 (arquivo quest24.txt, original Q291)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q391', N'Na fotografia de uma marca de ferramenta deixada em superfície metálica, o ajuste mais importante antes da captura costuma ser', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'escolher a iluminação que melhor evidencie as microestruturas do vestígio.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'selecionar Adobe RGB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar ISO máximo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar os megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar apenas JPEG.', 0);

    -- QUESTÃO 392 (arquivo quest24.txt, original Q292)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q392', N'Ao utilizar foco manual em macrofotografia, é comum que o fotógrafo realize pequenos deslocamentos da câmera para frente e para trás porque', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o anel de foco altera a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a profundidade de campo extremamente reduzida exige ajuste muito preciso do plano focal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumenta a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduz o ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'altera o EXIF.', 0);

    -- QUESTÃO 393 (arquivo quest24.txt, original Q293)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q393', N'Na fotografia digital, o aumento da profundidade de bits influencia principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a quantidade de níveis tonais representáveis.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o fator de corte.', 0);

    -- QUESTÃO 394 (arquivo quest24.txt, original Q294)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q394', N'Durante a documentação de um local de crime, uma fotografia apresenta excelente enquadramento, porém leve trepidação. Sob o ponto de vista pericial,', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a imagem permanece ideal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'basta aumentar a nitidez digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a trepidação pode comprometer a análise de detalhes importantes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o problema desaparece na impressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o formato RAW corrige automaticamente essa falha.', 0);

    -- QUESTÃO 395 (arquivo quest24.txt, original Q295)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q395', N'A principal finalidade do modo Live View durante macrofotografia realizada em tripé é', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a potência do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permitir avaliação ampliada do foco com maior precisão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar difração.', 0);

    -- QUESTÃO 396 (arquivo quest24.txt, original Q296)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q396', N'Na documentação de uma impressão papilar latente revelada por pó, o uso de iluminação excessivamente frontal pode', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a visualização dos relevos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'eliminar completamente os reflexos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'achatar visualmente detalhes importantes das cristas papilares.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o EXIF.', 0);

    -- QUESTÃO 397 (arquivo quest24.txt, original Q297)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q397', N'Em relação ao formato DNG, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'constitui um formato aberto desenvolvido para armazenamento de arquivos RAW.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'substitui obrigatoriamente todos os formatos RAW proprietários.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'elimina metadados EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'pode ser utilizado apenas por câmeras Leica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'gera arquivos menores que JPEG em qualquer situação.', 0);

    -- QUESTÃO 398 (arquivo quest24.txt, original Q298)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q398', N'Na fotografia técnico-pericial, a repetição de um registro imediatamente após identificar uma possível falha técnica demonstra', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'insegurança do fotógrafo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'desperdício de memória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'procedimento compatível com a busca da qualidade documental do registro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alteração da cadeia de custódia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'manipulação da prova.', 0);

    -- QUESTÃO 399 (arquivo quest24.txt, original Q299)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q399', N'Ao fotografar um objeto utilizando objetiva macro e tubos extensores, espera-se, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da ampliação acompanhado de perda de luminosidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução da ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento automático da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diminuição da distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da velocidade do obturador.', 0);

    -- QUESTÃO 400 (arquivo quest24.txt, original Q300)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q400', N'Na fotografia pericial contemporânea, a confiabilidade técnica do registro depende da combinação entre', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'câmera de alta resolução e objetiva profissional.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'formato RAW e Adobe RGB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'técnica de captura, documentação adequada, preservação dos arquivos originais e rastreabilidade de todo o fluxo de trabalho.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas número de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'exclusivamente iluminação artificial.', 0);

    -- QUESTÃO 401 (arquivo quest25.txt, original Q301)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q401', N'Durante a documentação de um vestígio em ambiente externo, o fotógrafo deseja utilizar velocidade de 1/15 s para registrar o movimento da água existente ao fundo, mantendo a exposição correta em pleno sol. A solução tecnicamente mais adequada consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o ISO para 3200.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar um filtro ND compatível com a redução luminosa necessária.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar o formato para JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar apenas uma teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o espaço de cor para Adobe RGB.', 0);

    -- QUESTÃO 402 (arquivo quest25.txt, original Q302)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q402', N'Uma objetiva apresenta a inscrição 100 mm f/2.8 Macro 1:1. Essa inscrição permite concluir corretamente que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a objetiva produzirá ampliação de 2:1.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sua abertura máxima é f/2.8 e ela é capaz de atingir reprodução em escala real.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'obrigatoriamente possui estabilização óptica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'somente pode ser utilizada para macrofotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apresenta distância mínima de foco de exatamente 100 mm.', 0);

    -- QUESTÃO 403 (arquivo quest25.txt, original Q303)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q403', N'Na fotografia pericial, a principal razão para preservar também os arquivos RAW, além das imagens utilizadas no laudo, é', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o tempo de elaboração do laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'facilitar a impressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'preservar os dados originais capturados pelo sensor, favorecendo auditoria técnica futura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diminuir o espaço ocupado em disco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar a necessidade de backups.', 0);

    -- QUESTÃO 404 (arquivo quest25.txt, original Q304)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q404', N'Durante uma fotografia macro em escala 1:1, utilizando tubos extensores, o fotógrafo percebe perda significativa de luminosidade. Esse fenômeno decorre principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'do aumento da temperatura do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'da ampliação da distância efetiva entre a objetiva e o plano do sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'do aumento do número de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do formato RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'do espaço de cor utilizado.', 0);

    -- QUESTÃO 405 (arquivo quest25.txt, original Q305)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q405', N'Ao utilizar uma teleobjetiva de 400 mm para registrar um vestígio distante, espera-se que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o ângulo de visão seja reduzido.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumente a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a perspectiva seja determinada exclusivamente pela objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'desapareçam as distorções ópticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumente automaticamente a resolução.', 0);

    -- QUESTÃO 406 (arquivo quest25.txt, original Q306)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q406', N'Em relação ao histograma RGB, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Os três canais obrigatoriamente apresentam distribuição idêntica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Um único canal pode sofrer clipping mesmo quando os demais permanecem preservados.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O histograma RGB mede nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O histograma RGB substitui o fotômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Ele informa automaticamente o ponto exato de foco.', 0);

    -- QUESTÃO 407 (arquivo quest25.txt, original Q307)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q407', N'Na fotografia de um vestígio metálico altamente refletivo, uma técnica frequentemente empregada para reduzir reflexos consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar iluminação difusa e controlar cuidadosamente o ângulo de incidência da luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar zoom digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar exclusivamente flash frontal.', 0);

    -- QUESTÃO 408 (arquivo quest25.txt, original Q308)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q408', N'Em sensores digitais, a conversão analógico-digital (A/D) corresponde ao processo de', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'transformar a luz capturada em dados digitais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alterar automaticamente a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir aberrações ópticas.', 0);

    -- QUESTÃO 409 (arquivo quest25.txt, original Q309)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q409', N'Ao fotografar uma marca de ferramenta utilizando abertura f/22, o fotógrafo obtém grande profundidade de campo, porém leve perda de nitidez. Essa redução decorre principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'da compressão JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'da difração.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da vinhetagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do flare.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'do ghosting.', 0);

    -- QUESTÃO 410 (arquivo quest25.txt, original Q310)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q410', N'Na documentação de um vestígio muito pequeno, a utilização de focus stacking apresenta como principal vantagem', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar simultaneamente a profundidade de campo aparente sem alterar a ampliação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar completamente o ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir a objetiva macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a resolução do sensor.', 0);

    -- QUESTÃO 411 (arquivo quest25.txt, original Q311)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q411', N'O fenômeno denominado aberração cromática longitudinal caracteriza-se principalmente por', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'perda uniforme de contraste em toda a imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'formação de franjas coloridas em diferentes planos de foco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aparecimento de hot pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento do ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'redução da profundidade de campo.', 0);

    -- QUESTÃO 412 (arquivo quest25.txt, original Q312)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q412', N'Na fotografia pericial de documentos, recomenda-se evitar objetivas extremamente grande-angulares porque', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'produzem obrigatoriamente menor resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'podem introduzir distorções geométricas perceptíveis nas bordas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alteram automaticamente o EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'impedem foco manual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzem a profundidade de bits.', 0);

    -- QUESTÃO 413 (arquivo quest25.txt, original Q313)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q413', N'Ao comparar sensores CCD e CMOS modernos, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'atualmente sensores CMOS predominam no mercado devido à evolução tecnológica e ao menor consumo de energia.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sensores CCD sempre apresentam maior resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'sensores CMOS eliminam completamente o ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sensores CCD não podem registrar arquivos RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sensores CMOS não utilizam fotodiodos.', 0);

    -- QUESTÃO 414 (arquivo quest25.txt, original Q314)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q414', N'Durante a documentação fotográfica de um acidente de trânsito, o primeiro registro normalmente deve privilegiar', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'detalhes dos danos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fotografias macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'visão geral do cenário antes da aproximação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas medições.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'exclusivamente imagens aéreas.', 0);

    -- QUESTÃO 415 (arquivo quest25.txt, original Q315)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q415', N'Ao utilizar uma lente close-up +4 dioptrias, espera-se, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da distância mínima de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'possibilidade de focar mais próximo do objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'redução da ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento da distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminação da necessidade de compensação de exposição.', 0);

    -- QUESTÃO 416 (arquivo quest25.txt, original Q316)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q416', N'Na fotografia digital, o termo latitude dinâmica refere-se principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao número de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao alcance de tons que podem ser registrados preservando detalhes nas sombras e nas altas luzes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'à profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao fator de corte do sensor.', 0);

    -- QUESTÃO 417 (arquivo quest25.txt, original Q317)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q417', N'Durante uma longa exposição, o uso do Mirror Lock-Up, quando disponível, busca principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir vibrações mecânicas antes da abertura do obturador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar o espaço de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar o ruído térmico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a profundidade de campo.', 0);

    -- QUESTÃO 418 (arquivo quest25.txt, original Q318)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q418', N'Na fotografia pericial, o procedimento tecnicamente mais adequado após identificar uma fotografia desfocada ainda no local é', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar software para recuperar totalmente a nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'repetir imediatamente o registro mantendo a documentação da sequência.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'converter o arquivo para TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas registrar a ocorrência no laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'descartar todos os demais arquivos.', 0);

    -- QUESTÃO 419 (arquivo quest25.txt, original Q319)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q419', N'O formato DNG diferencia-se principalmente por', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ser um formato aberto destinado ao armazenamento de dados RAW.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'substituir obrigatoriamente todos os formatos proprietários.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'impedir a gravação de metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar compressão JPEG obrigatória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ser exclusivo para imagens em preto e branco.', 0);

    -- QUESTÃO 420 (arquivo quest25.txt, original Q320)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q420', N'Na documentação fotográfica pericial, a confiabilidade do conjunto probatório depende principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'do número de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'da marca da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da combinação entre técnica correta, preservação da integridade dos arquivos, rastreabilidade e documentação adequada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'da utilização obrigatória de câmeras Full Frame.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'exclusivamente da utilização do formato RAW.', 0);

    -- QUESTÃO 421 (arquivo quest26.txt, original Q321)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q421', N'Durante a documentação de um vestígio metálico altamente polido, o fotógrafo decide alterar apenas o ângulo da iluminação, mantendo câmera e objeto imóveis. O principal objetivo dessa alteração é', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'controlar a reflexão especular sem modificar o enquadramento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir a distância focal efetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar a necessidade de filtro polarizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a resolução óptica.', 0);

    -- QUESTÃO 422 (arquivo quest26.txt, original Q322)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q422', N'Na fotografia pericial, uma objetiva macro de 180 mm, comparada a uma macro de 60 mm na mesma ampliação, apresenta como principal vantagem', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'maior distância de trabalho entre a câmera e o vestígio.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'maior resolução obrigatória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'menor perda de luminosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'menor difração.', 0);

    -- QUESTÃO 423 (arquivo quest26.txt, original Q323)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q423', N'Durante a análise de um histograma RGB, apenas o canal azul apresenta clipping. Isso indica que', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'todos os canais perderam informação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a fotografia está desfocada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'houve saturação tonal apenas nas informações correspondentes ao canal azul.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o balanço de branco está correto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a resolução foi reduzida.', 0);

    -- QUESTÃO 424 (arquivo quest26.txt, original Q324)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q424', N'Ao fotografar um vestígio utilizando flash eletrônico em velocidade superior ao sincronismo máximo da câmera, o resultado mais provável será', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução do ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento da latitude dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'registro parcial da iluminação produzida pelo flash.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração automática do EXIF.', 0);

    -- QUESTÃO 425 (arquivo quest26.txt, original Q325)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q425', N'Na documentação fotográfica de uma cena pericial, remover digitalmente um objeto originalmente presente, ainda que considerado irrelevante pelo fotógrafo,', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'é aceitável se o arquivo permanecer em RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'é permitido quando não altera o vestígio principal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'depende apenas da autorização da autoridade policial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'melhora a qualidade documental.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'compromete a autenticidade do registro produzido.', 1);

    -- QUESTÃO 426 (arquivo quest26.txt, original Q326)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q426', N'Em relação ao foco seletivo, é correto afirmar que ele é favorecido por', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'grande abertura do diafragma associada à reduzida profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'velocidade lenta do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilização de filtro ND.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da temperatura de cor.', 0);

    -- QUESTÃO 427 (arquivo quest26.txt, original Q327)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q427', N'Na fotografia digital, o principal objetivo do algoritmo de demosaicing é', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reconstruir a informação cromática proveniente do padrão Bayer.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'corrigir a distorção em barril.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar hot pixels.', 0);

    -- QUESTÃO 428 (arquivo quest26.txt, original Q328)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q428', N'Na documentação de documentos, a utilização de objetiva grande-angular muito próxima da folha pode provocar', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'perda obrigatória da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminuição da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'distorções geométricas capazes de comprometer a representação fiel das proporções.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento do ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração da profundidade de bits.', 0);

    -- QUESTÃO 429 (arquivo quest26.txt, original Q329)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q429', N'Durante uma fotografia macro em tripé, o fotógrafo utiliza o temporizador mesmo dispondo de foco manual preciso. A principal finalidade desse procedimento é', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alterar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'modificar o EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'minimizar vibrações decorrentes do acionamento da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir a difração.', 0);

    -- QUESTÃO 430 (arquivo quest26.txt, original Q330)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q430', N'Sobre o formato TIFF, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Sempre utiliza compressão com perdas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'É incompatível com edição profissional.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Possui menor qualidade que JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Não suporta profundidade de bits elevada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'É amplamente utilizado quando se busca preservar alta qualidade para arquivamento e edição.', 1);

    -- QUESTÃO 431 (arquivo quest26.txt, original Q331)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q431', N'Na documentação de uma marca de ferramenta, a iluminação rasante é utilizada principalmente porque', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'evidencia relevos e microdeformações superficiais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduz a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumenta a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'elimina reflexos em qualquer superfície.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'altera a temperatura de cor.', 0);

    -- QUESTÃO 432 (arquivo quest26.txt, original Q332)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q432', N'Em relação ao sensor BSI CMOS, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'elimina completamente o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reposiciona a estrutura do sensor para favorecer o aproveitamento da luz incidente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'dispensa o uso de microlentes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumenta automaticamente a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substitui o conversor A/D.', 0);

    -- QUESTÃO 433 (arquivo quest26.txt, original Q333)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q433', N'Ao comparar uma fotografia RAW com sua versão JPEG produzida pela própria câmera, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ambas armazenam exatamente a mesma quantidade de dados do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o JPEG sempre possui maior latitude dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o RAW preserva maior quantidade de informações para ajustes posteriores.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o RAW elimina a necessidade de exposição correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o JPEG impede gravação de metadados.', 0);

    -- QUESTÃO 434 (arquivo quest26.txt, original Q334)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q434', N'Durante a captura de uma fotografia em longa exposição, a utilização do Mirror Lock-Up busca principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alterar o fator de corte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a potência do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir vibrações mecânicas provocadas pelo espelho.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar difração.', 0);

    -- QUESTÃO 435 (arquivo quest26.txt, original Q335)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q435', N'Na fotografia técnico-pericial, a conferência imediata das imagens ainda no local de exame é importante porque', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduz o tamanho dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'altera automaticamente o EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'elimina a necessidade de backup.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substitui a cadeia de custódia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'permite repetir registros tecnicamente inadequados antes do encerramento dos trabalhos.', 1);

    -- QUESTÃO 436 (arquivo quest26.txt, original Q336)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q436', N'Na macrofotografia, o uso de focus stacking tem como principal objetivo', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ampliar a profundidade de campo aparente combinando múltiplos planos de foco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar aberrações cromáticas.', 0);

    -- QUESTÃO 437 (arquivo quest26.txt, original Q337)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q437', N'Durante disparos contínuos em RAW, o componente que normalmente limita a sequência máxima de fotografias é', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a capacidade do buffer associada à velocidade de gravação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o espaço de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o balanço de branco.', 0);

    -- QUESTÃO 438 (arquivo quest26.txt, original Q338)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q438', N'Uma objetiva apresenta acentuada distorção em barril. Esse defeito óptico produz, principalmente,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'perda de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento do ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'curvatura aparente das linhas retas próximas às bordas da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alteração do histograma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da profundidade de campo.', 0);

    -- QUESTÃO 439 (arquivo quest26.txt, original Q339)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q439', N'Ao fotografar uma impressão papilar utilizando iluminação excessivamente frontal, o principal risco consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alterar o espaço de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir o relevo visual das cristas, dificultando sua observação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a ampliação óptica.', 0);

    -- QUESTÃO 440 (arquivo quest26.txt, original Q340)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q440', N'Na fotografia pericial contemporânea, a preservação dos arquivos originais e de seus metadados tem como principal finalidade', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o espaço de armazenamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'facilitar apenas a impressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir o laudo pericial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'assegurar autenticidade, rastreabilidade e confiabilidade técnica dos registros.', 1);

    -- QUESTÃO 441 (arquivo quest27.txt, original Q341)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q441', N'Durante a documentação de uma impressão papilar revelada em superfície de vidro, o fotógrafo posiciona a fonte de luz lateralmente e observa melhora significativa na visualização das cristas. Esse resultado ocorre principalmente porque', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a iluminação oblíqua aumenta o contraste dos relevos superficiais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduz automaticamente a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'elimina a necessidade de foco preciso.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'altera o fator de ampliação da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumenta a resolução do sensor.', 0);

    -- QUESTÃO 442 (arquivo quest27.txt, original Q342)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q442', N'Uma câmera possui buffer para 24 arquivos RAW consecutivos. Utilizando um cartão de memória significativamente mais rápido, espera-se que', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumente a resolução da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o buffer seja liberado mais rapidamente durante a gravação dos arquivos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumente a profundidade de bits.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diminua a distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduza a difração.', 0);

    -- QUESTÃO 443 (arquivo quest27.txt, original Q343)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q443', N'Ao fechar o diafragma de f/8 para f/16, mantendo ISO constante, o fotógrafo deverá compensar a exposição, por exemplo,', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzindo o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizando uma objetiva de maior distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentando o tempo de exposição em dois pontos (2 EV).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterando o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'modificando o espaço de cor.', 0);

    -- QUESTÃO 444 (arquivo quest27.txt, original Q344)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q444', N'Em uma câmera DSLR, durante uma longa exposição realizada sobre tripé, o recurso Mirror Lock-Up é utilizado para', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a latitude dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar a velocidade de sincronismo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'minimizar vibrações causadas pelo movimento do espelho.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'corrigir aberração cromática.', 0);

    -- QUESTÃO 445 (arquivo quest27.txt, original Q345)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q445', N'Sobre a preservação dos arquivos fotográficos produzidos durante uma perícia, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas os arquivos JPEG devem ser armazenados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'os arquivos RAW podem ser descartados após a elaboração do laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a preservação dos arquivos originais contribui para futuras verificações técnicas e auditorias.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'somente imagens impressas possuem valor documental.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'os metadados são irrelevantes para a rastreabilidade do registro.', 0);

    -- QUESTÃO 446 (arquivo quest27.txt, original Q346)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q446', N'Na fotografia macro, a utilização de tubos extensores provoca, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da ampliação acompanhado de redução da luminosidade efetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminuição da ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminação da necessidade de foco manual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento da distância mínima de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'redução da distância focal da objetiva.', 0);

    -- QUESTÃO 447 (arquivo quest27.txt, original Q347)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q447', N'O principal objetivo do padrão Bayer existente na maioria dos sensores digitais é', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o ruído térmico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permitir o registro das informações de cor que posteriormente serão reconstruídas pelo processamento da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir o filtro passa-baixa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar o efeito moiré.', 0);

    -- QUESTÃO 448 (arquivo quest27.txt, original Q348)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q448', N'Durante a documentação de uma arma de fogo, o fotógrafo realiza fotografias gerais, médias e de detalhe. Essa sequência tem como finalidade principal', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diminuir o número de arquivos produzidos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'facilitar apenas a impressão das imagens.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'preservar a contextualização da cena e a identificação precisa dos vestígios.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir o croqui pericial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar a necessidade de descrição no laudo.', 0);

    -- QUESTÃO 449 (arquivo quest27.txt, original Q349)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q449', N'Ao utilizar velocidade acima do limite de sincronismo do flash em uma DSLR com obturador de plano focal, poderá ocorrer', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução da latitude dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'registro parcial da iluminação do flash na imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração do histograma RGB.', 0);

    -- QUESTÃO 450 (arquivo quest27.txt, original Q350)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q450', N'O formato TIFF é amplamente utilizado em fluxos de trabalho profissionais porque', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sempre apresenta arquivos menores que JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utiliza exclusivamente compressão com perdas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'impede armazenamento de metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'é incompatível com edição profissional.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'permite preservar elevada qualidade de imagem durante arquivamento e processamento.', 1);

    -- QUESTÃO 451 (arquivo quest27.txt, original Q351)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q451', N'Ao utilizar uma objetiva de 14 mm muito próxima de um objeto, espera-se principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'exagero da perspectiva entre elementos próximos e distantes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'compressão da perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminação das distorções geométricas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento obrigatório da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'redução do ângulo de visão.', 0);

    -- QUESTÃO 452 (arquivo quest27.txt, original Q352)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q452', N'Na macrofotografia, o focus stacking consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o ISO automaticamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'combinar várias imagens focadas em diferentes planos para ampliar a profundidade de campo aparente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir o fator de ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar a necessidade de tripé.', 0);

    -- QUESTÃO 453 (arquivo quest27.txt, original Q353)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q453', N'Ao fotografar em RAW, a principal vantagem em relação ao JPEG consiste na', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'redução obrigatória do tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'eliminação completa do ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'maior quantidade de informações disponíveis para ajustes posteriores.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento automático da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'impossibilidade de alteração do balanço de branco.', 0);

    -- QUESTÃO 454 (arquivo quest27.txt, original Q354)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q454', N'O fenômeno da difração torna-se mais perceptível quando', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumenta o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utiliza-se teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fotografa-se em RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utiliza-se aberturas muito pequenas, como f/22 ou f/32.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utiliza-se filtro polarizador.', 0);

    -- QUESTÃO 455 (arquivo quest27.txt, original Q355)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q455', N'Na documentação fotográfica de uma cena de crime, a conferência imediata dos arquivos ainda no local permite principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'alterar os metadados EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a resolução das imagens.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o tamanho dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'converter automaticamente RAW em TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'identificar falhas técnicas e repetir registros antes da desmobilização da equipe.', 1);

    -- QUESTÃO 456 (arquivo quest27.txt, original Q356)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q456', N'Na fotografia digital, o histograma representa', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a distribuição dos níveis de luminosidade registrados na imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o número de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o fator de corte da câmera.', 0);

    -- QUESTÃO 457 (arquivo quest27.txt, original Q357)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q457', N'A principal característica do sensor BSI CMOS é', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'eliminar completamente o ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'melhorar a eficiência de captação luminosa ao reposicionar a estrutura do sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar automaticamente a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir o padrão Bayer.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'impedir a ocorrência de hot pixels.', 0);

    -- QUESTÃO 458 (arquivo quest27.txt, original Q358)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q458', N'Ao fotografar um documento utilizando uma objetiva grande-angular muito próxima da folha, existe maior risco de', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'produzir distorções geométricas que comprometem a fidelidade do documento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar automaticamente a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a latitude dinâmica.', 0);

    -- QUESTÃO 459 (arquivo quest27.txt, original Q359)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q459', N'Durante uma longa exposição sem disparador remoto, o uso do temporizador da câmera ajuda principalmente a', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alterar o histograma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'evitar vibrações provocadas pelo acionamento manual do obturador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'modificar a distância focal.', 0);

    -- QUESTÃO 460 (arquivo quest27.txt, original Q360)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q460', N'A utilização de backup seguindo a estratégia 3-2-1 tem como objetivo principal', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a velocidade da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir o tamanho dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'melhorar a qualidade óptica da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar a necessidade de armazenamento em nuvem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir o risco de perda definitiva dos registros fotográficos por meio de múltiplas cópias em mídias distintas.', 1);

    -- QUESTÃO 461 (arquivo quest28.txt, original Q361)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q461', N'Ao fotografar um estojo de munição com uma objetiva macro em escala 1:1, o fotógrafo percebe que apenas uma pequena faixa permanece nítida. Essa limitação decorre principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'da reduzida profundidade de campo característica da macrofotografia.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'do excesso de megapixels do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da utilização do formato RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do uso de tripé.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'do padrão Bayer.', 0);

    -- QUESTÃO 462 (arquivo quest28.txt, original Q362)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q462', N'Ao comparar um sensor APS-C com um Full Frame de mesma geração tecnológica, ambos utilizando objetivas equivalentes para produzir o mesmo enquadramento, é correto afirmar que, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o APS-C sempre produzirá menos ruído independentemente do ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o Full Frame tende a apresentar melhor desempenho em baixa luminosidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ambos obrigatoriamente apresentarão a mesma profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o tamanho do sensor não interfere na qualidade final.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o APS-C elimina o fator de corte.', 0);

    -- QUESTÃO 463 (arquivo quest28.txt, original Q363)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q463', N'Durante a documentação de um documento histórico, o fotógrafo posiciona a câmera de forma que o plano do sensor permaneça paralelo ao plano do documento. O principal objetivo é', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'minimizar distorções de perspectiva e manter a geometria fiel.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar a necessidade de escala métrica.', 0);

    -- QUESTÃO 464 (arquivo quest28.txt, original Q364)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q464', N'Ao utilizar um flash eletrônico com Número Guia (NG) 40 (ISO 100), para fotografar um objeto localizado a 5 metros, a abertura mais adequada será', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/5,6', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/16', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/4', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/8', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/11', 0);

    -- QUESTÃO 465 (arquivo quest28.txt, original Q365)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q465', N'Na preservação de arquivos fotográficos periciais, a regra de backup 3-2-1 recomenda', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'três cópias dos dados, em duas mídias diferentes, sendo uma armazenada em local distinto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'três cartões de memória idênticos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'dois backups exclusivamente em nuvem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'três arquivos JPEG para cada RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'duas cópias armazenadas no mesmo computador.', 0);

    -- QUESTÃO 466 (arquivo quest28.txt, original Q366)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q466', N'Em relação ao formato RAW, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'É um formato final pronto para impressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Armazena grande quantidade de informações capturadas pelo sensor antes do processamento definitivo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Sempre possui compressão com perdas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Elimina os metadados EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Não permite ajustes posteriores de balanço de branco.', 0);

    -- QUESTÃO 467 (arquivo quest28.txt, original Q367)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q467', N'Durante a fotografia de uma impressão papilar revelada por pó, o fotógrafo utiliza iluminação muito intensa e frontal. O resultado mais provável será', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução da ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'diminuição do contraste entre cristas e sulcos, dificultando sua visualização.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminação do ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da latitude dinâmica.', 0);

    -- QUESTÃO 468 (arquivo quest28.txt, original Q368)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q468', N'Ao realizar uma exposição de 4 segundos em tripé, o fotógrafo utiliza disparador remoto. O principal benefício desse procedimento é', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o ruído do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'evitar vibrações provocadas pelo acionamento manual da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ampliar a profundidade de campo.', 0);

    -- QUESTÃO 469 (arquivo quest28.txt, original Q369)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q469', N'Na fotografia pericial, preservar os metadados originais dos arquivos contribui principalmente para', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'melhorar a reprodução das cores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a velocidade de gravação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reforçar a rastreabilidade e a autenticidade do registro.', 1);

    -- QUESTÃO 470 (arquivo quest28.txt, original Q370)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q470', N'O fenômeno conhecido como moiré ocorre principalmente quando', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'padrões repetitivos da cena interagem com a malha de amostragem do sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utiliza-se ISO elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ocorre superexposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'há excesso de profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utiliza-se flash direto.', 0);

    -- QUESTÃO 471 (arquivo quest28.txt, original Q371)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q471', N'Ao analisar um histograma concentrado na extremidade esquerda, sem perda de informação, conclui-se que a imagem apresenta', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'superexposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'predominância de tons escuros, sem necessariamente haver subexposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'clipping nas altas luzes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'erro obrigatório de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'temperatura de cor incorreta.', 0);

    -- QUESTÃO 472 (arquivo quest28.txt, original Q372)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q472', N'Na macrofotografia, o focus stacking é particularmente útil porque', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'elimina completamente a difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permite ampliar a região aparente em foco pela combinação de várias imagens.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumenta a distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduz automaticamente o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substitui o uso de tripé.', 0);

    -- QUESTÃO 473 (arquivo quest28.txt, original Q373)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q473', N'Ao utilizar uma objetiva de 24 mm para fotografar um ambiente interno, espera-se', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'compressão da perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução do ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'amplo campo de visão, com possibilidade de exagero da perspectiva quando muito próximo dos objetos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento automático da profundidade de bits.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminação de distorções ópticas.', 0);

    -- QUESTÃO 474 (arquivo quest28.txt, original Q374)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q474', N'Em uma DSLR, o recurso Mirror Lock-Up é especialmente recomendado quando', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utiliza-se ISO elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fotografa-se em JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utiliza-se flash externo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'pequenas vibrações podem comprometer imagens de alta precisão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'pretende-se reduzir o tamanho do arquivo.', 0);

    -- QUESTÃO 475 (arquivo quest28.txt, original Q375)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q475', N'Sobre a cadeia de custódia aplicada aos arquivos fotográficos periciais, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pode ser dispensada quando a câmera grava em RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'depende apenas da assinatura do perito.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aplica-se somente a arquivos impressos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'restringe-se às mídias de armazenamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'envolve procedimentos destinados a preservar a integridade e a confiabilidade dos registros produzidos.', 1);

    -- QUESTÃO 476 (arquivo quest28.txt, original Q376)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q476', N'Ao fechar o diafragma de f/4 para f/8, mantendo ISO constante, a compensação correta para preservar a exposição consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o tempo de exposição em dois pontos (2 EV).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir o tempo de exposição em dois pontos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar o ISO obrigatoriamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar outra distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o formato do arquivo.', 0);

    -- QUESTÃO 477 (arquivo quest28.txt, original Q377)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q477', N'Na fotografia digital, a principal função do conversor analógico-digital (A/D) é', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'converter o sinal elétrico gerado pelos fotodiodos em dados digitais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar a abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sincronizar o flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ampliar a profundidade de campo.', 0);

    -- QUESTÃO 478 (arquivo quest28.txt, original Q378)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q478', N'O uso de uma objetiva tilt-shift pode ser especialmente vantajoso para', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'eliminar completamente a difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a ampliação macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar a perspectiva e o plano de foco em aplicações específicas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir teleobjetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a sensibilidade ISO.', 0);

    -- QUESTÃO 479 (arquivo quest28.txt, original Q379)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q479', N'Na documentação de um vestígio muito pequeno, a utilização de Live View com ampliação da imagem auxilia principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'no aumento da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'na redução do ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'na alteração da temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'na obtenção de foco manual mais preciso.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'na redução do tamanho do arquivo.', 0);

    -- QUESTÃO 480 (arquivo quest28.txt, original Q380)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q480', N'Ao final de uma perícia fotográfica, além do armazenamento dos arquivos originais, uma boa prática consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apagar imediatamente os arquivos do cartão de memória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'converter todos os arquivos para JPEG e descartar os RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'remover os metadados para proteger a privacidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'armazenar apenas as fotografias utilizadas no laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'manter cópias de segurança conforme política de backup e preservação dos dados.', 1);

    -- QUESTÃO 481 (arquivo quest29.txt, original Q381)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q481', N'Durante a documentação fotográfica de uma arma de fogo, o perito identifica um número de série parcialmente apagado. Antes de qualquer tratamento pericial específico no objeto, a conduta fotográfica mais adequada é', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'registrar detalhadamente o estado original do vestígio antes de qualquer intervenção.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'limpar a superfície para melhorar a fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aplicar contraste digital antes do registro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar apenas fotografia panorâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'remover reflexos com edição posterior.', 0);

    -- QUESTÃO 482 (arquivo quest29.txt, original Q382)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q482', N'Ao fotografar em RAW e JPEG simultaneamente, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ambos os arquivos possuem exatamente o mesmo nível de processamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o RAW preserva informações mais completas do sensor, enquanto o JPEG sofre processamento interno da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o JPEG possui maior latitude de edição que o RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o RAW não contém metadados EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ambos ocupam obrigatoriamente o mesmo espaço de armazenamento.', 0);

    -- QUESTÃO 483 (arquivo quest29.txt, original Q383)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q483', N'Um fotógrafo deseja reduzir o ruído eletrônico sem alterar significativamente a composição da imagem. A alternativa tecnicamente mais adequada é', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar abertura menor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o ISO sempre que as condições de iluminação permitirem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar o espaço de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar zoom digital.', 0);

    -- QUESTÃO 484 (arquivo quest29.txt, original Q384)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q484', N'Durante uma macrofotografia em tripé, o fotógrafo utiliza disparador remoto, Mirror Lock- Up e Live View ampliado. O objetivo principal dessa combinação é', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a velocidade de sincronismo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'obter a máxima precisão possível na captura, reduzindo vibrações e facilitando o foco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar a difração.', 0);

    -- QUESTÃO 485 (arquivo quest29.txt, original Q385)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q485', N'Na documentação de um local de crime, caso seja identificada falha técnica em determinada fotografia ainda durante os trabalhos periciais, a medida mais adequada é', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'excluir imediatamente o arquivo defeituoso.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'editar a imagem para corrigir a falha.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'substituir a fotografia antiga pela nova.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'converter o arquivo em TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'realizar novo registro, preservando adequadamente toda a documentação produzida.', 1);

    -- QUESTÃO 486 (arquivo quest29.txt, original Q386)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q486', N'Uma objetiva de 35 mm, utilizada em câmera Full Frame, é normalmente classificada como', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'grande-angular moderada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'teleobjetiva curta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'objetiva normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'superteleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'olho-de-peixe.', 0);

    -- QUESTÃO 487 (arquivo quest29.txt, original Q387)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q487', N'Em sensores digitais, o principal papel dos fotodiodos consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'armazenar os arquivos RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'converter fótons incidentes em carga elétrica.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar o obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'realizar o demosaicing.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir automaticamente o ruído.', 0);

    -- QUESTÃO 488 (arquivo quest29.txt, original Q388)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q488', N'Ao comparar uma fotografia realizada em f/4 com outra em f/16, mantendo o mesmo enquadramento e foco, é correto afirmar que, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/4 apresenta maior profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/16 aumenta a entrada de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/16 proporciona maior profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ambas apresentam profundidade de campo idêntica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apenas f/4 permite foco no infinito.', 0);

    -- QUESTÃO 489 (arquivo quest29.txt, original Q389)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q489', N'Na fotografia de um objeto metálico altamente refletivo, a utilização de um difusor sobre a fonte luminosa tende a', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'eliminar totalmente os reflexos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'suavizar os reflexos e reduzir o contraste especular.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'modificar automaticamente o balanço de branco.', 0);

    -- QUESTÃO 490 (arquivo quest29.txt, original Q390)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q490', N'Ao final da perícia, a integridade dos arquivos fotográficos é reforçada principalmente por', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'impressão imediata das fotografias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'conversão obrigatória para JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusão dos metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução da resolução para arquivamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'manutenção dos arquivos originais acompanhados de política adequada de preservação e backup.', 1);

    -- QUESTÃO 491 (arquivo quest29.txt, original Q391)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q491', N'Na fotografia macro, o aumento da ampliação geralmente provoca', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'redução da profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento obrigatório da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminação da difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução do fator de extensão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'diminuição da distância focal.', 0);

    -- QUESTÃO 492 (arquivo quest29.txt, original Q392)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q492', N'Durante disparos contínuos em RAW, o tempo necessário para que a câmera volte à velocidade máxima de captura depende principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'do espaço de cor selecionado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'da velocidade de gravação do cartão e do esvaziamento do buffer.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'da abertura utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'do tipo de visor.', 0);

    -- QUESTÃO 493 (arquivo quest29.txt, original Q393)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q493', N'O uso de iluminação cruzada na fotografia pericial pode ser especialmente útil para', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alterar o EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'evidenciar detalhes superficiais e minimizar reflexos em determinadas situações.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar a necessidade de escalas fotográficas.', 0);

    -- QUESTÃO 494 (arquivo quest29.txt, original Q394)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q494', N'Uma objetiva apresenta forte distorção em barril. Esse defeito é percebido principalmente porque', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduz a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumenta o ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'provoca aberração cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'faz com que linhas retas próximas às bordas pareçam curvadas para fora.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'altera o histograma RGB.', 0);

    -- QUESTÃO 495 (arquivo quest29.txt, original Q395)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q495', N'Na fotografia técnico-pericial, a utilização de escalas métricas junto ao vestígio busca principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'melhorar a estética da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'substituir medições realizadas pelos peritos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir a perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'fornecer referência dimensional confiável para análise posterior.', 1);

    -- QUESTÃO 496 (arquivo quest29.txt, original Q396)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q496', N'O principal benefício de fotografar utilizando ISO nativo da câmera, sempre que possível, é', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'obter melhor relação entre qualidade de imagem, alcance dinâmico e ruído.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar automaticamente a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ampliar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir o fator de corte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar completamente os hot pixels.', 0);

    -- QUESTÃO 497 (arquivo quest29.txt, original Q397)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q497', N'Ao converter um arquivo RAW em TIFF para edição, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o TIFF sempre será menor que o RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o TIFF pode preservar elevada qualidade de imagem, sendo amplamente utilizado em fluxos de edição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o TIFF elimina todos os metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o TIFF utiliza obrigatoriamente compressão com perdas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o RAW deixa de existir automaticamente.', 0);

    -- QUESTÃO 498 (arquivo quest29.txt, original Q398)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q498', N'Ao utilizar uma objetiva tilt-shift para fotografar a fachada de um edifício, a principal vantagem técnica é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a luminosidade da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar a perspectiva, reduzindo a convergência aparente das linhas verticais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a velocidade de sincronismo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar a difração.', 0);

    -- QUESTÃO 499 (arquivo quest29.txt, original Q399)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q499', N'Em uma fotografia realizada em ambiente escuro, o fotógrafo opta por reduzir o ISO e compensar com maior tempo de exposição utilizando tripé. Em relação à qualidade da imagem, essa escolha tende a', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a distorção geométrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'favorecer melhor qualidade de imagem, desde que o assunto permaneça imóvel.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar completamente qualquer possibilidade de trepidação.', 0);

    -- QUESTÃO 500 (arquivo quest29.txt, original Q400)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q500', N'Na fotografia pericial contemporânea, a credibilidade técnica do registro depende da integração entre técnica fotográfica, preservação da cadeia documental, integridade dos arquivos e', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'quantidade de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'marca da câmera utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'velocidade máxima do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilização obrigatória de objetivas fixas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'procedimentos que assegurem autenticidade, rastreabilidade e possibilidade de verificação futura.', 1);

    -- QUESTÃO 501 (arquivo quest30.txt, original Q401)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q501', N'Durante a fotografia de um vestígio biológico em ambiente externo, o céu parcialmente encoberto provoca rápidas variações na intensidade luminosa. Para manter a exposição consistente entre várias imagens, a conduta mais indicada é', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'definir manualmente os parâmetros de exposição após realizar a fotometria da cena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar obrigatoriamente o modo totalmente automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar o ISO a cada fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'variar a abertura do diafragma entre cada disparo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar apenas balanço de branco automático.', 0);

    -- QUESTÃO 502 (arquivo quest30.txt, original Q402)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q502', N'Em uma câmera digital, a principal vantagem de um sensor com maior alcance dinâmico é', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a velocidade de gravação do cartão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'registrar maior quantidade de detalhes simultaneamente em sombras e altas luzes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar completamente o ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir a distância mínima de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar automaticamente a profundidade de campo.', 0);

    -- QUESTÃO 503 (arquivo quest30.txt, original Q403)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q503', N'Durante a documentação de uma cena de crime, uma fotografia de detalhe é realizada antes da fotografia panorâmica. Sob a ótica da metodologia pericial, essa sequência é inadequada porque', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumenta o ruído da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduz a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'dificulta a compreensão da localização do vestígio dentro do contexto da cena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'altera os metadados EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'modifica a distância focal da objetiva.', 0);

    -- QUESTÃO 504 (arquivo quest30.txt, original Q404)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q504', N'Ao utilizar uma objetiva macro em escala 1:1, o fotógrafo verifica perda de aproximadamente dois pontos de luz devido ao fator de extensão. Caso deseje manter a mesma exposição sem alterar o ISO, deverá', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fechar dois pontos do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar uma objetiva mais longa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir a distância de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar o tempo de exposição em aproximadamente dois pontos (2 EV).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o espaço de cor.', 0);

    -- QUESTÃO 505 (arquivo quest30.txt, original Q405)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q505', N'Na fotografia técnico-pericial, uma edição destinada apenas ao ajuste global de exposição deve', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'substituir o arquivo RAW original.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'eliminar os metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'modificar permanentemente o arquivo original.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'dispensar o armazenamento da captura inicial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'preservar o arquivo original, mantendo a possibilidade de auditoria da imagem produzida.', 1);

    -- QUESTÃO 506 (arquivo quest30.txt, original Q406)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q506', N'Ao fotografar um documento para futura análise grafotécnica, o posicionamento mais adequado da câmera é', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'com o plano do sensor paralelo ao plano do documento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'formando ângulo aproximado de 45° em relação ao papel.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizando apenas objetiva olho-de-peixe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'inclinando propositalmente a câmera para aumentar a perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aproximando uma grande-angular ao máximo da folha.', 0);

    -- QUESTÃO 507 (arquivo quest30.txt, original Q407)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q507', N'Durante uma sequência contínua em RAW, o buffer permanece constantemente cheio, embora o cartão utilizado seja de alta velocidade. A hipótese mais provável é', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'erro obrigatório do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o volume de dados gerados excede temporariamente a capacidade de processamento e gravação da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilização de balanço de branco incorreto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'excesso de megapixels no monitor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilização de foco manual.', 0);

    -- QUESTÃO 508 (arquivo quest30.txt, original Q408)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q508', N'Ao comparar duas imagens produzidas pela mesma objetiva, uma em f/5,6 e outra em f/16, mantendo a mesma exposição final, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ambas obrigatoriamente apresentarão a mesma nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a imagem em f/16 sempre será mais luminosa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a fotografia em f/16 poderá apresentar maior profundidade de campo, porém maior influência da difração.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a fotografia em f/5,6 sempre apresentará mais ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a abertura não interfere na profundidade de campo.', 0);

    -- QUESTÃO 509 (arquivo quest30.txt, original Q409)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q509', N'Na documentação de uma superfície altamente refletiva, a utilização de duas fontes luminosas posicionadas simetricamente e difusas busca principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alterar o fator de corte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar completamente as sombras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir reflexos especulares intensos e proporcionar iluminação mais uniforme.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a velocidade de sincronismo.', 0);

    -- QUESTÃO 510 (arquivo quest30.txt, original Q410)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q510', N'Em relação à cadeia de custódia aplicada aos registros fotográficos digitais, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'restringe-se apenas ao armazenamento físico dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aplica-se somente após a conclusão do laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'limita-se aos arquivos impressos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'depende exclusivamente da assinatura do perito.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'compreende medidas destinadas a preservar a autenticidade, integridade e rastreabilidade dos registros desde sua produção.', 1);

    -- QUESTÃO 511 (arquivo quest30.txt, original Q411)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q511', N'Na fotografia de uma impressão papilar, a utilização de Live View com ampliação da imagem auxilia principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'na obtenção de foco manual extremamente preciso.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'no aumento da resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'na redução automática do ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'na alteração da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'na eliminação da difração.', 0);

    -- QUESTÃO 512 (arquivo quest30.txt, original Q412)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q512', N'O principal objetivo da calibração periódica de monitores utilizados na análise de imagens periciais é', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a velocidade do computador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'garantir reprodução consistente e fiel de brilho, contraste e cores.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o tamanho dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a resolução das fotografias.', 0);

    -- QUESTÃO 513 (arquivo quest30.txt, original Q413)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q513', N'Em uma câmera digital, um pixel quente (hot pixel) caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'permanecer permanentemente apagado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apresentar distorção geométrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'registrar brilho anormal, especialmente em exposições longas ou temperaturas elevadas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar automaticamente o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'modificar a profundidade de bits.', 0);

    -- QUESTÃO 514 (arquivo quest30.txt, original Q414)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q514', N'Ao utilizar uma teleobjetiva de longa distância focal sem estabilização óptica, fotografando sem tripé, a principal preocupação do fotógrafo deve ser', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'alteração do espaço de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução da latitude dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'maior suscetibilidade à trepidação causada pelo movimento da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da temperatura de cor.', 0);

    -- QUESTÃO 515 (arquivo quest30.txt, original Q415)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q515', N'Na preservação de evidências fotográficas digitais, constitui boa prática', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apagar imediatamente os arquivos do cartão após a transferência.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'manter apenas versões editadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'converter todos os arquivos para JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'remover metadados considerados desnecessários.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'verificar a integridade da cópia antes de reutilizar ou formatar a mídia original.', 1);

    -- QUESTÃO 516 (arquivo quest30.txt, original Q416)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q516', N'Ao utilizar uma objetiva de 85 mm em um retrato pericial, uma característica frequentemente observada é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'perspectiva mais natural, com menor exagero das proporções faciais em comparação a grandes-angulares.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento obrigatório da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminação das aberrações cromáticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração do fator de corte.', 0);

    -- QUESTÃO 517 (arquivo quest30.txt, original Q417)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q517', N'Na fotografia digital, a principal função dos metadados EXIF é', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'substituir o laudo pericial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'registrar informações técnicas da captura, como exposição, abertura e ISO.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'armazenar apenas dados administrativos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'controlar o foco automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'corrigir distorções ópticas.', 0);

    -- QUESTÃO 518 (arquivo quest30.txt, original Q418)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q518', N'Uma objetiva apresenta forte flare ao fotografar contra uma fonte intensa de luz. A medida mais eficaz para reduzir esse efeito é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar abertura máxima.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'empregar um para-sol (lens hood) e reposicionar o enquadramento quando possível.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar o formato RAW para JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a velocidade do obturador.', 0);

    -- QUESTÃO 519 (arquivo quest30.txt, original Q419)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q519', N'Ao registrar um vestígio utilizando velocidade muito baixa e câmera apoiada em tripé, o fotógrafo percebe que a imagem ainda apresenta leve borramento causado pelo vento movimentando o objeto fotografado. A solução mais adequada é', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar apenas foco manual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alterar o espaço de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar velocidade mais alta, compensando a exposição por outros parâmetros disponíveis.', 1);

    -- QUESTÃO 520 (arquivo quest30.txt, original Q420)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q520', N'Na fotografia pericial, o princípio da repetibilidade busca assegurar que', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas uma fotografia seja suficiente para cada vestígio.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'somente equipamentos da mesma marca possam ser utilizados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'todas as imagens sejam produzidas em JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas o fotógrafo original consiga reproduzir o registro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'outro profissional, empregando metodologia equivalente, possa compreender e reproduzir tecnicamente o procedimento documentado.', 1);

    -- QUESTÃO 521 (arquivo quest31.txt, original Q421)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q521', N'Durante a documentação de uma arma de fogo apreendida, o fotógrafo verifica que o número de série apresenta forte brilho devido ao acabamento metálico. A medida mais adequada para preservar a legibilidade da gravação é', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'modificar o ângulo de incidência da iluminação, evitando reflexos especulares diretamente sobre a inscrição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar o ISO para compensar o brilho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar apenas flash frontal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a saturação na câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'converter imediatamente a imagem para preto e branco.', 0);

    -- QUESTÃO 522 (arquivo quest31.txt, original Q422)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q522', N'Uma câmera registra continuamente 12 fotografias RAW antes de reduzir drasticamente a velocidade de disparo. Esse comportamento indica principalmente que', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a bateria está descarregada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o buffer atingiu sua capacidade temporária de armazenamento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o sensor sofreu superaquecimento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a objetiva perdeu foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o cartão foi formatado incorretamente.', 0);

    -- QUESTÃO 523 (arquivo quest31.txt, original Q423)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q523', N'Ao utilizar uma objetiva de 100 mm macro em escala 1:1, o fotógrafo observa que apenas pequena parte do vestígio permanece nítida. A principal causa é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'excesso de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'uso do formato RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'profundidade de campo extremamente reduzida nessa ampliação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fator de corte do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilização de tripé.', 0);

    -- QUESTÃO 524 (arquivo quest31.txt, original Q424)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q524', N'Durante uma fotografia de longa exposição realizada sobre tripé, o fotógrafo esquece de desativar o estabilizador óptico da objetiva. Em muitos sistemas, isso pode', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar automaticamente a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'melhorar obrigatoriamente a nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'introduzir pequenas vibrações ou perda de nitidez, pois o estabilizador tenta compensar movimentos inexistentes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o balanço de branco.', 0);

    -- QUESTÃO 525 (arquivo quest31.txt, original Q425)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q525', N'Na cadeia de custódia dos registros fotográficos digitais, a manutenção dos arquivos originais é importante porque', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduz o tamanho do armazenamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'elimina a necessidade de laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'permite excluir versões editadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'impede totalmente qualquer contestação judicial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'preserva a possibilidade de verificação independente da autenticidade e integridade das imagens.', 1);

    -- QUESTÃO 526 (arquivo quest31.txt, original Q426)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q526', N'Ao fotografar um documento para comparação grafotécnica, a objetiva mais indicada entre as opções abaixo é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'uma objetiva normal ou macro, posicionada perpendicularmente ao documento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'uma olho-de-peixe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'uma superteleobjetiva de 600 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'uma catadióptrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'qualquer objetiva produzirá resultado idêntico.', 0);

    -- QUESTÃO 527 (arquivo quest31.txt, original Q427)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q527', N'Ao aumentar o ISO de 100 para 400, mantendo abertura constante, para preservar a mesma exposição o fotógrafo poderá', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir a velocidade do obturador em dois pontos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a velocidade do obturador em dois pontos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fechar dois pontos do diafragma obrigatoriamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar apenas o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar outro espaço de cor.', 0);

    -- QUESTÃO 528 (arquivo quest31.txt, original Q428)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q528', N'O principal objetivo da iluminação cruzada na fotografia de marcas de ferramenta é', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'evidenciar irregularidades superficiais por meio da formação controlada de sombras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar completamente reflexos.', 0);

    -- QUESTÃO 529 (arquivo quest31.txt, original Q429)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q529', N'Em uma DSLR equipada com obturador de plano focal, utilizar velocidade superior ao sincronismo máximo do flash, sem tecnologia de sincronismo em alta velocidade (HSS), pode resultar em', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento do contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminuição da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alteração dos metadados EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'parte da imagem escurecida devido ao deslocamento das cortinas do obturador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da latitude dinâmica.', 0);

    -- QUESTÃO 530 (arquivo quest31.txt, original Q430)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q530', N'Na documentação fotográfica pericial, recomenda-se verificar o histograma logo após a captura principalmente para', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'confirmar a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'medir a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'identificar a distância focal utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'verificar o modelo da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'avaliar rapidamente a distribuição tonal e detectar possível perda de detalhes por sub ou superexposição.', 1);

    -- QUESTÃO 531 (arquivo quest31.txt, original Q431)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q531', N'Durante a captura de um vestígio muito pequeno, o fotógrafo decide utilizar focus stacking. Essa técnica consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'combinar imagens obtidas com diferentes planos de foco para ampliar a área aparentemente nítida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar automaticamente o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir a objetiva macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar a necessidade de tripé.', 0);

    -- QUESTÃO 532 (arquivo quest31.txt, original Q432)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q532', N'Na fotografia digital, um pixel morto diferencia-se de um pixel quente porque', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aparece apenas em ISO elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permanece permanentemente inativo, enquanto o pixel quente normalmente manifesta brilho anormal em determinadas condições.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'altera a profundidade de bits.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'modifica a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'altera a velocidade do obturador.', 0);

    -- QUESTÃO 533 (arquivo quest31.txt, original Q433)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q533', N'Ao utilizar uma objetiva de 24 mm muito próxima de um objeto, o fotógrafo deverá esperar', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'compressão da perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução do ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exagero da perspectiva, fazendo objetos próximos parecerem proporcionalmente maiores.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminação das distorções geométricas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'redução obrigatória da profundidade de campo.', 0);

    -- QUESTÃO 534 (arquivo quest31.txt, original Q434)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q534', N'Em uma macrofotografia realizada sobre tripé, a utilização simultânea de disparador remoto e Mirror Lock-Up busca principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alterar o espaço de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir a difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'minimizar vibrações que possam comprometer a nitidez.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a velocidade do obturador.', 0);

    -- QUESTÃO 535 (arquivo quest31.txt, original Q435)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q535', N'Em relação aos metadados EXIF, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Registram apenas informações administrativas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Substituem integralmente o laudo pericial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Não podem ser gravados em arquivos JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Armazenam exclusivamente coordenadas geográficas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Registram automaticamente diversos parâmetros técnicos da captura, como abertura, velocidade e ISO.', 1);

    -- QUESTÃO 536 (arquivo quest31.txt, original Q436)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q536', N'Uma objetiva de 50 mm em uma câmera Full Frame é tradicionalmente considerada', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'objetiva normal, por apresentar ângulo de visão semelhante ao da percepção humana central.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'grande-angular.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'superteleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'olho-de-peixe.', 0);

    -- QUESTÃO 537 (arquivo quest31.txt, original Q437)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q537', N'Ao fotografar um vestígio utilizando ISO nativo da câmera, espera-se, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento obrigatório da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'melhor equilíbrio entre ruído, alcance dinâmico e qualidade da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminação completa do ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução da distância mínima de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração automática da temperatura de cor.', 0);

    -- QUESTÃO 538 (arquivo quest31.txt, original Q438)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q538', N'Na fotografia digital, o principal objetivo do filtro passa-baixa óptico (quando presente) é', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'minimizar aliasing e efeito moiré.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'corrigir aberração cromática.', 0);

    -- QUESTÃO 539 (arquivo quest31.txt, original Q439)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q539', N'Ao utilizar uma teleobjetiva de 300 mm sem tripé, uma velocidade muito baixa do obturador aumenta principalmente o risco de', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'alteração do histograma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento do flare.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'mudança da temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'trepidação causada pelo movimento da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração dos metadados EXIF.', 0);

    -- QUESTÃO 540 (arquivo quest31.txt, original Q440)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q540', N'Na documentação fotográfica pericial, além da preservação dos arquivos originais, constitui boa prática', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'excluir imediatamente as imagens desfocadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apagar os arquivos do cartão logo após a cópia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'armazenar apenas as imagens utilizadas no laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'converter todos os arquivos para JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'manter cópias redundantes, verificadas e armazenadas conforme política formal de backup.', 1);

    -- QUESTÃO 541 (arquivo quest32.txt, original Q441)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q541', N'Durante a documentação de uma cápsula deflagrada, o fotógrafo deseja preservar a máxima qualidade possível da imagem para futuras ampliações e análises. A configuração mais indicada é', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'capturar em RAW, utilizando o menor ISO compatível com a cena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'capturar apenas em JPEG com alta compressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar zoom digital para aproximar o objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar o ISO independentemente da iluminação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'fotografar apenas em modo automático.', 0);

    -- QUESTÃO 542 (arquivo quest32.txt, original Q442)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q542', N'Um flash possui Número Guia (NG) igual a 56 (ISO 100). Se o objeto está localizado a 7 metros, a abertura correta será aproximadamente', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/5,6', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/8', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/11', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/16', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/22', 0);

    -- QUESTÃO 543 (arquivo quest32.txt, original Q443)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q543', N'Na fotografia de um documento, uma imagem apresenta linhas retas próximas às bordas visivelmente curvadas para fora. Esse efeito corresponde à', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aberração cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'distorção em barril.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'vinhetagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'compressão da perspectiva.', 0);

    -- QUESTÃO 544 (arquivo quest32.txt, original Q444)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q544', N'Durante uma longa exposição, o fotógrafo observa pequenas vibrações mesmo utilizando tripé robusto. Além do disparador remoto, a medida mais eficaz para reduzir esse problema em uma DSLR é', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'abrir totalmente o diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alterar o espaço de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar o Mirror Lock-Up.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a distância focal.', 0);

    -- QUESTÃO 545 (arquivo quest32.txt, original Q445)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q545', N'Em relação aos arquivos digitais produzidos durante uma perícia, a melhor prática consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'manter apenas as fotografias selecionadas para o laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apagar imediatamente os arquivos do cartão após a transferência.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'armazenar apenas versões editadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'remover metadados para reduzir o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'preservar os arquivos originais juntamente com cópias de segurança verificadas.', 1);

    -- QUESTÃO 546 (arquivo quest32.txt, original Q446)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q546', N'Ao fotografar uma impressão papilar utilizando objetiva macro, a utilização de abertura muito grande (por exemplo, f/2.8) tende a produzir', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'profundidade de campo reduzida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento obrigatório da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminação da difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'maior alcance dinâmico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'menor fator de ampliação.', 0);

    -- QUESTÃO 547 (arquivo quest32.txt, original Q447)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q547', N'Na fotografia digital, o principal objetivo do formato RAW é', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o tamanho do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'preservar a maior quantidade possível de informações registradas pelo sensor antes do processamento definitivo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar a necessidade de pós-processamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'impedir alterações de balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substituir os metadados EXIF.', 0);

    -- QUESTÃO 548 (arquivo quest32.txt, original Q448)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q548', N'Ao utilizar uma objetiva de 14 mm muito próxima de um objeto, o fotógrafo observará principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'compressão da perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução do ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exagero das proporções entre objetos próximos e distantes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminação das distorções geométricas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento automático da profundidade de campo.', 0);

    -- QUESTÃO 549 (arquivo quest32.txt, original Q449)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q549', N'Na documentação de um local de crime durante a noite, utilizando tripé e assunto completamente imóvel, a alternativa que tende a produzir melhor qualidade de imagem é', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar ISO extremamente elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'abrir totalmente o diafragma em qualquer situação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar apenas flash frontal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'manter ISO baixo e compensar a exposição com maior tempo de obturação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar zoom digital.', 0);

    -- QUESTÃO 550 (arquivo quest32.txt, original Q450)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q550', N'A utilização de uma escala métrica junto ao vestígio permite principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'melhorar a reprodução das cores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir distorções ópticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar a necessidade de medições.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'fornecer referência dimensional confiável para análises posteriores.', 1);

    -- QUESTÃO 551 (arquivo quest32.txt, original Q451)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q551', N'Ao comparar sensores CCD e CMOS modernos, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sensores CMOS apresentam menor consumo de energia e predominam na maioria das câmeras atuais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sensores CCD sempre apresentam maior resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'sensores CMOS não utilizam fotodiodos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sensores CCD não gravam arquivos RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ambos são tecnologicamente idênticos.', 0);

    -- QUESTÃO 552 (arquivo quest32.txt, original Q452)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q552', N'Em uma sequência contínua de disparos RAW, a velocidade de gravação do cartão influencia principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o tempo necessário para liberar espaço no buffer.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o fator de corte.', 0);

    -- QUESTÃO 553 (arquivo quest32.txt, original Q453)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q553', N'Durante a análise do histograma RGB, apenas o canal vermelho apresenta clipping. Essa situação indica que', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'toda a fotografia perdeu detalhes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ocorreu obrigatoriamente erro de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'houve perda de informação nas altas luzes do canal vermelho.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a imagem está subexposta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a resolução foi reduzida.', 0);

    -- QUESTÃO 554 (arquivo quest32.txt, original Q454)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q554', N'Ao fotografar utilizando teleobjetiva de 400 mm sem estabilização e sem tripé, a principal forma de reduzir o risco de trepidação consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar apenas foco manual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'diminuir a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar velocidade de obturação suficientemente elevada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o formato para RAW.', 0);

    -- QUESTÃO 555 (arquivo quest32.txt, original Q455)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q555', N'Na preservação dos registros fotográficos periciais, a cadeia de custódia busca garantir', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas o armazenamento em nuvem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'exclusivamente a impressão das fotografias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'somente a identificação do fotógrafo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas a proteção contra perda física dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'autenticidade, integridade, rastreabilidade e confiabilidade dos registros.', 1);

    -- QUESTÃO 556 (arquivo quest32.txt, original Q456)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q556', N'Em macrofotografia, o uso de focus stacking torna-se especialmente vantajoso porque', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'amplia a profundidade de campo aparente pela combinação de diferentes planos de foco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumenta automaticamente a resolução do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduz o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'elimina completamente a difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumenta a distância focal.', 0);

    -- QUESTÃO 557 (arquivo quest32.txt, original Q457)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q557', N'O principal papel do conversor analógico-digital (A/D) em uma câmera digital é', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'controlar o obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'converter os sinais elétricos produzidos pelos fotodiodos em informações digitais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'corrigir a distorção em barril.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'controlar o foco automático.', 0);

    -- QUESTÃO 558 (arquivo quest32.txt, original Q458)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q558', N'Na fotografia de uma fachada, uma objetiva tilt-shift é utilizada principalmente para', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a luminosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ampliar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar a convergência das linhas de perspectiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar aberração cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substituir objetivas macro.', 0);

    -- QUESTÃO 559 (arquivo quest32.txt, original Q459)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q559', N'Ao utilizar abertura f/22 para maximizar a profundidade de campo, o fotógrafo deve considerar que', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'haverá aumento automático da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a profundidade de campo diminuirá.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'desaparecerão todas as aberrações ópticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a difração poderá reduzir a nitidez fina da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a distância focal será alterada.', 0);

    -- QUESTÃO 560 (arquivo quest32.txt, original Q460)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q560', N'Ao finalizar uma documentação fotográfica pericial, antes de formatar o cartão de memória, a medida mais segura é', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apagar apenas as imagens desfocadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'converter todos os arquivos para JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'remover os metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'copiar novamente apenas as imagens utilizadas no laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'confirmar a integridade das cópias de segurança e a correta transferência de todos os arquivos.', 1);

    -- QUESTÃO 561 (arquivo quest33.txt, original Q461)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q561', N'Durante a documentação de uma arma de fogo oxidada, o fotógrafo pretende evidenciar pequenas inscrições superficiais desgastadas. A técnica mais indicada consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar iluminação rasante, explorando sombras para destacar os relevos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar apenas flash frontal em potência máxima.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar o ISO para 6400.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fotografar exclusivamente em JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aplicar nitidez máxima diretamente na câmera.', 0);

    -- QUESTÃO 562 (arquivo quest33.txt, original Q462)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q562', N'Uma câmera consegue registrar 15 arquivos RAW consecutivos antes da redução da velocidade de disparo. Após alguns segundos, a velocidade normal retorna. Esse comportamento ocorre porque', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o sensor reduz temporariamente sua resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o buffer é gradualmente liberado à medida que os arquivos são gravados no cartão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a objetiva altera automaticamente a abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o ISO retorna ao valor nativo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o processador recalibra o balanço de branco.', 0);

    -- QUESTÃO 563 (arquivo quest33.txt, original Q463)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q563', N'Na fotografia macro, um dos principais motivos para utilizar um trilho micrométrico (focusing rail) é', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'realizar deslocamentos extremamente precisos da câmera para ajuste do plano de foco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar o fator de extensão.', 0);

    -- QUESTÃO 564 (arquivo quest33.txt, original Q464)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q564', N'Durante uma fotografia em longa exposição, o fotógrafo utiliza tripé, disparador remoto e Mirror Lock-Up, mas observa imagens ligeiramente borradas devido ao vento que movimenta o vestígio. A solução mais adequada é', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar apenas a resolução da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alterar o espaço de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar abertura máxima obrigatoriamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir o tempo de exposição, compensando com ISO ou abertura quando tecnicamente possível.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substituir o formato RAW por JPEG.', 0);

    -- QUESTÃO 565 (arquivo quest33.txt, original Q465)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q565', N'Na preservação dos registros fotográficos digitais, constitui procedimento recomendável', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'excluir os arquivos RAW após gerar TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apagar o cartão logo após copiar as imagens.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'armazenar apenas as fotografias inseridas no laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'manter somente cópias na nuvem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'conservar os arquivos originais e manter cópias redundantes verificadas periodicamente.', 1);

    -- QUESTÃO 566 (arquivo quest33.txt, original Q466)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q566', N'Ao fotografar um documento para reprodução fiel, a objetiva mais indicada costuma ser', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'uma objetiva macro ou normal de boa qualidade óptica, com a câmera paralela ao documento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'uma olho-de-peixe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'uma teleobjetiva de 600 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'uma catadióptrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'qualquer objetiva produzirá resultado equivalente.', 0);

    -- QUESTÃO 567 (arquivo quest33.txt, original Q467)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q567', N'O principal benefício de fotografar utilizando o ISO nativo da câmera, sempre que possível, é', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'eliminar completamente o ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'obter melhor equilíbrio entre ruído, alcance dinâmico e qualidade de imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar automaticamente a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir a ampliação da objetiva macro.', 0);

    -- QUESTÃO 568 (arquivo quest33.txt, original Q468)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q568', N'Durante a análise de um documento fotografado com objetiva grande-angular muito próxima da folha, observa-se deformação das linhas periféricas. Esse fenômeno corresponde principalmente à', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aberração cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'distorção geométrica causada pela objetiva e pela perspectiva de captura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'pixel quente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'flare.', 0);

    -- QUESTÃO 569 (arquivo quest33.txt, original Q469)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q569', N'Ao utilizar uma teleobjetiva de 300 mm sem estabilização, fotografando manualmente, uma velocidade de 1/30 s tende a', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir o ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'melhorar a nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar significativamente o risco de trepidação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar a profundidade de bits.', 0);

    -- QUESTÃO 570 (arquivo quest33.txt, original Q470)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q570', N'Na cadeia de custódia aplicada aos registros fotográficos digitais, a rastreabilidade permite', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o tamanho dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'eliminar metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'substituir o laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'dispensar backups.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reconstruir o histórico de produção, armazenamento e manipulação dos arquivos.', 1);

    -- QUESTÃO 571 (arquivo quest33.txt, original Q471)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q571', N'Ao utilizar uma objetiva de 85 mm para retrato técnico, espera-se, em regra,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'perspectiva mais natural e menor distorção facial do que em grandes-angulares.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento automático da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'redução da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminação da difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração do fator de corte.', 0);

    -- QUESTÃO 572 (arquivo quest33.txt, original Q472)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q572', N'Na fotografia digital, o principal objetivo da calibração periódica do monitor é', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a velocidade de edição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'garantir representação consistente e fiel das cores e tonalidades.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a resolução das imagens.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir o tamanho dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar os metadados EXIF.', 0);

    -- QUESTÃO 573 (arquivo quest33.txt, original Q473)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q573', N'Ao analisar o histograma RGB de uma fotografia, verifica-se clipping apenas no canal verde. Isso significa que', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'toda a fotografia está superexposta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'houve perda de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ocorreu perda de informação tonal no canal verde, sem que isso implique necessariamente clipping nos demais canais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a imagem possui ruído excessivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o balanço de branco está incorreto.', 0);

    -- QUESTÃO 574 (arquivo quest33.txt, original Q474)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q574', N'Na macrofotografia, a utilização de Live View ampliado auxilia principalmente porque', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduz automaticamente o ruído.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumenta a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'elimina a necessidade de tripé.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'facilita a obtenção de foco manual extremamente preciso.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumenta a velocidade do obturador.', 0);

    -- QUESTÃO 575 (arquivo quest33.txt, original Q475)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q575', N'Ao finalizar uma documentação fotográfica pericial, antes de reutilizar o cartão de memória, recomenda-se', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apagar apenas as fotografias desfocadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'converter todos os arquivos para JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'remover os metadados EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'copiar novamente apenas as imagens utilizadas no laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'confirmar que todas as imagens foram copiadas com sucesso e que os backups foram concluídos adequadamente.', 1);

    -- QUESTÃO 576 (arquivo quest33.txt, original Q476)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q576', N'Na fotografia de uma superfície metálica polida, o uso de um filtro polarizador pode contribuir para', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir determinados reflexos provenientes de superfícies não metálicas presentes na cena e melhorar a visualização em situações específicas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar completamente todos os reflexos metálicos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substituir a iluminação difusa.', 0);

    -- QUESTÃO 577 (arquivo quest33.txt, original Q477)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q577', N'Na fotografia digital, a profundidade de bits está diretamente relacionada', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'à velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao número de níveis tonais que podem ser representados.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao fator de corte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'à distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao tipo de visor.', 0);

    -- QUESTÃO 578 (arquivo quest33.txt, original Q478)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q578', N'Ao utilizar uma objetiva tilt-shift na fotografia de edificações, o principal benefício consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a luminosidade máxima.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ampliar o ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar a perspectiva, reduzindo a convergência aparente das linhas verticais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a profundidade de campo em qualquer situação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar completamente a distorção óptica.', 0);

    -- QUESTÃO 579 (arquivo quest33.txt, original Q479)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q579', N'Na fotografia macro, fechar excessivamente o diafragma para obter maior profundidade de campo pode resultar em', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento automático da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução do fator de extensão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminação do flare.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'perda de nitidez devido ao fenômeno da difração.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração do padrão Bayer.', 0);

    -- QUESTÃO 580 (arquivo quest33.txt, original Q480)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q580', N'Na documentação fotográfica pericial, a confiabilidade técnica dos registros depende principalmente da integração entre técnica fotográfica, metodologia de trabalho, preservação dos arquivos originais e', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilização obrigatória de sensores Full Frame.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'emprego exclusivo de objetivas fixas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'impressão em papel fotográfico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'gravação apenas em RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'manutenção da autenticidade, integridade e rastreabilidade dos registros ao longo de todo o fluxo de trabalho.', 1);

    COMMIT TRANSACTION;
    PRINT 'Lote de 480 questões inserido com sucesso (Q101 a Q580).';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO
