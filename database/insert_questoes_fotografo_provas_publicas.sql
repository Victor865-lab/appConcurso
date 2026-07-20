/* =========================================================
   Seed: Questões de Fotografia extraídas de provas públicas
   reais para o cargo de Fotógrafo.

   Fontes (apenas questões de CONHECIMENTOS ESPECÍFICOS DE
   FOTOGRAFIA — português, matemática, informática, legislação
   municipal/administrativa e conhecimentos gerais foram
   excluídos mesmo quando apareciam no mesmo bloco):

     - Apucarana/PR   — FAUEL     — 2022 — Edital 017/2022 — Q31 a Q40 (10 questões)
     - Guaratuba/PR   — UNIOESTE  — 2022 — Edital 002/2022 — Q21 a Q30 (10 questões)
     - Itatiba/SP (Câmara Municipal) — VUNESP — 2015 — Q31 a Q50 (20 questões)
     - Várzea Grande/MT — UFMT   — 2018 — Edital 02/2017 (prova aplicada em 25/02/2018),
       cargo "Agente de Desenvolvimento Econômico e Social — Perfil: Fotógrafo" — Q31 a Q40
       (10 questões). Gabarito-fonte: PRELIMINAR (não foi localizado o definitivo pós-recursos).

   NÃO incluídas (ver aviso ao usuário): Dourados/MS (prova em
   PDF escaneado, sem OCR disponível) e Juruti/PA (a prova não
   contém nenhuma questão específica de fotografia).

   Script ADITIVO: temas são reaproveitados de forma idempotente
   (IF NOT EXISTS); cada questão + suas alternativas são inseridas
   em uma transação própria, usando SCOPE_IDENTITY() para ligar
   a alternativa à questão recém-criada — mesmo padrão de
   database/schema.sql e src/models/questaoModel.js.
   ========================================================= */

USE ConcursosDB;
GO

/* ================= TEMAS (idempotente) ================= */

IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'História da Fotografia')
    INSERT INTO dbo.temas (nome) VALUES ('História da Fotografia');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Componentes da Câmera')
    INSERT INTO dbo.temas (nome) VALUES ('Componentes da Câmera');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Balanço de Branco')
    INSERT INTO dbo.temas (nome) VALUES ('Balanço de Branco');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Composição e Enquadramento')
    INSERT INTO dbo.temas (nome) VALUES ('Composição e Enquadramento');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'ISO')
    INSERT INTO dbo.temas (nome) VALUES ('ISO');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Obturador')
    INSERT INTO dbo.temas (nome) VALUES ('Obturador');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Fotometria')
    INSERT INTO dbo.temas (nome) VALUES ('Fotometria');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Objetivas')
    INSERT INTO dbo.temas (nome) VALUES ('Objetivas');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Edição de Imagens')
    INSERT INTO dbo.temas (nome) VALUES ('Edição de Imagens');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Diafragma')
    INSERT INTO dbo.temas (nome) VALUES ('Diafragma');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Flash')
    INSERT INTO dbo.temas (nome) VALUES ('Flash');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Tipos de Arquivos')
    INSERT INTO dbo.temas (nome) VALUES ('Tipos de Arquivos');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Filtros')
    INSERT INTO dbo.temas (nome) VALUES ('Filtros');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'RGB')
    INSERT INTO dbo.temas (nome) VALUES ('RGB');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Triângulo de Exposição')
    INSERT INTO dbo.temas (nome) VALUES ('Triângulo de Exposição');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Histograma')
    INSERT INTO dbo.temas (nome) VALUES ('Histograma');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Sensor e Fator de Corte')
    INSERT INTO dbo.temas (nome) VALUES ('Sensor e Fator de Corte');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Tipos de Luzes')
    INSERT INTO dbo.temas (nome) VALUES ('Tipos de Luzes');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Fotografia Analógica')
    INSERT INTO dbo.temas (nome) VALUES ('Fotografia Analógica');
IF NOT EXISTS (SELECT 1 FROM dbo.temas WHERE nome = 'Luz')
    INSERT INTO dbo.temas (nome) VALUES ('Luz');
GO

/* =========================================================
   APUCARANA/PR — FAUEL — 2022 — Edital 017/2022 — Q31 a Q40
   ========================================================= */

BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idTema INT, @idQuestao INT;

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'História da Fotografia');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('FAUEL 2022 - Apucarana/PR - Q31', N'Assinale a alternativa INCORRETA sobre a história da fotografia e sua evolução.', 1, @idTema, 'FAUEL', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'O primeiro registro fotográfico impresso foi feito na França em 1826, onde uma paisagem foi gravada sobre uma placa de estanho.', 0),
    (@idQuestao, 'B', N'A descoberta da fotografia impressa foi acidental e sem utilizar processos físico-químicos.', 1),
    (@idQuestao, 'C', N'Em 1908, os irmãos Lumière apresentaram uma técnica em que chapas sobrepostas isolavam somente uma cor primária em cada chapa, o que possibilitava a criação de imagens com cor.', 0),
    (@idQuestao, 'D', N'A "câmera obscura" ou Pinhole foi a precursora das câmeras fotográficas.', 0),
    (@idQuestao, 'E', N'Até o desenvolvimento dos filmes em rolo, também foram usadas chapas com película de iodeto de prata sensíveis à luz para a gravação de imagens.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Componentes da Câmera');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('FAUEL 2022 - Apucarana/PR - Q32', N'Com o avanço da tecnologia aplicada à fotografia digital foram introduzidas ao mercado as câmeras Mirrorless. Qual a principal diferença em comparação às câmeras DSLR?', 1, @idTema, 'FAUEL', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'A ausência de obturador de alta velocidade, o que impede a captação de fotos em movimento.', 0),
    (@idQuestao, 'B', N'A ausência de sensores analógicos para foco manual em lentes objetivas.', 0),
    (@idQuestao, 'C', N'A ausência de viewfinder digital que mostra a imagem real captada pela câmera.', 0),
    (@idQuestao, 'D', N'A ausência de espelho móvel no caminho óptico até o visor.', 1),
    (@idQuestao, 'E', N'A ausência de sensores digitais que interpolam a resolução da imagem no caminho óptico.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Balanço de Branco');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('FAUEL 2022 - Apucarana/PR - Q33', N'O Kelvinômetro é o equipamento utilizado para:', 1, @idTema, 'FAUEL', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'avaliar a temperatura de cor de fontes luminosas.', 1),
    (@idQuestao, 'B', N'alterar a quantidade de ruído em uma imagem.', 0),
    (@idQuestao, 'C', N'tornar uma fonte de luz difusa em estúdio.', 0),
    (@idQuestao, 'D', N'medir a distância focal de uma lente.', 0),
    (@idQuestao, 'E', N'medir a porcentagem de desfoque de uma imagem.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Composição e Enquadramento');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('FAUEL 2022 - Apucarana/PR - Q34', N'Sobre a Regra dos Terços aplicada à fotografia, analise as afirmativas: I - Uma técnica de composição derivada da Proporção Áurea. II - O fotógrafo traça quatro linhas imaginárias na imagem e posiciona o objeto fotografado principal em um dos pontos formados por suas intersecções. III - Foi criada com a introdução de tecnologias digitais na fotografia. IV - Tem como princípio a simetria e espelhamento dos elementos da imagem. Estão CORRETAS:', 1, @idTema, 'FAUEL', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'somente as afirmativas I, II e IV.', 0),
    (@idQuestao, 'B', N'somente as afirmativas I e III.', 0),
    (@idQuestao, 'C', N'somente as afirmativas I, II e III.', 0),
    (@idQuestao, 'D', N'somente as afirmativas I e II.', 1),
    (@idQuestao, 'E', N'todas as afirmativas.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'ISO');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('FAUEL 2022 - Apucarana/PR - Q35', N'O que determina a sensibilidade do sensor de uma câmera à luz é o ISO. Essa configuração, juntamente com diferentes combinações de diafragma e obturador podem resultar em imagens subexpostas, normais ou superexpostas. Levando em consideração somente à mudança de sensibilidade do sensor, o aumento do número do ISO resultará em:', 1, @idTema, 'FAUEL', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'diminuição da sensibilidade à luz e imagem desfocada.', 0),
    (@idQuestao, 'B', N'diminuição da sensibilidade à luz e imagem subexposta.', 0),
    (@idQuestao, 'C', N'aumento da sensibilidade à luz e aumento do ruído na definição da imagem.', 1),
    (@idQuestao, 'D', N'aumento da sensibilidade à luz e aumento da saturação da imagem.', 0),
    (@idQuestao, 'E', N'aumento da sensibilidade à luz e diminuição da saturação e ruído na imagem.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Obturador');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('FAUEL 2022 - Apucarana/PR - Q36', N'Em um evento esportivo, para a captura de uma imagem nítida congelada de um atleta em movimento é necessário que a câmera esteja com a configuração do ___________ em _____________ velocidade e compensação com __________ do __________ para a exposição ideal. Assinale a alternativa com as palavras que preenchem CORRETAMENTE a frase anterior.', 1, @idTema, 'FAUEL', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'ISO, baixa, fechamento, obturador.', 0),
    (@idQuestao, 'B', N'ISO, alta, fechamento, diafragma.', 0),
    (@idQuestao, 'C', N'diafragma, alta, fechamento, obturador.', 0),
    (@idQuestao, 'D', N'obturador, baixa, abertura, ISO.', 0),
    (@idQuestao, 'E', N'obturador, alta, abertura, diafragma.', 1);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Fotometria');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('FAUEL 2022 - Apucarana/PR - Q37', N'O modo de medição da luz, chamado de fotometria, presente nas câmeras digitais pode ser alterado para se obter diferentes resultados na fotografia digital. O modo que divide a cena em diferentes zonas e que calcula o brilho médio da cena a ser fotografada é conhecido como:', 1, @idTema, 'FAUEL', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Modo Pontual.', 0),
    (@idQuestao, 'B', N'Modo Matricial.', 1),
    (@idQuestao, 'C', N'Modo Isolado.', 0),
    (@idQuestao, 'D', N'Modo Parcial.', 0),
    (@idQuestao, 'E', N'Modo Estilizado.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Objetivas');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('FAUEL 2022 - Apucarana/PR - Q38', N'Uma lente objetiva é considerada normal quando:', 1, @idTema, 'FAUEL', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'seu diâmetro ultrapassa 70 mm.', 0),
    (@idQuestao, 'B', N'sua distância focal é inferior a 10 mm.', 0),
    (@idQuestao, 'C', N'possui efeito "olho de peixe" ou "fisheye".', 0),
    (@idQuestao, 'D', N'capta imagens com distorção mínima semelhante à visão humana.', 1),
    (@idQuestao, 'E', N'possui efeito de aproximação e achatamento da imagem captada.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Objetivas');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('FAUEL 2022 - Apucarana/PR - Q39', N'O fenômeno pelo qual a luz muda de direção quando passa de um meio a outro presente nas lentes fotográficas é chamado de:', 1, @idTema, 'FAUEL', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Dispersão Luminosa.', 0),
    (@idQuestao, 'B', N'Reflexão Luminosa.', 0),
    (@idQuestao, 'C', N'Refração Luminosa.', 1),
    (@idQuestao, 'D', N'Difusão Luminosa.', 0),
    (@idQuestao, 'E', N'Convergência Luminosa.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Edição de Imagens');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('FAUEL 2022 - Apucarana/PR - Q40', N'Nos softwares e aplicativos de edição de imagem o brilho se refere a intensidade da luz em uma foto e a escala entre os tons mais luminosos e os mais escuros de uma imagem é chamada de:', 1, @idTema, 'FAUEL', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'sombreamento.', 0),
    (@idQuestao, 'B', N'saturação.', 0),
    (@idQuestao, 'C', N'ruído.', 0),
    (@idQuestao, 'D', N'contraste.', 1),
    (@idQuestao, 'E', N'exposição.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

/* =========================================================
   GUARATUBA/PR — UNIOESTE — 2022 — Edital 002/2022 — Q21 a Q30
   ========================================================= */

BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idTema INT, @idQuestao INT;

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Objetivas');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UNIOESTE 2022 - Guaratuba/PR - Q21', N'A fotografia digital se popularizou e cada vez mais pessoas têm acesso à compra de equipamentos profissionais. Sendo assim, as linhas de câmeras produzidas por grandes marcas, como CANON e NIKON, destacaram-se por muito tempo, sendo responsáveis pelo registro de toda uma época. As câmeras profissionais de linhas como a CANON 5D Mark II ou a câmera de entrada CANON 80D possuem uma característica marcante que difere das câmeras semiprofissionais (por exemplo Nikon coolpix). Qual é essa diferença?', 1, @idTema, 'UNIOESTE', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Velocidade de exposição', 0),
    (@idQuestao, 'B', N'ISO ajustável', 0),
    (@idQuestao, 'C', N'Abertura de diafragma', 0),
    (@idQuestao, 'D', N'Lentes/Objetivas Intercambiáveis', 1),
    (@idQuestao, 'E', N'Balanço de brancos', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'ISO');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UNIOESTE 2022 - Guaratuba/PR - Q22', N'O ISO é muito importante na hora de fotografar. Em tempos de câmeras fotográficas analógicas, o ISO era chamado de ASA e variava entre 100, 200 e 400. Hoje em dia, as câmeras profissionais têm ajustes de ISO bem superiores. Qual é a principal definição do ISO?', 1, @idTema, 'UNIOESTE', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Balanço de brancos conforme o ambiente.', 0),
    (@idQuestao, 'B', N'Velocidade relativa à abertura do obturador.', 0),
    (@idQuestao, 'C', N'Paleta de cor específica PANTONE.', 0),
    (@idQuestao, 'D', N'Sensibilidade do sensor em relação à quantidade de luz, ao ruído do sensor e à aparência da imagem resultante como parâmetros interdependentes.', 1),
    (@idQuestao, 'E', N'Sensibilidade do flash ao iluminar o ambiente.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Fotometria');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UNIOESTE 2022 - Guaratuba/PR - Q23', N'É um aparelho que mede a intensidade da luz (por exemplo, para adequá-la às necessidades específicas de um fotógrafo ou de um cineasta) através de parâmetros fotográficos. Este converte a luz em corrente elétrica, podendo ser medida em valores referentes à velocidade de obturação ou abertura de diafragma ("f"). Essa é a definição de qual equipamento?', 1, @idTema, 'UNIOESTE', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Fotômetro', 1),
    (@idQuestao, 'B', N'Flash', 0),
    (@idQuestao, 'C', N'Rebatedor', 0),
    (@idQuestao, 'D', N'RingLight', 0),
    (@idQuestao, 'E', N'Softbox', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Edição de Imagens');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UNIOESTE 2022 - Guaratuba/PR - Q24', N'É um Software específico para edição rápida e armazenamento de imagens:', 1, @idTema, 'UNIOESTE', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Adobe Illustrator', 0),
    (@idQuestao, 'B', N'CorelDraw', 0),
    (@idQuestao, 'C', N'Adobe Lightroom', 1),
    (@idQuestao, 'D', N'Adobe Audition', 0),
    (@idQuestao, 'E', N'Adobe InDesign', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Tipos de Arquivos');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UNIOESTE 2022 - Guaratuba/PR - Q25', N'Os formatos de arquivos mais popularmente usados para edição, tratamento ou armazenamento de imagens são:', 1, @idTema, 'UNIOESTE', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'CDR', 0),
    (@idQuestao, 'B', N'MP4 e MP3', 0),
    (@idQuestao, 'C', N'JPEG e RAW', 1),
    (@idQuestao, 'D', N'AI e PDF', 0),
    (@idQuestao, 'E', N'DOCX', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'História da Fotografia');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UNIOESTE 2022 - Guaratuba/PR - Q26', N'Em 1826, é registrada a primeira fotografia da história. Também chamada de heliografia, na época, a nova tecnologia foi revolucionária, e retratou um telhado francês. Quem foi o responsável pela primeira fotografia da história?', 1, @idTema, 'UNIOESTE', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Louis Daguerre', 0),
    (@idQuestao, 'B', N'Sebastião Salgado', 0),
    (@idQuestao, 'C', N'Robert Capa', 0),
    (@idQuestao, 'D', N'Joseph Nicéphore Niepce', 1),
    (@idQuestao, 'E', N'George Eastman', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Diafragma');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UNIOESTE 2022 - Guaratuba/PR - Q27', N'A profundidade de campo é um efeito muito utilizado por fotógrafos de diversas áreas. Sobre profundidade de campo, é CORRETO afirmar: I - O ISO correto é o principal responsável pelo desfoque da profundidade de campo. II - Profundidade de campo é o efeito de desfocar o fundo, destacando a pessoa que queremos fotografar. III - A Abertura é a principal responsável para controle da profundidade de campo.', 1, @idTema, 'UNIOESTE', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Apenas a afirmação I está correta.', 0),
    (@idQuestao, 'B', N'Apenas as afirmações II e III estão corretas.', 1),
    (@idQuestao, 'C', N'Apenas as afirmações I e II estão corretas.', 0),
    (@idQuestao, 'D', N'Todas as afirmações estão corretas.', 0),
    (@idQuestao, 'E', N'Nenhuma das afirmações está correta.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Objetivas');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UNIOESTE 2022 - Guaratuba/PR - Q28', N'A fotografia Macro se destaca como uma ótima técnica, tanto profissionalmente como para fotógrafos amadores. Qual é a definição CORRETA da Fotografia Macro?', 1, @idTema, 'UNIOESTE', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Fotografia de luz intensa, com balanço de branco carregado.', 0),
    (@idQuestao, 'B', N'Fotografia voltada aos pequenos objetos, mostrando aos nossos olhos detalhes muitas vezes invisíveis a olho nu, sendo provavelmente este um dos motivos do seu encanto.', 1),
    (@idQuestao, 'C', N'Fotografia feita com apoio de iluminação softbox e em ambiente fechado, com fundos diversos.', 0),
    (@idQuestao, 'D', N'Fotografia utilizando fundo infinito na cor verde, podendo assim ser modificado na edição.', 0),
    (@idQuestao, 'E', N'Nenhuma das alternativas anteriores.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Diafragma');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UNIOESTE 2022 - Guaratuba/PR - Q29', N'Luz e Abertura são essenciais para uma boa fotografia. Marque a alternativa INCORRETA:', 1, @idTema, 'UNIOESTE', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Abertura f18 é considerada alta abertura.', 0),
    (@idQuestao, 'B', N'O tempo que o obturador fica aberto interfere na exposição da foto.', 0),
    (@idQuestao, 'C', N'Exposição se refere à quantia de luz que entra no sensor de sua câmera.', 0),
    (@idQuestao, 'D', N'A fotografia é considerada "estourada" quando o sensor capta menos luz do que deveria.', 1),
    (@idQuestao, 'E', N'ISO 800, f1.4, 1/400 gera uma fotografia mais clara que ISO 100, f3.2, 1/200.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Flash');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UNIOESTE 2022 - Guaratuba/PR - Q30', N'Eventos noturnos são um desafio para muitos fotógrafos, ainda mais quando se trata de iluminar devidamente o cenário e o assunto, entregando um resultado satisfatório para o cliente final. É possível acertar na fotografia, ao:', 1, @idTema, 'UNIOESTE', 2022);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Usar um flash dedicado e um rebatedor, realçando a luz natural do assunto.', 0),
    (@idQuestao, 'B', N'Utilizar o flash e aumentar a abertura do diafragma.', 0),
    (@idQuestao, 'C', N'Aumentar o ISO.', 0),
    (@idQuestao, 'D', N'Diminuir a abertura do diafragma e usar um flash.', 0),
    (@idQuestao, 'E', N'Diminuir a velocidade do obturador para captar a luz local e usar o flash para iluminar o assunto.', 1);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

/* =========================================================
   ITATIBA/SP (Câmara Municipal) — VUNESP — 2015 — Q31 a Q50
   ========================================================= */

BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idTema INT, @idQuestao INT;

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'História da Fotografia');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q31', N'Nosso país deve a um jovem francês, que passa a viver no Rio de Janeiro em meados dos anos vinte do séc. XIX, o início da pesquisa e desenvolvimento da fotografia no Brasil. Trata-se de', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Henri Cartier-Bresson.', 0),
    (@idQuestao, 'B', N'Hercule Florence.', 1),
    (@idQuestao, 'C', N'Jacques Lartigue.', 0),
    (@idQuestao, 'D', N'Louis Daguerre.', 0),
    (@idQuestao, 'E', N'Jean Manzon.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Componentes da Câmera');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q32', N'No glossário da fotografia técnica, os termos SLR e DSLR referem-se, respectivamente, a', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'câmera reflex com sensor único (single) e câmera reflex com sensor duplo (double).', 0),
    (@idQuestao, 'B', N'câmera analógica reflex com sensor full-frame (35 mm) e câmera digital reflex com sensor wide-screen (16:9).', 0),
    (@idQuestao, 'C', N'câmera digital reflex com sensor do tipo CCD e câmera digital reflex com sensor do tipo CMOS.', 0),
    (@idQuestao, 'D', N'câmera analógica reflex com encaixe para uma objetiva e câmera digital reflex com encaixe para uma objetiva.', 1),
    (@idQuestao, 'E', N'câmera analógica reflex com objetiva de distância focal fixa e câmera digital reflex com objetiva de distância focal variável (zoom).', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Balanço de Branco');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q33', N'(Questão com quadro/imagem de apoio.) A escala "temperatura de cor" expressa', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'a predominância de determinadas frequências na emissão de luz correspondente ao espectro de luz visível. A unidade de medida é o grau Kelvin.', 1),
    (@idQuestao, 'B', N'as diferentes cargas de energia elétrica geradas por um potenciômetro (dimmer) no acionamento de um refletor de luz artificial. A unidade de medida é o Watt.', 0),
    (@idQuestao, 'C', N'os diferentes níveis de energia térmica gerados pelas lâmpadas incandescentes sob diferentes cargas de potência elétrica. A unidade de medida é o grau Celsius.', 0),
    (@idQuestao, 'D', N'a variação em consumo de energia por unidade de tempo para diferentes fontes de iluminação, desde lâmpadas de tungstênio a lâmpadas de HMI. A unidade de medida é o Quilowatt/hora.', 0),
    (@idQuestao, 'E', N'a sensação psicológica transmitida pela cor. Cores quentes, que nos transmitem a sensação de calor e aconchego, têm maior temperatura de cor. Cores frias, que nos transmitem a sensação de isolamento e frio, têm menor temperatura de cor. A unidade de medida é o QE.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'ISO');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q34', N'(Questão com quadro de apoio.) Na exposição fotográfica, os valores expressos pela escala ISO (International Standards Organization), em fotografia, determinam', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'maior sensibilidade à luz, com decréscimo de ruído, maior seja o valor do número ISO selecionado.', 0),
    (@idQuestao, 'B', N'maior tempo de exposição à luz, com acréscimo de ruído, maior seja o valor do número ISO selecionado.', 0),
    (@idQuestao, 'C', N'maior sensibilidade à luz, com acréscimo de ruído, maior seja o valor do número ISO selecionado.', 1),
    (@idQuestao, 'D', N'menor tempo de exposição à luz, com decréscimo de ruído, maior seja o valor do número ISO selecionado.', 0),
    (@idQuestao, 'E', N'menor sensibilidade à luz, com acréscimo de ruído, menor seja o valor do número ISO selecionado.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Flash');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q35', N'A potência de um flash eletrônico portátil é, tecnicamente, expressa por um número-guia (guide-number, GN). Quanto mais alto o número, mais potente é o flash. Utilizando-se um flash com número guia fixado em metros de valor 28, qual será a abertura solicitada pelo fotômetro para se fotografar um assunto distante 7 metros do plano focal da câmera (com ajuste ISO 100)?', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'5.6', 0),
    (@idQuestao, 'B', N'8', 0),
    (@idQuestao, 'C', N'2.8', 0),
    (@idQuestao, 'D', N'4', 1),
    (@idQuestao, 'E', N'2', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Diafragma');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q36', N'Em fotografia, define-se "diafragma" como a área', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'da abertura pela qual a luz atravessa a objetiva e expõe o sensor nas câmeras digitais, ou o fotograma nas câmeras fotoquímicas.', 1),
    (@idQuestao, 'B', N'do sensor (nas câmeras digitais), ou do fotograma (nas câmeras fotoquímicas), que recebe a luz que atravessa a objetiva para formar a imagem.', 0),
    (@idQuestao, 'C', N'do sensor (ou do fotograma) que recebe a informação luminosa, independentemente da distância focal da objetiva. Quanto maior o valor numérico do diafragma, menor a área do sensor (ou do fotograma) e vice-versa.', 0),
    (@idQuestao, 'D', N'do primeiro elemento óptico de uma objetiva, independentemente da sua distância focal.', 0),
    (@idQuestao, 'E', N'da abertura pela qual a luz é desviada para a formação da imagem no visor (viewfinder), ou no LCD (liquid crystal display), que se obstrui no momento do registro da imagem no sensor.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Obturador');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q37', N'O tempo de exposição do fotograma (ou do sensor) atua significativamente na transposição de um assunto em movimento para uma imagem estática, pois', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'quanto maior o tempo em que o obturador permanece aberto, maior será o tempo de registro do assunto no quadro, suficiente para a captação da imagem sem que o assunto saia do enquadramento.', 0),
    (@idQuestao, 'B', N'quanto menor o tempo em que o obturador permanece aberto, menor será o tempo de registro do assunto no sensor e mais nítido o assunto se mostrará.', 1),
    (@idQuestao, 'C', N'independentemente do tempo em que o obturador permanece aberto, o registro será em um curto intervalo de tempo, pois o assunto se encontra em movimento e não estático.', 0),
    (@idQuestao, 'D', N'quanto maior o tempo em que o obturador permanece aberto, maior será o tempo de registro do assunto no quadro, impossibilitando a subexposição e falta de nitidez na imagem.', 0),
    (@idQuestao, 'E', N'independentemente do tempo em que o obturador permanece aberto, o registro se fará apenas no intervalo de tempo em que o espelho estará se levantando, permitindo a chegada dos raios luminosos ao sensor.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Filtros');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q38', N'O diretor de fotografia mexicano Gabriel Figueroa (1907-1997) ficou conhecido profissionalmente durante os anos 30/40 por sua fotografia em preto e branco de grande dramaticidade, com grande relação de contraste. Como recurso, para se obter tal resultado nos enquadramentos em externas, era comum o uso do filtro', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'de densidade neutra, no intuito de elevar o contraste entre zonas de grande intensidade luminosa e zonas de sombra.', 0),
    (@idQuestao, 'B', N'de conversão âmbar da série Wratten 85, pois as películas eram balanceadas para luz de tungstênio e, em externas, as imagens eram captadas sob luz do dia.', 0),
    (@idQuestao, 'C', N'azul, no intuito de favorecer a passagem das ondas eletromagnéticas referentes à cor azul refletida pelo céu e incrementar o contraste com as nuvens.', 0),
    (@idQuestao, 'D', N'de conversão azul da série Wratten 80, pois as películas eram balanceadas para luz de tungstênio e, em externas, as imagens eram captadas sob luz do dia.', 0),
    (@idQuestao, 'E', N'amarelo, no intuito de absorver em maior intensidade as ondas eletromagnéticas referentes à cor azul refletida pelo céu e incrementar o contraste com as nuvens.', 1);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'RGB');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q39', N'(Questão com imagem de apoio.) A fotografia foi captada com "luz branca", cuja emissão se distribui ao longo da totalidade do espectro visível (400 nm a 700 nm). Admitindo-se que a cor vermelha do chapéu corresponda à reflexão de luz relativa apenas ao intervalo para o vermelho (650 nm a 700 nm), se mudarmos nossa fonte de luz para um refletor de "luz azul", fonte de luz incidente correspondente apenas ao intervalo do espectro visível para luz azul (450 nm a 500 nm), a resposta cromática do chapéu será de cor', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'amarela.', 0),
    (@idQuestao, 'B', N'azul.', 0),
    (@idQuestao, 'C', N'neutra.', 1),
    (@idQuestao, 'D', N'verde.', 0),
    (@idQuestao, 'E', N'ciano.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Composição e Enquadramento');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q40', N'Em um retângulo, a proporção geométrica entre seus lados, primeiramente proposta pelos gregos e posteriormente adotada pelos renascentistas, como sendo aquela que estabelecia relações que representavam beleza, harmonia e simetria, e que ficou conhecida como proporção áurea, é:', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'1:1,333', 0),
    (@idQuestao, 'B', N'1:1,500', 0),
    (@idQuestao, 'C', N'1:1,618', 1),
    (@idQuestao, 'D', N'1:1,778', 0),
    (@idQuestao, 'E', N'1:2,350', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Triângulo de Exposição');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q41', N'Em Fotografia, define-se como Triângulo da Exposição a participação de três principais variáveis no que se refere à exposição da superfície sensível, seja ela fotoquímica (fotograma) ou fotoeletrônica (sensor). São elas:', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'ISO, tempo de exposição, diafragma.', 1),
    (@idQuestao, 'B', N'ISO, distância focal, tempo de exposição.', 0),
    (@idQuestao, 'C', N'distância focal, intensidade luminosa, diafragma.', 0),
    (@idQuestao, 'D', N'tempo de exposição, distância focal, diafragma.', 0),
    (@idQuestao, 'E', N'intensidade luminosa, ISO, distância focal.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Histograma');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q42', N'(Questão com esquema de apoio.) Trata-se de um sistema cartesiano de coordenadas ortogonais que determina o Histograma de uma imagem digital, onde duas variáveis, x e y, são avaliadas e mensuradas. Essas variantes são, respectivamente, para x e y:', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'quantidade de pixels na imagem; escala tonal dividida, em ordem crescente, em tons escuros, médios e claros.', 0),
    (@idQuestao, 'B', N'representação gráfica da imagem, onde se situam as áreas de maior resolução espectral; quantidade de pixels na imagem.', 0),
    (@idQuestao, 'C', N'representação gráfica da imagem, onde se situam as áreas de maior contraste; escala tonal dividida, em ordem crescente, em tons escuros, médios e claros.', 0),
    (@idQuestao, 'D', N'escala tonal dividida, em ordem crescente, em tons escuros, médios e claros; quantidade de pixels na imagem.', 1),
    (@idQuestao, 'E', N'quantidade de pixels na imagem; determinação de profundidade de campo com o centro representando a maior área em foco.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Composição e Enquadramento');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q43', N'Em linguagem fotográfica, são definidos elementos que elaboram, criativamente, a imagem. Entre eles, podem-se destacar: plano; foco; ângulo; iluminação e composição. Relacionando cada um dos elementos apresentados a uma determinada característica criativa, são elas, respectivamente:', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'projeto fotográfico; manual ou automático; estaticidade; natural ou artificial; gradação de cinzas e cores.', 0),
    (@idQuestao, 'B', N'enquadramento; profundidade de campo; posição da câmera no espaço; sombras e luzes; arranjo visual dos elementos na imagem.', 1),
    (@idQuestao, 'C', N'recorte; inteligibilidade da mensagem; posicionamento político do fotógrafo; difusa; texto explicativo da imagem.', 0),
    (@idQuestao, 'D', N'projeto fotográfico; automático ou manual; posicionamento político do fotógrafo; difusa; texto explicativo da imagem.', 0),
    (@idQuestao, 'E', N'enquadramento; manual ou automático; posicionamento político do fotógrafo; natural ou artificial; gradação de cinzas e cores.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Sensor e Fator de Corte');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q44', N'As câmeras fotográficas digitais formam a imagem quando os raios de luz atravessam a objetiva e atingem o sensor. Nas câmeras fotográficas analógicas, no lugar do sensor, há uma superfície fotossensível denominada fotograma. Dessa maneira, pode-se definir o sensor das câmeras digitais como uma', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'matriz plana bidimensional composta de microcélulas fotoelétricas que, distribuídas desordenadamente, convertem a intensidade luminosa em registro digital.', 0),
    (@idQuestao, 'B', N'emulsão fotossensível composta por haletos de prata distribuídos desordenadamente numa superfície plana, que convertem em cargas elétricas a intensidade luminosa de cada ponto da imagem.', 0),
    (@idQuestao, 'C', N'matriz plana circular composta por microfotossensores que, distribuídos desordenadamente, se organizam de forma poligonal no momento em que recebem a intensidade luminosa.', 0),
    (@idQuestao, 'D', N'emulsão fotossensível composta por haletos de prata distribuídos ordenadamente numa superfície plana, que convertem em registros digitais a intensidade luminosa de cada ponto da imagem.', 0),
    (@idQuestao, 'E', N'matriz plana bidimensional composta de microfotossensores que, distribuídos ordenadamente, convertem em cargas elétricas a intensidade luminosa de cada ponto da imagem.', 1);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Balanço de Branco');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q45', N'(Questão com imagens de apoio.) Todas as três imagens, "A", "B" e "C", foram registradas no mesmo horário do dia, com a diferença de poucos segundos entre um registro e outro. A temperatura de cor da luz do dia, naquele instante, era de 5500 K e, no momento em que a imagem "A" foi capturada, a temperatura de cor configurada na câmera foi de 5500 K. Visto o diminuto intervalo de tempo entre o registro de uma imagem e outra, e a inocorrência de uma mudança significativa na luz do dia, quais as mudanças de configuração efetuadas na câmera para que os resultados em "B", e em "C", fossem, respectivamente, obtidos?', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Em "B", a câmera foi configurada em uma temperatura de cor acima de 5500 K, pois se nota a predominância da "tonalidade fria" do azul. Em "C", a câmera foi configurada em uma temperatura de cor abaixo de 5500 K, pois se nota a predominância da "tonalidade quente" do vermelho.', 0),
    (@idQuestao, 'B', N'As três imagens são registradas sob a mesma configuração de temperatura de cor, mas em "B" tem-se uma sobreposição em relação a "A", prevalecendo a transmissão das ondas eletromagnéticas de maior frequência (azul), e, em "C", uma subexposição em relação a "A", prevalecendo a transmissão das ondas de menor frequência (vermelho).', 0),
    (@idQuestao, 'C', N'Em "B", a câmera foi configurada em uma temperatura de cor abaixo de 5500 K, fazendo com que a câmera "entendesse" como necessária a atenuação da predominância da "tonalidade quente" do vermelho. Em "C", a câmera foi configurada em uma temperatura de cor acima de 5500 K, fazendo com que a câmera "entendesse" como necessária a atenuação da predominância da "tonalidade fria" do azul.', 1),
    (@idQuestao, 'D', N'As três imagens são registradas sob a mesma configuração de temperatura de cor, mas em "B" tem-se a utilização, na câmera, de um filtro de conversão âmbar (série Wratten 85), e, em "C", a utilização, na câmera, de um filtro de conversão azul (série Wratten 80).', 0),
    (@idQuestao, 'E', N'Nas câmeras digitais (DSLR), não há a possibilidade de mudança na configuração da temperatura de cor, pois esta configuração já é definida pelo fabricante e não permite alterações.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Tipos de Luzes');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q46', N'No mercado fotográfico, encontram-se vários tipos de refletores para uso profissional. Entre esses, há dois tipos que produzem diferentes resultados práticos de iluminação: o refletor de lâmpada halógena com lente fresnel e o refletor softlight com lâmpadas fluorescentes. Respectivamente, as diferenças na qualidade de luz de ambos os refletores são:', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'luz de raios paralelos com formação de sombras recortadas e definidas; luz difusa com transição suave entre a área iluminada e a área em sombra.', 1),
    (@idQuestao, 'B', N'luz difusa com formação de sombras recortadas e definidas; luz de emissão de raios paralelos com sombras duras e definidas.', 0),
    (@idQuestao, 'C', N'luz de raios paralelos com transição suave entre a área iluminada e a área em sombra; luz difusa com formação de sombras recortadas e definidas.', 0),
    (@idQuestao, 'D', N'luz difusa com transição suave entre a área iluminada e a área em sombra; luz de raios paralelos com formação de sombras recortadas e definidas.', 0),
    (@idQuestao, 'E', N'luz de raios paralelos sem formação de sombras; luz difusa com transição suave entre a área iluminada e a área em sombra.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Tipos de Arquivos');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q47', N'Ao se fotografar com uma câmera analógica, gera-se um fotograma, ou seja, um suporte físico que pode vir a ser danificado sem o devido armazenamento; diferentemente, com uma câmera digital, a imagem captada é armazenada em forma de arquivo. O que se pode afirmar com relação ao arquivamento da imagem digital?', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'HDs externos são adequados para o armazenamento desse tipo de arquivo, pois não podem ser corrompidos.', 0),
    (@idQuestao, 'B', N'Back-up de arquivos digitais são aconselhados apenas após a finalização do processo, ou seja, após a edição da imagem.', 0),
    (@idQuestao, 'C', N'Uma vez que o arquivo de imagem é armazenado em um computador externo ou em disco, ele não pode mais sofrer manipulação.', 0),
    (@idQuestao, 'D', N'O primeiro cuidado antes do tratamento da imagem é fazer uma cópia do arquivo, mantendo as configurações originais.', 1),
    (@idQuestao, 'E', N'Uma vez armazenado, o arquivo digital não pode mais sofrer qualquer tipo de alteração, logo, não pode ser danificado.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Fotografia Analógica');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q48', N'Chama-se de "imagem latente" àquela formada sobre a emulsão fotográfica após sua exposição à luz e que ainda não sofreu processo de tratamento. O que se pode considerar equivalente à imagem latente no sistema digital?', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'O fotograma positivo, aquele capturado em emulsão reversível.', 0),
    (@idQuestao, 'B', N'O arquivo fotográfico tipo RAW.', 1),
    (@idQuestao, 'C', N'A informação de luminância obtida no histograma.', 0),
    (@idQuestao, 'D', N'A matriz de Bayer que compõe o sensor digital da câmera.', 0),
    (@idQuestao, 'E', N'O fotograma negativo em cores formado por haletos de prata e camadas de emulsão com pigmentos RGB.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Fotometria');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q49', N'Durante o jogo de vôlei na praia, o fotógrafo, por meio do uso do fotômetro incorporado à câmera, fez algumas avaliações de exposição, antes de captar a imagem que se observa a seguir. Tratando-se de uma manhã de sol, e optando pelo uso de um filtro de densidade neutra ND 0.3, o fotógrafo, com a leitura do fotômetro, obteve como resultado: ISO 100; 1/30; f.16. Observando o resultado da imagem fotografada, pode-se concluir que o fotógrafo alterou adequadamente a configuração de exposição proposta pelo fotômetro. A configuração de exposição utilizada pelo fotógrafo foi:', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'ISO 400; 1/250; f.4 e manutenção do filtro ND 0.3.', 0),
    (@idQuestao, 'B', N'ISO 400; 1/30; f.8 e manutenção do filtro ND 0.3.', 0),
    (@idQuestao, 'C', N'ISO 200; 1/500; f.2.8 e manutenção do filtro ND 0.3.', 0),
    (@idQuestao, 'D', N'ISO 800; 1/15; f.8 e eliminação do filtro ND 0.3.', 0),
    (@idQuestao, 'E', N'ISO 200; 1/500; f.8 e eliminação do filtro ND 0.3.', 1);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Luz');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('VUNESP 2015 - Itatiba/SP - Q50', N'(Questão com figura de apoio, sobre reflexão difusa e reflexão especular.) Assinale a alternativa correta.', 1, @idTema, 'VUNESP', 2015);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Reflexão difusa refere-se à absorção total da luz que incide sobre superfícies rugosas; enquanto reflexão especular refere-se à reflexão total da luz que incide sobre superfícies lisas e brilhantes.', 0),
    (@idQuestao, 'B', N'Reflexão difusa refere-se à reflexão total da luz que incide sobre superfícies rugosas e brilhantes; enquanto reflexão especular refere-se à absorção total da luz que incide sobre superfícies lisas.', 0),
    (@idQuestao, 'C', N'Reflexão difusa refere-se ao espalhamento, em várias direções, da luz que incide sobre superfícies rugosas; enquanto reflexão especular refere-se à reflexão, em somente uma direção, da luz que incide sobre superfícies lisas e brilhantes.', 1),
    (@idQuestao, 'D', N'Tanto a reflexão difusa como a reflexão especular referem-se à reflexão total da luz que incide sobre qualquer tipo de superfície; o que muda é somente a posição do rebatedor.', 0),
    (@idQuestao, 'E', N'Reflexão difusa refere-se à reflexão total da luz do dia que é mais difusa; enquanto a reflexão especular refere-se à reflexão parcial da luz de tungstênio que é mais dura.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

/* =========================================================
   VÁRZEA GRANDE/MT — UFMT — 2018 (Edital 02/2017, prova
   aplicada em 25/02/2018) — Cargo "Agente de Desenvolvimento
   Econômico e Social — Perfil: Fotógrafo" — Q31 a Q40.
   Gabarito-fonte: PRELIMINAR (não foi localizado o definitivo).
   ========================================================= */

BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idTema INT, @idQuestao INT;

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'História da Fotografia');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UFMT 2018 - Várzea Grande/MT - Q31', N'Sobre aspectos históricos da Fotografia, analise as assertivas. I - A exatidão da imagem fotográfica foi considerada, ainda no século XIX, como instrumento de extraordinário interesse científico, tendo na Antropologia uma de suas primeiras aplicações. II - Desde o princípio, as imagens fotográficas caracterizaram-se pela instantaneidade do registro. As primeiras fotos traziam a naturalidade da pose espontânea e não ensaiada. III - O conhecimento acerca da Câmara Escura surge no século XIX; seu precursor foi o pintor Louis Jacques Mandi Daguerre que a utilizou para desenvolver a técnica conhecida como Diorama. IV - O surgimento da Fotografia contrastou com a tradição da Pintura. Enquanto esta restringia o retrato à aristocracia da época, a fotografia democratizou o acesso à própria imagem. Estão corretas as assertivas', 1, @idTema, 'UFMT', 2018);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'I, II e III, apenas.', 0),
    (@idQuestao, 'B', N'II e IV, apenas.', 0),
    (@idQuestao, 'C', N'II, III e IV, apenas.', 0),
    (@idQuestao, 'D', N'I e IV, apenas.', 1);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Diafragma');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UFMT 2018 - Várzea Grande/MT - Q32', N'O aumento da profundidade de campo NÃO resulta em', 1, @idTema, 'UFMT', 2018);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'maior nitidez em todos os planos.', 0),
    (@idQuestao, 'B', N'fechamento do diafragma.', 0),
    (@idQuestao, 'C', N'menor perspectiva da imagem.', 1),
    (@idQuestao, 'D', N'diminuição da luminosidade da objetiva.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Filtros');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UFMT 2018 - Várzea Grande/MT - Q33', N'O filtro polarizador é usado para', 1, @idTema, 'UFMT', 2018);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'corrigir a temperatura de cor ambiente.', 0),
    (@idQuestao, 'B', N'eliminar nuances avermelhadas do amanhecer/entardecer.', 0),
    (@idQuestao, 'C', N'deter os raios ultravioletas que podem provocar um "véu" em fotos de paisagem.', 0),
    (@idQuestao, 'D', N'diminuir reflexos indesejados.', 1);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Triângulo de Exposição');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UFMT 2018 - Várzea Grande/MT - Q34', N'Uma foto tirada em ambiente pouco iluminado, sem uso de flash, pode obter uma imagem com movimento congelado e nítido se o operador/fotógrafo usar uma', 1, @idTema, 'UFMT', 2018);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'pequena abertura de diafragma, velocidade de obturador baixa e ISO baixo.', 0),
    (@idQuestao, 'B', N'lente com grande abertura de diafragma, velocidade de obturador alta e ISO alto.', 1),
    (@idQuestao, 'C', N'abertura de diafragma moderada, velocidade de obturador alta e ISO baixo.', 0),
    (@idQuestao, 'D', N'lente com grande abertura de diafragma, velocidade de obturador baixa e ISO alto.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Luz');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UFMT 2018 - Várzea Grande/MT - Q35', N'A escrita fotográfica tem como fundamento a', 1, @idTema, 'UFMT', 2018);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'luz.', 1),
    (@idQuestao, 'B', N'emulsão fotográfica.', 0),
    (@idQuestao, 'C', N'película.', 0),
    (@idQuestao, 'D', N'caixa escura.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Diafragma');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UFMT 2018 - Várzea Grande/MT - Q36', N'Em fotografia, a sequência 1.8 - 2 - 2.8 - 4 - 5.6 - 8 - 11 - 16 - 22 caracteriza', 1, @idTema, 'UFMT', 2018);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'velocidade do obturador da câmera.', 0),
    (@idQuestao, 'B', N'sensibilidade fotográfica.', 0),
    (@idQuestao, 'C', N'metragem focal.', 0),
    (@idQuestao, 'D', N'abertura de diafragma da lente.', 1);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Objetivas');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UFMT 2018 - Várzea Grande/MT - Q37', N'Numa lente fotográfica, a indicação 50 mm está relacionada com', 1, @idTema, 'UFMT', 2018);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'a distância da câmera até o objeto fotografado.', 0),
    (@idQuestao, 'B', N'a sensibilidade à luz.', 0),
    (@idQuestao, 'C', N'o ângulo de visão da lente.', 1),
    (@idQuestao, 'D', N'a abertura do diafragma.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Composição e Enquadramento');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UFMT 2018 - Várzea Grande/MT - Q38', N'(Questão com figura de apoio.) Em relação aos enquadramentos fotográficos, a imagem acima representa um plano', 1, @idTema, 'UFMT', 2018);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'próximo.', 1),
    (@idQuestao, 'B', N'em conjunto.', 0),
    (@idQuestao, 'C', N'contraplongê.', 0),
    (@idQuestao, 'D', N'super close.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Sensor e Fator de Corte');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UFMT 2018 - Várzea Grande/MT - Q39', N'Analise as afirmativas sobre tecnologias de sensores para câmeras digitais. I - A tecnologia full frame permite a captura da luz no espaço máximo disponível do quadro da imagem. II - As câmeras digitais, cujos sensores apresentam fator de corte, aproveitam melhor o espaço de enquadramento da imagem. III - O sensor CMOS (Complementary Metal Oxide Semicondutor) tem melhor desempenho para imagens de alta qualidade do que o seu concorrente CCD (Charged Coupled Device). IV - O sensor CCD é mais sensível à baixa luminosidade e por isso produz imagens mais nítidas. Está correto o que se afirma em', 1, @idTema, 'UFMT', 2018);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'II e III, apenas.', 0),
    (@idQuestao, 'B', N'I e IV, apenas.', 1),
    (@idQuestao, 'C', N'I e II, apenas.', 0),
    (@idQuestao, 'D', N'III e IV, apenas.', 0);

    SET @idTema = (SELECT id FROM dbo.temas WHERE nome = 'Fotometria');
    INSERT INTO dbo.questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES ('UFMT 2018 - Várzea Grande/MT - Q40', N'Sobre fotometria com emprego de spotmeter, é correto afirmar:', 1, @idTema, 'UFMT', 2018);
    SET @idQuestao = SCOPE_IDENTITY();
    INSERT INTO dbo.alternativas (idQuestao, letra, descricaoAlt, correta) VALUES
    (@idQuestao, 'A', N'Serve para medir a totalidade da luz refletida pelo assunto fotografado, quando o aparelho é apontado em direção à câmera.', 0),
    (@idQuestao, 'B', N'Mede com precisão a luminância de pequenas áreas.', 1),
    (@idQuestao, 'C', N'Permite avaliar a quantidade de luz recebida diretamente pelo assunto fotografado.', 0),
    (@idQuestao, 'D', N'Obtém a média ponderada da exposição, quando o aparelho é apontado em direção à câmera.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

PRINT 'Seed de questões de fotografia (Apucarana, Guaratuba, Itatiba, Várzea Grande) aplicado com sucesso — 50 questões.';
