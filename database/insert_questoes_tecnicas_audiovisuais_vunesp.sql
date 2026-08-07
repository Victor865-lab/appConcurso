-- Reinsercao das questoes da apostila "610+ Questoes de Tecnicas Audiovisuais"
-- (autoral/nao-oficial, estilo VUNESP), reprocessada do zero a partir do
-- PDF original em QuestoesFto/, substituindo o arquivo anterior que tinha
-- sido gerado com extracao de texto com problemas de layout de 2 colunas
-- (causava mesclagem de alternativas C+D em varias questoes).
--
-- Fonte: pdftotext SEM a flag -layout (o texto corrido, sem tentar
-- preservar colunas, veio limpo e na ordem de leitura correta -- ao
-- contrario do -layout, que intercalava as duas colunas da pagina).
-- Cada questao foi conferida contra DOIS gabaritos independentes
-- presentes no proprio documento: a marcacao "R: X" logo apos cada
-- questao E a lista "GABARITO [MODULO]" recapitulada ao final de cada
-- modulo -- 0 divergencias entre as duas fontes nas questoes incluidas.
--
-- Do total de 578 questoes parseadas com sucesso, 5 foram excluidas por
-- dependerem de observar uma imagem/figura/esquema/caixa de dialogo nao
-- disponivel em texto (nenhuma resposta foi inventada nesses casos).
-- Outras 29 questoes do documento original nao puderam ser parseadas com
-- seguranca (ambiguidade de fronteira entre alternativas por outros typos
-- do documento fonte) e tambem foram deixadas de fora, em vez de arriscar
-- atribuir texto errado a uma alternativa.
--
-- referencia = "VUNESP - Apostila Tecnicas Audiovisuais - {Tema} - Q{NN}",
-- banca = VUNESP, ano = NULL (conteudo nao-oficial, nao e prova real).

USE ConcursosDB;
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Luz')
    INSERT INTO temas (nome) VALUES (N'Luz');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Componentes da Câmera')
    INSERT INTO temas (nome) VALUES (N'Componentes da Câmera');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Objetivas')
    INSERT INTO temas (nome) VALUES (N'Objetivas');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Diafragma')
    INSERT INTO temas (nome) VALUES (N'Diafragma');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Obturador')
    INSERT INTO temas (nome) VALUES (N'Obturador');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'ISO')
    INSERT INTO temas (nome) VALUES (N'ISO');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Triângulo de Exposição')
    INSERT INTO temas (nome) VALUES (N'Triângulo de Exposição');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'EV')
    INSERT INTO temas (nome) VALUES (N'EV');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Fotometria')
    INSERT INTO temas (nome) VALUES (N'Fotometria');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Focagem')
    INSERT INTO temas (nome) VALUES (N'Focagem');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'RGB')
    INSERT INTO temas (nome) VALUES (N'RGB');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Flash')
    INSERT INTO temas (nome) VALUES (N'Flash');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Tipos de Luzes')
    INSERT INTO temas (nome) VALUES (N'Tipos de Luzes');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Filtros')
    INSERT INTO temas (nome) VALUES (N'Filtros');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Balanço de Branco')
    INSERT INTO temas (nome) VALUES (N'Balanço de Branco');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Histograma')
    INSERT INTO temas (nome) VALUES (N'Histograma');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Impressão')
    INSERT INTO temas (nome) VALUES (N'Impressão');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Sensor e Fator de Corte')
    INSERT INTO temas (nome) VALUES (N'Sensor e Fator de Corte');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Tipos de Arquivos')
    INSERT INTO temas (nome) VALUES (N'Tipos de Arquivos');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Protocolo e Cartão de Memória')
    INSERT INTO temas (nome) VALUES (N'Protocolo e Cartão de Memória');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Modos da Câmera')
    INSERT INTO temas (nome) VALUES (N'Modos da Câmera');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Fotografia Analógica')
    INSERT INTO temas (nome) VALUES (N'Fotografia Analógica');
GO

BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Módulo 1 (Luz), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Luz - Q01', N'Muitas as palavras em português conservam suas raízes gregas, latinas, árabes, entre outras. A palavra “fotografia” é uma delas, e em grego quer dizer:', 1,
        (SELECT id FROM temas WHERE nome = N'Luz'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'escrever com a luz;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'gravar uma foto;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reproduzir graficamente um retrato;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'grafar, por processos mecânicos, o momento;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'transformar a foto numa escrita gráfica.', 0);

    -- Módulo 1 (Luz), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Luz - Q02', N'A luz sensível ao olho humano é uma faixa estreita de radiação eletromagnética, com uma variação de comprimento de onda medida em nanômetros (nm - um milionésimo de milímetro) que fica entre:', 1,
        (SELECT id FROM temas WHERE nome = N'Luz'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'300 e 400 nanômetros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'350 e 390 nanômetros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'400 e 700 nanômetros.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'700 e 800 nanômetros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'730 e 870 nanômetros.', 0);

    -- Módulo 1 (Luz), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Luz - Q03', N'Sobre a Lei do quadrado das distâncias, podemos afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Luz'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A única fonte de luz que obedece a essa lei é o Sol.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Quanto maior for a luz, menor será a distância da fonte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Quanto menor for a luz, maior será a distância da fonte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Nem toda fonte artificial que distribui sua luz em todas as direções obedece a essa lei.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A intensidade da luz originada de uma fonte constante diminui proporcionalmente ao quadrado da distância dessa fonte.', 1);

    -- Módulo 1 (Luz), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Luz - Q04', N'A escrita fotográfica tem como fundamento a', 1,
        (SELECT id FROM temas WHERE nome = N'Luz'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'emulsão fotográfica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'película.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'caixa escura.', 0);

    -- Módulo 1 (Luz), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Luz - Q05', N'O que denominamos de espectro ótico da luz é uma seção da radiação eletromagnética que é visível ao olho humano. Assinale a resposta correta que aponta as medidas mais aproximadas do espectro visível ao olho humano.', 1,
        (SELECT id FROM temas WHERE nome = N'Luz'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'250 nm a 500 nm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'400 nm a 700 nm', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'700 nm a 950 nm', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'850 nm a 950 nm', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'900 nm a 1000 nm', 0);

    -- Módulo 1 (Luz), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Luz - Q06', N'A intensidade da luz é:', 1,
        (SELECT id FROM temas WHERE nome = N'Luz'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'inversamente proporcional ao quadrado da distância.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'inversamente proporcional à metade da distância.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'proporcional ao quadrado da distância.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'proporcional à metade da distância.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'proporcional ao dobro da distância.', 0);

    -- Módulo 1 (Luz), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Luz - Q07', N'O fenômeno pelo qual a luz muda de direção quando passa de um meio a outro presente nas lentes fotográficas é chamado de:', 1,
        (SELECT id FROM temas WHERE nome = N'Luz'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Dispersão Luminosa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Reflexão Luminosa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Refração Luminosa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Difusão Luminosa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Convergência Luminosa.', 0);

    -- Módulo 1 (Luz), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Luz - Q08', N'O fluxo luminoso incidente divide-se em três partes, em uma dada proporção, que depende das características da substância sobre a qual incide. Para avaliar os valores qualitativos do fluxo é necessário, portanto, definir esses três fatores que são:', 1,
        (SELECT id FROM temas WHERE nome = N'Luz'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Ofuscamento, reflexão e transmissão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Reflexão, transmissão e absorção de luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Temperatura de cor, ofuscamento e reflexão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Transmissão, ofuscamento e temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Absorção de luz, ofuscamento e temperatura de cor.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q01', N'Conhecido no século VI e descrito pela primeira vez por Leonardo da Vinci (1452 1519), o dispositivo antecedente da máquina fotográfica é a', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'câmara clara.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'máquina de retratar.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'máquina de desenhar.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'câmara escura.', 1);

    -- Módulo 2 (Componentes da Câmera), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q02', N'A fabricante tradicionalmente conhecida pelas câmeras de formato 6 × 6 cm, que lançou a primeira câmera digital mirrorless de médio formato, é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Canon.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Sony.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Hasselblad.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Kodak.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Nikon.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q03', N'O Erro de Paralaxe acontece quando?', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Erro no ajuste da dioptria do visor da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Há uma falha no corretor do Erro de Paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A dioptria não comporta correções de paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Os ângulos de visão da Objetiva e do Visor são diferentes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Os ângulos de visão da Objetiva e do Visor são iguais.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q04', N'Para que servem os tubos de extensão?', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Para alongar as objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Para ampliar a imagem de um objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Para duplicar a distância focal de uma objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Para melhorar a granulação resultante de ISO alto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Para melhorar a profundidade de campo de uma imagem.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q05', N'Para que serve um Extender 2X ?', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Reduzir em 2X a distância focal de uma objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Multiplicar por 2 a distância focal de uma objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Ampliar a relação obturador x diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Criar efeitos na velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Melhorar a leitura da luz.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q06', N'Langford afirma que, às vezes, o fotógrafo recorre a complementos do equipamento básico, em função dos objetivos da foto. Um exemplo de acessório simples para fotos em close, que se encaixa entre a lente e o corpo da câmera Reflex, é:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'um filtro polarizador;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'um flash;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'uma teleobjetiva;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'um zoom de foco longo;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'um anel de extensão.', 1);

    -- Módulo 2 (Componentes da Câmera), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q07', N'O erro de paralaxe é uma característica de câmeras:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'digitais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'analógicas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'grande formato.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reflex de objetiva única.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reflex de objetivas duplas.', 1);

    -- Módulo 2 (Componentes da Câmera), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q08', N'Comparando-se as câmeras Reflex (SRL) e as compactas, percebe-se que ambas apresentam vantagens e desvantagens, dependendo do objetivo com que são usadas. Uma das vantagens das Reflex é:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a imagem do visor ser clara, mesmo quando há relativamente pouca luz;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a medida precisa da exposição, porque as células fotossensíveis medem apenas a luz que vem da objetiva;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a possibilidade de usá-las com flash com qualquer obturador;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o fato de serem pequenas, leves e fáceis de carregar;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a ausência de um espelho refletor tornálas mais silenciosas.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q09', N'De acordo com Hedgecoe, é preciso manter o objeto a ser fotografado dentro das linhas do visor. Quando as imagens da objetiva e do visor não correspondem, tem-se o erro de:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'autofoco;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'subexposição;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'enquadramento;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'paralaxe;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'monópode.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q10', N'Preencha as lacunas e, em seguida, assinale a alternativa correta. O ___________________ é utilizado para conectar uma objetiva comum invertida na câmera e transformá-la em macro; o ________________ é um acessório sem nenhum elemento ótico que possibilita uma maior aproximação do assunto a ser fotografado; o ________________ é um acessório com elemento ótico utilizado para aumentar a distância focal de uma objetiva. A alternativa que preenche, correta e respectivamente, as lacunas acima é:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'anel de inversão – tubo de extensão – teleconversor', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'tubo de extensão – anel de inversão – teleconversor', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'tubo de extensão – teleconversor – anel de inversão', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'teleconversor – tubo de extensão – anel de inversão', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'anel de inversão – teleconversor – tubo de extensão', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q11', N'Em fotografia, no que consiste o erro de paralaxe?', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A abertura utilizada causa o desfoque do plano de fundo, fazendo com que o primeiro plano fique destacado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A imagem captada pelo visor da câmera é diferente da captada pela objetiva, o que resulta, muitas vezes, em imagens cortadas em pontos não desejados.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A imagem, depois de ampliada, apresenta riscos e borrões causados pelo uso de uma velocidade muito lenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A luz de fundo, sendo muito mais forte do que a luz frontal, provoca o escurecimento do primeiro plano.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O motivo em primeiro plano está debaixo de um sol a 90º e para corrigir a sombra debaixo dos olhos e do pescoço usa-se um flash de preenchimento.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q12', N'Aproximar-se do assunto para fotografá-lo de perto é uma técnica usual em fotografia. Abaixo estão listados alguns acessórios que são utilizados na prática desta técnica. São eles: I. Anel inversor II. Lentes close-up III. Fole de Extensão IV. Telêmetro V. Microscópio VI. Objetiva Macroscópica Assinale a alternativa que apresenta CORRETAMENTE os acessórios.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I – III – IV – VI', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'I – III – IV – V', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'II – IV – V – VI', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I – II – III – VI', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'II – III – IV – VI', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q13', N'Sobre as câmeras Single-lens reflex ou SLR, é incorreto afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Possibilitam a troca de lentes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Elas provocam o erro de paralaxe.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A imagem passa através da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'São maiores que as point and shoot.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'São câmeras de uma só objetiva.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q14
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q14', N'Pode-se definir paralaxe como um:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Deslocamento da objetiva para frente ou para trás.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Erro comum em algumas câmeras em que o visor básico não enquadra a mesma área delimitada pela objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Mecanismo de focalização, que objetiva controlar a imagem nitidamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Sistema onde a objetiva é montada sobre uma espécie rosca, direcionada opostamente ao filme.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q15', N'O princípio da câmera obscura, fundamental para o desenvolvimento da fotografia: I. Possibilitará a geração de uma imagem em seu interior, se construído em uma sala completamente vedada, com um orifício simulando o que seria a objetiva. II. É conhecido desde a Antiguidade Clássica, tendo sido descrito pelos gregos antigos. III. Gera imagens sempre em preto e branco, no seu interior. Quais estão corretas?', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apenas I.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas I e II.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Apenas I e III.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q16', N'Sobre os tipos e formatos de câmera, considere as seguintes afirmativas: 1. As câmeras monorreflex, ou single lens reflex (SLR) são aquelas que permitem ao fotógrafo enxergar através da objetiva, não havendo diferença no enquadramento entre o que é visto e o que é enquadrado. 2. As câmeras monorreflex digitais, ou DSLR, têm a mesma estrutura das analógicas, salvo que no plano do filme encontra-se o sensor digital, CCD ou CMOS, além de o corpo da câmera digital guardar um poderoso sistema de computador destinado ao processamento da imagem. 3. As câmeras de médio formato podem ser monorreflex (SLR) ou duplorreflex (twin lens reflex). 4. Não existem câmeras de médio formato digitais, pois ainda não há tecnologia para produzir sensores suficientemente grandes. Assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Somente as afirmativas 1, 2 e 3 são verdadeiras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Somente as afirmativas 1, 2 e 4 são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Somente as afirmativas 2, 3 e 4 são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Somente as afirmativas 1 e 2 são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Somente as afirmativas 3 e 4 são verdadeiras.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q17
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q17', N'O uso do acessório chamado teleconversor, possibilita vantajosa aproximação em teleobjetivas. Ao usar este equipamento, o fotógrafo deverá observar uma alteração:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'no balanço de branco (WB), necessitando correção de cor', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'na captação de luz, com perda de luminosidade', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'na compensação de exposição, necessitando cuidado para não estourar', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do formato APSC para o formato full frame', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q18', N'É necessário, para cada profissional que opera a câmera, o ajuste no visor da sua própria dioptria, pois a correção dióptrica', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'desfoca o visor permitindo a visualização da imagem em foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'desfoca o visor para que as regiões da imagem não abrangidas pela profundidade de campo possam ser visualizadas em foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'foca o visor e desfoca a região da imagem que se encontra em foco dentro da área abrangida pela profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'permite acomodar o foco do visor ao olho do fotógrafo, permitindo maior acuidade no ajuste do foco da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'foca o visor, mas é necessária somente para profissionais que sejam míopes.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q19', N'Um visor direto numa câmera não reflex pode provocar um defeito denominado', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Anéis Newton', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Barrilete', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Paralaxe', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Franjas coloridas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Sistemas de brilho', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q20', N'As lentes close-up são usadas de forma semelhante à dos filtros. Funcionam como lentes de aumento e estão disponíveis em graus medidos em dioptrias. Levando-se em conta que a objetiva principal está focalizada no infinito, a que distância o objeto estará em foco quando se monta sobre a objetiva diferentes dioptrias?', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Uma lente de dioptria +1, acoplada a um filtro ND 0.3, focaliza a uma distância de 0,30 m; uma de dioptria + 2, acoplada a um filtro ND 0.6, focaliza a uma distância de 0,60 m, e uma de dioptria + 4, acoplada a um filtro ND 1.2, focaliza a uma distância de 1,2 m.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Uma lente de dioptria +1 focaliza a uma distância mínima de 1 metro, uma de dioptria +2, a 2 metros, e uma de dioptria +4, a 4 metros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Independentemente do grau de dioptria da lente close-up, o foco mínimo será aquele determinado pela distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Independentemente da lente closeup utilizada, o foco mínimo será aquele determinado pelo valor da distância focal da objetiva divido pelo valor do grau de dioptria da lente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Uma lente de dioptria +1 focaliza a uma distância mínima de 1 metro, uma de dioptria +2, a 0,5 metro, e uma de dioptria +4, a 0,25 metro.', 1);

    -- Módulo 2 (Componentes da Câmera), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q21', N'Nas câmeras monorreflex analógicas, o controle de foco é responsável:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pelo tempo de exposição do filme à luz;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'pela extensão da profundidade de campo;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'pela medição da luz ambiente;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'pela nitidez no plano escolhido pelo fotógrafo;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'pelo enquadramento definido pela regra dos terços.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q22
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q22', N'Encontramos defeito de paralaxe nas câmeras:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'monorreflex analógicas e reflex de duas objetivas digitais;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reflex de duas objetivas e visor direto analógicas;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'monorreflex e visor direto digitais;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'monorreflex e câmeras descartáveis analógicas;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'visor direto digitais e monorreflex analógicas.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q23
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q23', N'O que é o defeito da paralaxe?', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'É a diferença entre as imagens do assunto, uma vista pelo visor e outra captada pela objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Fotos tiradas em que mostram excesso do primeiro plano, sendo sua imagem muito pequena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'É uma moldura de fita metálica ou de arame, dentro da qual aparece o assunto quase igual à imagem fotográfica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'É a distância entre o olho do fotógrafo e o objeto a ser fotografado.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q24
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q24', N'Qual é a função do espelho, na câmara reflex?', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Ele permite melhor controle de nitidez, incluindo a profundidade de campo e não sofre do defeito de paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Sua desvantagem consiste no desaparecimento da imagem no momento de se tirar a fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Ele permite alterações nas imagens depois de tiradas, deixando-as mais sensíveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Ele reflete a imagem, captada pela objetiva, sobre o vidro despolido do visor.', 1);

    -- Módulo 2 (Componentes da Câmera), questão original Q25
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q25', N'Nas câmeras fotográficas tipo reflex de 35 mm, equipadas com objetiva normal, quais os movimentos corretivos abaixo citados que podem ser executados normalmente?', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Descentramento', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Movimento angular', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Movimento lineares', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Nenhum movimento corretivo', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Paralax', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q26
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q26', N'As câmeras de uso mais comum no fotojornalismo diário são as câmeras de 35 mm também conhecidas como câmeras de pequeno formato. E por permitirem a troca de objetiva dar a possibilidade do fotografo ver através do visor exatamente o que será fotografado elas também são conhecidas por', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'câmera reflex TLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'câmera reflex SLR.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'câmera de visor direto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'câmera Pinhole.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'câmera.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q27
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q27', N'Quanto ao tipo de suporte utilizado para captação da imagem fotográfica, as câmeras fotográficas podem ser classificadas em:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'monorreflex ou digitais;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'analógicas ou de visor direto;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'compactas ou TLR;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'monorreflex ou SLR;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'analógicas ou digitais.', 1);

    -- Módulo 2 (Componentes da Câmera), questão original Q28
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q28', N'Em relação à visualização, qual câmera apresenta erro de paralaxe?', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Câmera de estúdio.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Câmera técnica ou grande formato.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Câmera monorreflex.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Câmera de visor direto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Câmera SLR.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q29
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q29', N'Para fotografar “close-ups” com tubos de extensão é necessário:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Manter o tempo de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Diminuir o tempo de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Não é necessário levar em consideração o tempo de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Aumentar o tempo de exposição.', 1);

    -- Módulo 2 (Componentes da Câmera), questão original Q30
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q30', N'Assinale a alternativa que apresenta uma vantagem das câmeras compactas.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Facilidade de manuseio se comparadas às monorreflex sem automatismos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Objetivas facilmente cambiáveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Fenômeno dos olhos vermelhos ao usar o flash externo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Erro de paralaxe nas imagens de paisagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Cartões de memória no mesmo equipamento.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q31
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q31', N'Com o avanço da tecnologia aplicada à fotografia digital foram introduzidas ao mercado as câmeras Mirrorless. Qual a principal diferença em comparação às câmeras DSLR?', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A ausência de obturador de alta velocidade, o que impede a captação de fotos em movimento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A ausência de sensores analógicos para foco manual em lentes objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A ausência de viewfinder digital que mostra a imagem real captada pela câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A ausência de espelho móvel no caminho óptico até o visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A ausência de sensores digitais que interpolam a resolução da imagem no caminho óptico', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q32
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q32', N'Todo sistema interno de funcionamento da maquina, as partes eletrônicas e mecânicas, constituem o corpo da câmera, que pode ser plástico ou metal, ou ainda a combinação dos dois. É onde está montado o chassi, que mantém o filme na posição correta no plano focal e precisa ser hermeticamente vedado à luz. Assim se constitui o corpo de uma maquina fotográfica. Essa maquina tem vários elementos e um desses elementos é o visor que serve para compro a imagem fotográfica. O nome do espelho usado nas maquinas reflex, que permite ao fotografo enxergar pelo visor exatamente o que vai ser impresso no filme é:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'rebobinador', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'pentaprisma', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'timer', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'contador de fotograma', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q33
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q33', N'No fotojornalismo, o trabalho consiste prioritariamente na realidade absoluta, nua e crua. Outro ponto importante dessa profissão é o factual, ou seja, registrar os acontecimentos nas mais variadas situações de luz e movimento, sem interferir na cena. Sendo assim, é importante saber escolher o melhor equipamento, que vai possibilitar a captura da imagem com mais qualidade. Nesse caso, a melhor escolha é a:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maquina DSLR de pequeno formato FULLFRAME', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'maquina DSLR de médio formato FULLFRAME', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'maquina DSLR compacta', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'maquina DSLR de grande formato', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q34
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q34', N'Câmeras analógicas de visor direto costumam apresentar defeito de paralaxe. Esse erro ocorre no processo de:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'focalização, gerando imagens sem nitidez sempre que o objeto principal da foto estiver em movimento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fotometragem, ocasionando imagens sub-expostas quando fontes de luz artificial são usadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'visualização, proporcionando uma diferença de enquadramento entre o que é observado através do visor e o que é efetivamente fotografado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fotometragem, impedindo que o flash seja acionado em situações de contra-luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'múltipla exposição, ocasionando imagens sobrepostas num mesmo fotograma ou arquivo digital.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q35
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q35', N'É característica de câmera SLR:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Possui um sistema óptico capaz de fazer com que a objetiva capte imagens a longas distâncias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Tem um sistema de espelhos que facilita a abertura do diafragma e a velocidade do tempo de obturação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Possui um sistema de espelhos e um pentaprisma que mostra a imagem no visor tal qual está sendo captada pela objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Tem uma grande distância focal que facilita a visualização da imagem que, na câmera escura, aparece invertida.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Possui um sistema óptico que facilita a entrada de luz que passa pelo diafragma e o obturador, facilitando a visualização da imagem.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q36
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q36', N'As câmeras de uso mais comum no fotojornalismo diário são as câmeras de 35 mm, por sua agilidade e as vastas opções em recursos. Por permitirem a troca de objetiva, dão a possibilidade para o fotografo ver, através do visor exatamente, o que será fotografado. Elas também são conhecidas por', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'câmera reflex TLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'câmera reflex SLR.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'câmera de visor direto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'câmera Pinhole.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'câmera de grande formato.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q37
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q37', N'Em fotografia, o erro de paralaxe consiste na(no):', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'abertura utilizada causa o desfoque do plano de fundo, fazendo com que o primeiro plano fique desfocado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'imagem captada pelo visor da câmera, que é diferente da captada pela objetiva, o que resulta, muitas vezes, em imagens cortadas em pontos não desejados.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'imagem, depois de ampliada, que apresenta riscos de borrões causados pelo uso de uma velocidade muito lenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'luz de fundo, sendo muito mais forte do que a luz frontal, provocando o escurecimento do primeiro plano.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'motivo em primeiro plano está debaixo de um sol a 90 graus e, para corrigir a sombra debaixo dos olhos e do pescoço, usa-se um flash de preenchimento.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q38
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q38', N'Instrumento utilizado na câmera fotográfica que, tem a função de reduzir a quantidade de luz que atinge a objetiva, mas não é relacionado, diretamente a cena fotográfica:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Pára-sol.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Chassi.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Tubo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Fole.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q39
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q39', N'Uma boa imagem fotográfica depende basicamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Da colaboração do fotografado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Somente da iluminação do ambiente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Do local em que se está fotografando.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Da sensibilidade e da habilidade do fotógrafo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Da sofisticação do equipamento fotográfico utilizado.', 0);

    -- Módulo 2 (Componentes da Câmera), questão original Q40
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Componentes da Câmera - Q40', N'PADRÃO VUNESP Observe a imagem a seguir. Na objetiva fotográfica, uma vez montada em uma câmera, a distância entre o Ponto Nodal, ou Ponto de Convergência, e o Sensor determina a', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sensibilidade do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'proporção entre base e altura do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'distância focal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'distância mínima do objeto em foco e o sensor.', 0);

    -- Módulo 3 (Objetivas), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q01', N'Lentes de foco variável são denominadas:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Zoom.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Angulares.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Teleobjetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Grande-angulares.', 0);

    -- Módulo 3 (Objetivas), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q02', N'Qual a diferença entre uma lente e uma objetiva?', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Objetiva serve para câmeras populares e lente para câmeras profissionais', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A lente tem vários elementos e a objetiva, apenas um elemento', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A objetiva tem vários elementos e a lente, um único elemento', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'São a mesma coisa, apenas com nomes diferente', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Uma é e plástico e a outra de cristal', 0);

    -- Módulo 3 (Objetivas), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q03', N'As objetivas são classificadas em três grandes grupos: Teleobjetiva, Objetiva Grande Angular ou Objetiva Normal / Padrão. A objetiva que apresenta o campo de visão mais próximo ao do olho humano e sem nenhum tipo de distorção / deformação, ou seja, ela nem afasta, nem aproxima, nem amplia ou nem diminui a cena a ser captada e foi amplamente utilizada durante mais da metade do século XX, principalmente na fotografia documental com destaque ao fotógrafo Henri Cartier -Bresson, é a objetiva de:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'35mm', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'50mm', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'85mm', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1200mm', 0);

    -- Módulo 3 (Objetivas), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q04', N'Considerando as lentes de 24 mm, 50 mm, 105 mm, 200 mm, 400 mm, responda qual delas oferecerá maior profundidade de campo em f 2.8?', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'200 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'50 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'24 mm.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'105 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'400 mm.', 0);

    -- Módulo 3 (Objetivas), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q05', N'Uma objetiva é chamada de normal quando cobre um ângulo aproximado de:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'60º.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'18º.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'45º.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'90º.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'25º.', 0);

    -- Módulo 3 (Objetivas), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q06', N'Quais das distâncias focais abaixo representa uma objetiva normal e uma grande angular respectivamente?', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'70mm e 35mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'80mm e 50mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'50mm e 24mm.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'50mm e 200mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'100mm e 28mm.', 0);

    -- Módulo 3 (Objetivas), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q07', N'Ainda com relação as objetivas assinale qual das alternativas abaixo apresenta informação INCORRETA a respeito do angulo de cobertura das objetivas.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Uma objetiva de 400mm é classificada como uma grande angular e é apropriada para fotografar objetos que se encontram distantes do fotografo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Uma objetiva de 20mm é classificada como uma grande angular pois possui distancia focal inferior a 50mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Uma objetiva de 17mm é uma grande angular muito adequada quando se precisa fotografar um grupo de pessoas em um lugar com pouco espaço de recuo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A objetiva de 50mm é considerada uma objetiva normal pois abarca um angulo de cobertura de aproximadamente 46º, muito próximo do angulo da visão humana.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Todas as objetivas com distancia focal superior a 50mm são consideradas teleobjetivas e proporcionam um angulo de cobertura mais fechado.', 0);

    -- Módulo 3 (Objetivas), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q08', N'Qual tipo de objetiva possui o nome característico de olho de peixe:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Grande-angular.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Zoom.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Padrão.', 0);

    -- Módulo 3 (Objetivas), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q09', N'Uma objetiva é dita normal quando', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sua distância normal é de 10 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o comprimento da objetiva é normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o diâmetro da objetiva é normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'produz uma imagem próxima à da visão humana normal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sua distância normal é de 200 mm.', 0);

    -- Módulo 3 (Objetivas), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q10', N'As objetivas podem ser definidas como um container para os elementos óticos, mecânicos e eletrônicos responsáveis por levarem a luz refletida pela cena até o sensor. Basicamente, a objetiva é responsável pelos controles e ajustes de abertura de diafragma, o ponto de focagem e, eventualmente, a distância focal. Para cada distância focal de uma objetiva, tem-se um campo de visão diferente, ou seja, uma quantidade diferente de cena que será captada. Sobre o campo de visão das objetivas, analise as afirmativas abaixo e dê valores Verdadeiro (V) ou Falso (F). ( ) Quanto maior a distância focal, maior fica o ângulo de visão. ( ) Uma objetiva de 50mm exibe aproximadamente 43 graus, que é o ângulo mais próximo da visão humana. ( ) Uma objetiva de 1200mm de distância focal tem um menor campo de visão do que uma objetiva de 8mm de distância focal. Assinale a alternativa que apresenta a sequência correta de cima para baixo.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'F - V - V', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'V - F - F', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'V - V - F', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'F - V - F', 0);

    -- Módulo 3 (Objetivas), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q12', N'Sendo a fotografia um meio de expressão, é natural que cada um queira interpretar o mundo por sua ótica própria, o que implica, entre outras coisas, a escolha de um tipo de objetiva. Cada objetiva tem sua linguagem específica, ou seja, sua forma particular de reproduzir a realidade, de acordo com sua capacidade. As objetivas de uso comum podem ser de três tipos:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'regular, microscópica ou extensiva;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'normal, grande angular ou tele;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'padrão, grande angular ou macroscópica;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'mini, maxi ou standard;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'tele, standard ou normal.', 0);

    -- Módulo 3 (Objetivas), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q13', N'A respeito das objetivas acopláveis às câmeras monorreflex modelo 35mm, analise as afirmativas a seguir. I. O grupo de objetivas zoom são lentes com distância focal variável. II. Considerando as objetivas normais como referência, as que possuem distância focal menor que 40mm, são consideradas grande angulares. III. As objetivas macro são próprias para se obter detalhes de objetos ou pessoas e também para fotografar pequenos assuntos. Assinale:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'se somente a afirmativa I estiver correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'se somente a afirmativa II estiver correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'se somente as afirmativas I e II estiverem corretas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'se somente as afirmativas II e III estiverem corretas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'se todas a afirmativas estiverem corretas.', 1);

    -- Módulo 3 (Objetivas), questão original Q14
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q14', N'A objetiva fotográfica consiste na lente que se monta na frente da câmara. Sobre as objetivas, considere as seguintes afirmativas: 1. São características fundamentais das objetivas a distância focal, o ângulo de cobertura e a luminosidade. 2. Quanto menor a distância focal de uma objetiva, maior o ângulo de cobertura. 3. A objetiva de 50 mm é chamada de normal, pois percebe a cena de maneira muito parecida com o olho humano. 4. Uma teleobjetiva aproxima o primeiro plano e o fundo, provocando um aparente achatamento entre os planos da imagem. Assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Somente a afirmativa 3 é verdadeira.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Somente as afirmativas 1 e 2 são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Somente as afirmativas 2, 3 e 4 são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Somente as afirmativas 2 e 4 são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'As afirmativas 1, 2, 3 e 4 são verdadeiras.', 1);

    -- Módulo 3 (Objetivas), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q15', N'Assinale a alternativa que indica o tipo de objetiva mais apropriado para fotografar um objeto de grande porte em um ambiente com pouco recuo.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Grande angular.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Polarizador.', 0);

    -- Módulo 3 (Objetivas), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q16', N'Para fotografias em interiores com o interesse de enquadrar todo o espaço interno por inteiro, qual é a objetiva que se deve utilizar?', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Macroobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Microobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Objetiva normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Objetiva grande angular.', 1);

    -- Módulo 3 (Objetivas), questão original Q17
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q17', N'A distância focal de uma objetiva, medida em milímetros, é a distância entre:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'os elementos óticos da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o objeto fotografado e a objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o centro ótico da lente e o sensor da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o objeto fotografado e o sensor da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o objeto fotografado e a objetiva.', 0);

    -- Módulo 3 (Objetivas), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q18', N'Considere que um indivíduo foi contratado para fotografar objetos bem pequenos para um museu da cidade e que as fotos serão utilizadas em um catálogo a ser distribuído pela prefeitura. Nesse caso, qual é a objetiva mais adequada para ser utilizada nesse trabalho?', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Teleobjetiva curta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Macro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Grande angular.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Olho de peixe.', 0);

    -- Módulo 3 (Objetivas), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q19', N'Sobre objetivas fotográficas, é correto afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As melhores objetivas são aquelas formadas por lentes simples, como as dubletos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'As lentes de plástico industrial produzem imagens tão boas como as de vidro óptico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O ângulo de visão de uma objetiva de 300 mm é maior do que o ângulo de visão de uma objetiva de 50 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Quanto maior a distância focal, menor o ângulo de visão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'As objetivas modernas não permitem o foco manual.', 0);

    -- Módulo 3 (Objetivas), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q20', N'Em uma missa campal, com mais de 50 mil pessoas reunidas em frente ao altar, o fotojornalista escalado para a cobertura do evento procurou fazer uma imagem frontal e panorâmica dos fiéis, de modo a conseguir o máximo de nitidez nos rostos. Nesse contexto, é correto afirmar que o profissional de imagem:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'optará por uma foto com pouca profundidade de campo e, por isso, deverá usar uma teleobjetiva e uma velocidade alta no obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'escolherá uma grande angular e fará sua foto com o diafragma mais fechado que a condição de luminosidade do ambiente permitir.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'selecionará uma velocidade baixa no obturador para garantir o efeito de panning na imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'trabalhará com uma objetiva catadióptrica e escolherá o diafragma mais aberto que as condições de luz ambiente permitirem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizará uma zoom e sistemas de exposição e focalização automáticos de modo a garantir o foco seletivo apenas no primeiro plano da imagem.', 0);

    -- Módulo 3 (Objetivas), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q21', N'Numere a segunda coluna de acordo com a primeira, associando as objetivas geralmente usadas aos tipos de fotografias. (1) Retrato () Grande angular (2) Paisagem () Meia teleobjetiva (3) Pequenos detalhes () Macroobjetiva (4) Reportagem social () Zoom (5) Astronomia () Superteleobjetiva (6) Fotografias de 180º A ordem correta dos números da segunda coluna, de cima para baixo, é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'2 – 1 – 3 – 4 – 5.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'2 – 4 – 1 – 6 – 5.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'3 – 1 – 4 – 5 – 6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'5 – 3 – 2 – 6 – 4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'6 – 5 – 2 – 3 – 1.', 0);

    -- Módulo 3 (Objetivas), questão original Q22
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q22', N'Para arredondar ainda mais a imagem da arquitetura de um estádio de futebol, o fotógrafo escolheu uma objetiva de 8 mm para sua SLR analógica de 35mm. Seu ângulo de visão se aproximou dos 180º, pois a objetiva escolhida foi uma:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'automática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'olho de peixe.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'espelhada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'teleobjetiva.', 0);

    -- Módulo 3 (Objetivas), questão original Q23
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q23', N'Variar o uso de objetivas é um recurso para facilitar as tomadas fotográficas em diferentes ambientes. As colunas 1 e 2, abaixo, relacionam o uso de diversos tipos de objetivas que são indicadas para situações ambientais específicas. Assinale a alternativa que apresenta as relações CORRETAS entre as colunas.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I–B; II–A; III–C; IV–D', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'I–A; II–D; III–B; IV–C', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'I–D; II–C; III–A; IV–B', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I–C; II–B; III–D; IV–A', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I–B; II–A; III–D; IV–C', 0);

    -- Módulo 3 (Objetivas), questão original Q24
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q24', N'Para que pudesse aproximar a cena ao longe, um fotógrafo optou por usar __________. Mais tarde, quando ele se interessou por um detalhe próximo da câmera, trocou essa objetiva por __________. As expressões que completam correta e respectivamente as lacunas do enunciado acima são', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'uma grande angular – uma macroobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'uma macroobjetiva – um zoom.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'uma mais luminosa – uma menos luminosa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'um zoom – uma grande angular.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'uma teleobjetiva – uma macroobjetiva.', 1);

    -- Módulo 3 (Objetivas), questão original Q25
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q25', N'A grande maioria das câmeras digitais do mercado oferecem o recurso de zoom ótico e digital. O zoom ótico permite:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'que você se aproxime da cena conservando a qualidade ótica da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'que você se aproxime da cena mas não conserva a qualidade ótica da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a utilização do zoom via software, no entanto isso pode limitar o tamanho final da impressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a utilização do zoom via software mas pode limitar sua qualidade quando se utiliza o tamanho máximo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a utilização do zoom via software e aumenta a qualidade da imagem quando se utiliza o tamanho máximo.', 0);

    -- Módulo 3 (Objetivas), questão original Q26
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q26', N'Capta os raios de luz refletidos pelo objeto a ser fotografado e projeta-os sobre a emulsão sensível. Estamos falando de:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Visor.', 0);

    -- Módulo 3 (Objetivas), questão original Q27
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q27', N'O ângulo de cobertura (ou ângulo de campo visual) de uma objetiva refere-se a área que esta pode cobrir à sua frente. Esta característica é determinada pela:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'distância do objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'distância focal da objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sensibilidade do filme/sensor.', 0);

    -- Módulo 3 (Objetivas), questão original Q28
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q28', N'Para fotografar objetos com enquadramentos muito fechados e com bastante nitidez, a lente indicada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Macro', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Teleobjetiva', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Grande angular', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Olho de Peixe', 0);

    -- Módulo 3 (Objetivas), questão original Q29
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q29', N'Analise o texto a seguir. As objetivas são identificadas através de sua/seu _____________________, que é a distância entre o/a ____________ da lente até o/a _________________. A alternativa que preenche, correta e respectivamente, as lacunas, de cima para baixo, é:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'distância focal – obturador – centro ótico ou ponto nodal', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'plano focal – distância focal – centro ótico ou ponto nodal', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'centro ótico ou ponto nodal – distância focal – plano focal', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'plano focal – diafragma – distância focal', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'distância focal – centro ótico ou ponto nodal – plano focal', 1);

    -- Módulo 3 (Objetivas), questão original Q30
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q30', N'Em relação às objetivas, relacione a Coluna 1 à Coluna 2. Coluna 1 1. Grande-angular. 2. Normal. 3. Teleobjetiva. Coluna 2 ( ) Tende a achatar os planos, aproximar os elementos e ter menor ângulo de visão. ( ) Afasta os planos, gera distorção e tem maior ângulo de visão. ( ) Objetiva de referência, ângulo de visão próximo ao do olho humano. A alternativa que preenche corretamente os parênteses, de cima para baixo, é:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'2 – 3 – 1.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1 – 2 – 3.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'2 – 1 – 3.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'3 – 1 – 2.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'3 – 2 – 1.', 0);

    -- Módulo 3 (Objetivas), questão original Q31
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q31', N'PADRÃO VUNESP Para um sistema fotográfico de películas 35mm, uma teleobjetiva e uma objetiva grande-angular seriam, respectivamente, as que apresentam as distâncias focais:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'35 mm e 45 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'35 mm e 50 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'50 mm e 35 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'50 mm e 120 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'120 mm e 35 mm.', 1);

    -- Módulo 3 (Objetivas), questão original Q32
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q32', N'Sobre os principais tipos de objetivas fotográficas, bem como suas características, assinale com V as afirmativas verdadeiras e F as falsas. ( ) A primeira objetiva é uma grande angular, geralmente utilizada para fotos de paisagens. ( ) A objetiva normal se aproxima a visão do olho humano e tem uma tendência a focar melhor todos os planos. ( ) A teleobjetiva tem um ângulo de visão próximo ao do olho humano. ( ) A grande angular é muito utilizada para dar sensação de imensidão em paisagens fotográficas. Assinale a sequência correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'V F V F', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'F V F V', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'F V V F', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'V F F V', 0);

    -- Módulo 3 (Objetivas), questão original Q33
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q33', N'As câmeras monoreflex analógicas e digitais permitem ao fotógrafo mudar o tipo de objetiva, possibilitando alterar a forma com que a câmera irá captar a imagem. Dependendo do tipo de objetiva, o fotógrafo poderá captar detalhes ou mesmo áreas mais amplas. Qual é o tipo de objetiva utilizada para fotografar retratos do rosto das pessoas, em que o fundo tende a ficar desfocado?', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Grande angular.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Teleobjetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Zoom.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Olho de peixe.', 0);

    -- Módulo 3 (Objetivas), questão original Q34
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q34', N'Com relação à distância focal, assinale a alternativa incorreta.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A distância focal define o ângulo de abertura da visão em que a câmera irá captar a imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A distância focal define o tipo de objetiva que o fotógrafo irá utilizar em relação ao tamanho da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A distância focal define a área nítida em uma imagem em relação à abertura do diafragma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A distância focal define diretamente a relação entre as objetivas e o tamanho do plano focal.', 0);

    -- Módulo 3 (Objetivas), questão original Q35
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q35', N'Há lentes, que são, ao mesmo tempo, côncavas, convexas ou mistas e, por meio delas, a máquina fotográfica recebe os raios de luz para sensibilizar o suporte analógico ou digital. Essa descrição corresponde', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao espelho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'à objetiva.', 1);

    -- Módulo 3 (Objetivas), questão original Q36
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q36', N'Considere as descrições a seguir de quatro tipos de objetiva: 1) Possui um ângulo de captação da imagem considerado próximo ao do olho humano; 2) Possui um ângulo de captação da imagem mais fechado de todas as objetivas; 3) Possui um ângulo de captação da imagem mais aberto de todas as objetivas; 4) Possui ângulos de captação da imagem variáveis, conforme as variações das distâncias focais. As descrições 1, 2, 3 e 4, correspondem, respectivamente, a', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'objetiva zoom, objetiva grande angular, objetiva normal e teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'objetiva normal, teleobjetiva, objetiva grande angular e objetiva zoom.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'teleobjetiva, objetiva zoom, objetiva grande angular e objetiva normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'objetiva grande angular, objetiva normal, objetiva zoom e teleobjetiva.', 0);

    -- Módulo 3 (Objetivas), questão original Q37
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q37', N'Grande angular é:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a velocidade do obturador, correspondente a erro de paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a teleobjetiva com suporte para flash eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a lente ou objetiva, que tem um ângulo de visão maior que o olho humano.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a velocidade do diafragma corresponde à visão eletrônica do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a lente que possui o menor ângulo de visão.', 0);

    -- Módulo 3 (Objetivas), questão original Q38
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q38', N'Conhecer as principais características de uma câmera fotográfica, bem como o tipo de fotografia a que se destina, é fundamental para o trabalho de um fotógrafo profissional. Analise as afirmativas a seguir em relação às câmeras fotográficas I. A câmera monoreflex é utilizada prioritariamente pelo mercado amador. II. A câmera de médio formato tem alto custo e é utilizada no mercado profissional. III. A câmera monoreflex digital é amplamente utilizada na fotografia de eventos. Estão corretas as afirmativas', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I e II, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'II e III, apenas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'I e III, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I, II e III.', 0);

    -- Módulo 3 (Objetivas), questão original Q39
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q39', N'Estou em uma praia e desejo fotografar uma pessoa que se encontra acerca de 120 metros de distância. Meu objetivo e retratá-la em plano médio. Por isto, devo usar uma lente', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'24 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'50 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Teleobjetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Grande Angular.', 0);

    -- Módulo 3 (Objetivas), questão original Q40
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q40', N'Podemos dizer que na fotografa a luz é o diferencial, a chamada “cereja do bolo” e, saber usá-la pode significar um bom resultado final em um trabalho fotográfico. Quase tudo que emite luz pode ser uma fonte de iluminação para uma imagem. I. A luz do sol é natural e se modifica ao longo do dia, em fotografa dizemos que, ela esta no ambiente e dela faz parte. II. É uma luz fraca (sol), que se modifica durante todo o dia, mas facilmente controlada através do diafragma. III. Uma luz dura é aquela que não incide diretamente no objeto fotografado, criando sombras de difícil correção. IV. A luz suave é aquela que gera sombras sem contornos definidos, dias ensolarados são um bom exemplo deste tipo de luz. V. O Flare é um defeito ótico causado quando o o diafragma esta com defeito. Assinale a alternativa que apresenta as afirmativas incorretas:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'II, III, IV apenas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'II, III, IV, V apenas', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'III, IV, V apenas', 0);

    -- Módulo 3 (Objetivas), questão original Q41
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q41', N'As lentes macro têm a capacidade de registrar objetos em enquadramentos muito fechados, mas com extrema nitidez. É possível registrar um inseto ou o desenho de um olho com seus mínimos traços. -Teleobjetiva: Registrar elementos que estejam muito distantes da câmera é um desafio que só as lentes do tipo telefoto são capazes de resolver. -Grande Angular: Esse tipo de lente tem a capacidade de fotografar enormes espaços, paisagens, o horizonte, prédios, construções ou monumentos inteiros com muita facilidade devido ao seu amplo campo de visão, também conhecido como “distância focal” -Olho de Peixe: Uma lente Olho de Peixe ou Fish Eye nada mais é do que uma super grande angular. Ela é tão angular que as imagens são esféricas e distorcidas, criando a impressão de uma enorme profundidade de campo. A respeito dos vários tipos de câmeras digitais, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'as câmeras do tipo compactas têm lentes intercambiáveis, com diafragmas de grande abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a maioria das câmeras do tipo mirrorless usam lentes das câmeras DSLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'as câmeras 3D possuem quatro lentes que capturam as imagens fazendo a seleção automática das cores fundamentais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'nas câmeras DSLR a imagem “vista” pelas lentes é exatamente a mesma observada no wiewfinder.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'as câmeras superzoom têm uma grande variedade de lentes para serem trocadas.', 0);

    -- Módulo 3 (Objetivas), questão original Q42
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q42', N'Com característica de abranger um amplo ângulo de cobertura e acentuar a perspectiva de uma cena, essa objetiva é chamada de', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'grande angular.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'tele.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'hiperfocal', 0);

    -- Módulo 3 (Objetivas), questão original Q43
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q43', N'Assinale a alternativa CORRETA sobre os tipos de lentes em relação à distância focal.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Normais, grande-angular, teleobjetiva e duo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Normais, grande-angular, teleobjetiva e micro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Normais, bifocais, teleobjetiva e duo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Normais, grande-angular, teleobjetiva e zoom.', 1);

    -- Módulo 3 (Objetivas), questão original Q44
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q44', N'As lentes ou objetivas fotográficas são itens fundamentais no acervo dos equipamentos do fotógrafo. Cada formato de objetiva proporciona um ângulo de visão diferente, resultando em distintos registros de uma mesma situação. No formato 35 mm, a objetiva com distância focal de 50 mm é aquela que mais se aproxima do ângulo de visão do ser humano. As objetivas, representadas por sua distância focal, que proporcionam o registro de uma imagem com ângulo de visão mais amplo e mais estreito que a visão humana são, respectivamente,', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'200 mm − 20 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'135 mm − 70 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'70 mm − 135 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'12 mm − 35 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'20 mm − 135 mm.', 1);

    -- Módulo 3 (Objetivas), questão original Q45
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q45', N'Para fotografar uma reunião visualizando todos os participantes em uma sala de 4m x 3m, é necessário usar uma objetiva com que distância focal?', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Pequena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Média.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Grande.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Super.', 0);

    -- Módulo 3 (Objetivas), questão original Q47
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q47', N'Qual objetiva atende melhor aos trabalhos de um fotógrafo de arquitetura quando precisa corrigir a perspectiva?', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Objetiva tele.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Objetiva PC.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Objetiva normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Objetiva super tele.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Objetiva grande angular.', 0);

    -- Módulo 3 (Objetivas), questão original Q48
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q48', N'PADRÃO VUNESP Observe as imagens a seguir. X Y Considerando que ambas as fotografias foram registradas no mesmo local, hora do dia e no mesmo eixo de enquadramento, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Ambas as imagens foram registradas com objetivas de igual distância focal, mas na imagem “Y”, o fotógrafo estava mais próximo da modelo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A imagem “X” foi registrada com uma grande-angular, enquanto a imagem “Y” foi registrada com uma teleobjetiva, e o fotógrafo aproximou-se da modelo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A imagem “X” foi registrada com uma teleobjetiva, enquanto a imagem “Y” foi registrada com uma grande-angular, e o fotógrafo aproximou-se da modelo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A imagem “X” foi registrada com uma teleobjetiva, enquanto a imagem “Y” foi registrada com uma grande-angular, e o fotógrafo distanciou-se da modelo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A imagem “X” foi registrada com uma grande-angular, enquanto a imagem “Y” foi registrada com uma teleobjetiva, e o fotógrafo distanciou-se da modelo.', 1);

    -- Módulo 3 (Objetivas), questão original Q49
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q49', N'Ao fotografar com objetivas rápidas, consideramos que:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'É indispensável o uso de um tripé.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O flash é um acessório indispensável.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Precisamos usar um ISO de maior sensibilidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Ao usar uma abertura (diafragma) máxima, precisamos de pouca luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Ao usar uma abertura (diafragma) máxima, precisamos de mais luz.', 0);

    -- Módulo 3 (Objetivas), questão original Q50
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q50', N'Com relação à distância focal da objetiva, identifique as afirmativas a seguir como verdadeiras (V) ou falsas (F): ( ) Quanto maior for a distância focal de uma objetiva, menor será seu ângulo de visão. ( ) Uma teleobjetiva tem uma distância focal mais longa do que uma objetiva grande angular. ( ) Quanto maior for a distância focal, menor será a "profundidade de campo". ( ) Uma objetiva normal tem uma distância focal igual à diagonal do CCD ou CMOS da câmera. Assinale a alternativa que apresenta a sequência correta, de cima para baixo.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'F – F – F – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'F – V – V – F.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'V – V – F – F.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'F – F – V – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'V – V – V – V.', 1);

    -- Módulo 3 (Objetivas), questão original Q51
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q51', N'Os efeitos de perspectiva da grandeangular proporcionam:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior profundidade de campo aparente e ligam o objeto a seu plano de fundo', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a redução da profundidade de campo e da nitidez da imagem', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a compressão da separação espacial e longitudinal da imagem', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o achatamento da perspectiva e mantêm o equilíbrio estrutural da imagem', 0);

    -- Módulo 3 (Objetivas), questão original Q52
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q52', N'Uma importante parte das especificações de qualquer objetiva é a proximidade que ela pode focalizar. As objetivas especiais para macrofotografia são projetadas para que mesmo objetos muito pequenos possam parecer grandes no quadro. Para se alcançar bons resultados com o uso de objetivas macro, pode-se afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'não há precisão de foco a uma pequena distância do objeto, uma vez que a profundidade de campo é grande.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'optando-se por usar maiores aberturas, obtém-se maior profundidade de campo, uma vez que a precisão do foco é crucial a uma pequena distância do objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'optando-se por menores aberturas, obtém-se menor profundidade de campo, o que nos permite fotografar a maior distância e ampliar o objeto fotografado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a precisão de foco é crucial a uma pequena distância do objeto, uma vez que a profundidade de campo é muito limitada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'com o uso das objetivas macro, independentemente da abertura selecionada, obtém-se praticamente toda a imagem em foco, visto a grande profundida de campo proporcionada por esse tipo de lente.', 0);

    -- Módulo 3 (Objetivas), questão original Q53
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q53', N'São chamadas “objetivas rápidas” aquelas que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'são particularmente usadas em fotos de esporte, com longos tempos de exposição, visando à eliminação da imagem “tremida”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'têm pequenas aberturas, capazes de deixar pouca luz entrar, especialmente úteis em situações de alta luminosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'têm grandes aberturas, capazes de filtrar a luz necessária à exposição, especialmente úteis quando não há filtros acessórios à disposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'têm grandes aberturas, com maior capacidade de aproveitamento da luz disponível, especialmente úteis em condições de pouca iluminação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'têm baionetas que permitem trocas rápidas quando se deseja mudar a distância focal do enquadramento e não se tem, à disposição, uma objetiva zoom.', 0);

    -- Módulo 3 (Objetivas), questão original Q54
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q54', N'PADRÃO VUNESP Observe as imagens a seguir e assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A imagem “A” foi registrada com uma teleobjetiva, enquanto a imagem “B” foi registrada com uma grande-angular, e o fotógrafo se afastou da modelo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A imagem “A” foi registrada com uma teleobjetiva, enquanto a imagem “B” foi registrada com uma grande-angular, e o fotógrafo se aproximou da modelo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A imagem “A” foi registrada com uma grande-angular, enquanto a imagem “B” foi registrada com uma teleobjetiva, e o fotógrafo se afastou da modelo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A imagem “A” foi registrada com uma grande-angular, enquanto a imagem “B” foi registrada com uma teleobjetiva, e o fotógrafo se aproximou da modelo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Ambas as imagens foram registradas com a mesma objetiva, mas na imagem “B” o fotógrafo estava significativamente mais próximo a modelo.', 0);

    -- Módulo 3 (Objetivas), questão original Q55
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q55', N'A distância focal de uma objetiva considerada como “normal” (também chamada de objetiva-padrão) é, aproximadamente, igual', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao raio da imagem circular formada pela objetiva sobre a área do filme ou sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'à diagonal do formato da janela.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à distância entre o ponto nodal e o filme ou sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'à distância entre o ponto nodal e o último elemento óptico da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'à diagonal do formato da janela dividida por π .', 0);

    -- Módulo 3 (Objetivas), questão original Q56
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q56', N'A objetiva que apresenta ângulo de tomada de imagem bem maior do que 45 graus denomina-se:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Macro', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Normal', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Grande angular', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Teleobjetiva', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Super teleobjetiva', 0);

    -- Módulo 3 (Objetivas), questão original Q57
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q57', N'As objetivas fotográficas se dividem em três principais categorias, a saber:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'grande angular, normal e teleobjetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'esférica, normal e teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'esférica, anamórfica e normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'grande angular, anamórfica e teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'grande angular, esférica e anamórfica.', 0);

    -- Módulo 3 (Objetivas), questão original Q58
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q58', N'Numa lente fotográfica, a indicação 50 mm está relacionada com', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a distância da câmera até o objeto fotografado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a sensibilidade à luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o ângulo de visão da lente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a abertura do diafragma.', 0);

    -- Módulo 3 (Objetivas), questão original Q59
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q59', N'Identifique a afirmação correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'quanto maior a distância focal de uma objetiva, menor o seu ângulo de visão;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diafragmas fechados proporcionam pouca profundidade de campo, devido à aberração esférica das lentes;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'objetivas catadiópticas são aquelas que, devido ao arranjo interno das lentes, permitem focalização de objetos próximos;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'objetivas “olho de peixe”, devido a sua grande distância focal, têm ângulo de visão semelhante ao da vista humana;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'objetivas fotográficas são construídas de modo a proporcionar a completa absorção da luz, eliminando toda reflexão e refração.', 0);

    -- Módulo 3 (Objetivas), questão original Q60
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q60', N'Em relação aos tipos de câmera é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'as câmeras monorreflex não permitem a troca de objetivas;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o controle da velocidade de obturação só é possível em câmeras reflex de duas objetivas;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o flash embutido pode ser encontrado em câmeras de visor direto e monorreflex;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'somente câmeras de visor direto usam filmes 135 mm;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'câmeras monorreflex não possuem fotômetro embutido.', 0);

    -- Módulo 3 (Objetivas), questão original Q61
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q61', N'São características das teleobjetivas:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'distância focal inferior a da objetiva normal;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'afastamento dos planos da imagem, aumentando a noção de amplitude em ambientes pequenos;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'distância focal superior a 50 mm e capacidade de aproximação dos planos fotografados;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'proporcionarem muita profundidade de campo, mesmo com diafragma aberto;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'permitir a alteração da distância focal sem a necessidade de troca da objetiva.', 0);

    -- Módulo 3 (Objetivas), questão original Q62
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q62', N'Um profissional está fazendo a cobertura fotográfica de um evento em que não se deve chegar próximo dos participantes. Contudo, para que ele registre esse momento, executando uma fotografia com um enquadramento fechado, ele deve usar a lente', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'grande-angular.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'normal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'teleobjetiva.', 1);

    -- Módulo 3 (Objetivas), questão original Q63
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q63', N'Uma lente objetiva é considerada normal quando:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'seu diâmetro ultrapassa 70 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sua distância focal é inferior a 10 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'possui efeito “olho de peixe” ou “fisheye’’.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'capta imagens com distorção mínima semelhante à visão humana.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'possui efeito de aproximação e achatamento da imagem captada.', 0);

    -- Módulo 3 (Objetivas), questão original Q64
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q64', N'Recurso que em algumas câmera fotográficas digitais possibilita a fotografação em baixa velocidade e sem que saia tremida, denomina-se', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Estabilizador telemétrico', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Reticulador de pixels', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Imagem latente', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Estabilizador de imagem', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Estabilizador fotométrico', 0);

    -- Módulo 3 (Objetivas), questão original Q65
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q65', N'Os discos concêntricos causados pelo reflexo do sol na objetiva são conhecidos por:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Círculos de confusão', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Anéis de Newton', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Efeito Calllier', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Véu dicroico', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Defeitos de brilho', 0);

    -- Módulo 3 (Objetivas), questão original Q66
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q66', N'Como o monopé pode auxiliar o fotógrafo?', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Dando estabilidade quando no uso de teleobjetivas pesadas ou fotografando com baixa velocidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Equilibrando o peso do flash eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Evitando que o fotógrafo caia ou tropece quando fotografar em locais altos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Protegendo a câmera em caso que chuva ou queda.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Dando mais estabilidade quando acoplado a um tripé, criando um quadripé tipo bancada.', 0);

    -- Módulo 3 (Objetivas), questão original Q67
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q67', N'No jargão fotográfico, o que significa “lente clara”?', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'São todas as teleobjetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'São objetivas equipadas com diafragmas que permitem grande entrada de luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'São objetivas feitas para o sistema mirrorless.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'São objetivas com aberturas de diafragma f/8 ou menor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'São todas as lentes feitas em material externo branco.', 0);

    -- Módulo 3 (Objetivas), questão original Q68
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q68', N'Uma objetiva fotográfica tem por finalidade captar as informações luminosas do ambiente e transferi-las para o suporte sensível da câmera. Assinale a alternativa que apresenta a relação CORRETA entre distância focal e ângulo (em graus) de abrangência em uma câmera de 35 mm de “quadro cheio”:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'300 mm – 46 graus; 105 mm – 23 graus; 50 mm – 8 graus.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'300 mm – 23 graus; 105 mm – 46 graus; 50 mm – 8 graus.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'300 mm – 12 graus; 105 mm – 24 graus; 50 mm – 48 graus.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'300 mm – 8 graus; 105 mm – 16 graus; 50 mm – 32 graus.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'300 mm – 8 graus; 105 mm – 23 graus; 50 mm – 46 graus.', 1);

    -- Módulo 3 (Objetivas), questão original Q69
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q69', N'Assinale a alternativa CORRETA. As lentes objetivas zoom permitem mudar a ampliação de uma imagem sem precisar trocar a objetiva. A lente zoom é projetada para mudar o campo de visão da objetiva enquanto mantém a imagem em foco. A melhor maneira de usar uma objetiva zoom é:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ajustá-la na distância focal em que se imagina produzir o efeito pretendido.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar o fotômetro para obter fotos que realcem mais as cores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'acionar o flash e regular a câmera para uma velocidade lenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ajustar o ISO de acordo com a luz ambiente.', 0);

    -- Módulo 3 (Objetivas), questão original Q70
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Objetivas - Q70', N'Um fotógrafo queria produzir uma foto em plano geral do auditório de um evento muito grande. O desejo desse fotógrafo, nessa foto, era mostrar que a palestra estava cheia e a imensidão do local. Com base nessa situação, o melhor a se fazer, para registrar detalhes nas sombras e mostrar as pessoas, é utilizar uma objetiva', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'grande angular com ISO de 3 200.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'macro com ISO 100.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'teleobjetiva com ISO de 3 200.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'supertele com ISO 100.', 0);

    -- Módulo 4 (Diafragma), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q01', N'As aberturas de diafragma são expressas em números f. Assinale qual dos números f abaixo permite maior passagem de luz pela objetiva.', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f: 5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f: 4.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f:16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f:8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f:22.', 0);

    -- Módulo 4 (Diafragma), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q02', N'A referência de notação que indica que uma escala se refere ao diafragma é', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Número “s”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Número “d”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Número “f”.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Número “g”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'“Número”.', 0);

    -- Módulo 4 (Diafragma), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q03', N'Aumentar o tamanho da abertura para permitir uma entrada maior de luz pela objetiva, poderia ser traduzida pela expressão:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Fechar o diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Abrir o diafragma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Medir o diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Ampliar o diafragma.', 0);

    -- Módulo 4 (Diafragma), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q04', N'Qual a função principal do diafragma?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Controlar a quantidade de luz que passa pela objetiva', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Controlar a iluminação no centro da imagem', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Regular a nitidez da imagem', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Regular o contraste e o tamanho da imagem', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Dar mais velocidade à câmera', 0);

    -- Módulo 4 (Diafragma), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q05', N'Qual a denominação que se dá ao diafragma de uma objetiva que seja formada por várias palhetas?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Radial', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Perimetral', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Circular', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Íris', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Palhetal', 1);

    -- Módulo 4 (Diafragma), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q06', N'Em quais das aberturas de diafragma obterei uma imagem com maior profundidade de campo?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'2.8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'22.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'32.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'11.', 0);

    -- Módulo 4 (Diafragma), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q08', N'Os fatores que determinam a profundidade de campo numa fotografia são diversos. Para uma profundidade de campo maior devemos utilizar:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'menor abertura do diafragma, maior distância do objeto, menor distância focal da objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'menor abertura do diafragma, menor distância do objeto, maior distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'menor abertura do diafragma, maior distância do objeto, maior distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'maior abertura do diafragma, menor distância do objeto, maior distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'maior abertura do diafragma, maior distância do objeto, maior distância focal da objetiva.', 0);

    -- Módulo 4 (Diafragma), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q09', N'A expressão “números-f” refere-se', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aos ajustes do foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao controle de velocidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao tempo de entrada de luz na câmara.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'à distância focal das objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'às regulagens do diafragma.', 1);

    -- Módulo 4 (Diafragma), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q10', N'O diafragma da câmera, além de possibilitar a passagem de luz necessária para sensibilizar o filme/sensor, serve também para alterar:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o ISO do filme/sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a velocidade do filme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o ângulo do visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a área iluminada.', 0);

    -- Módulo 4 (Diafragma), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q11', N'O resultado do uso do diafragma', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'será mais nítido quando a abertura for intermediária, entre todas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'será tanto mais nítido quanto maior for sua abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'será tanto mais nítido quanto menor for sua abertura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'só será nítido se a foto for realizada sob a luz do sol.', 0);

    -- Módulo 4 (Diafragma), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q12', N'PADRÃO VUNESP Trata-se de um expressivo elemento da linguagem fotográfica que pode ser controlado pelo diafragma de uma objetiva:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'zoom.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'foco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'densidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'contraste.', 0);

    -- Módulo 4 (Diafragma), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q13', N'Segundo Langford, a abertura é usada para ditar a quantidade de luz que deverá atingir o filme e, assim, controlar o brilho da imagem. Para suavizar detalhes de fundo que chamam a atenção, ou para captar um único rosto em uma multidão, deve-se usar:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'um número f elevado;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'um ajuste de abertura adequado à profundidade de campo;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'uma lente grande-angular;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'um sistema de focalização adequado à profundidade de campo;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'um ajuste de abertura amplo.', 1);

    -- Módulo 4 (Diafragma), questão original Q14
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q14', N'Supondo que um fotógrafo necessite obter maior quantidade de luz, a abertura do diafragma da objetiva por ele utilizada deve ser', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f: 1.4.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f: 16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f: 2.8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f: 22.', 0);

    -- Módulo 4 (Diafragma), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q15', N'Com o uso de câmeras fotográficas profissionais, é possível destacar um elemento na imagem, focando-se o assunto e desfocando-se o fundo, por exemplo. Qual das seguintes aberturas do diafragma determina menor profundidade de campo?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f 2.8', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f 5.6', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f 11', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f 22', 0);

    -- Módulo 4 (Diafragma), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q16', N'As aberturas de diafragma são expressas em números f. Assinale qual dos números f abaixo permite maior passagem de luz pela objetiva.', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f: 5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f: 4.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f:16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f:8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f:22.', 0);

    -- Módulo 4 (Diafragma), questão original Q17
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q17', N'A abertura relativa de uma objetiva é:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o resultado da soma da distância focal com o diâmetro efetivo da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o resultado da divisão do diâmetro efetivo pela distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o resultado da subtração da distância focal do diâmetro efetivo da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o resultado da divisão da distância focal pelo diâmetro efetivo da objetiva.', 1);

    -- Módulo 4 (Diafragma), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q18', N'Um dos principais ajustes para tomada de uma fotografia que pode ser selecionado pela câmera de forma automática ou ajustada intencionalmente pelo fotógrafo é o “número f”. Ao ajustá-lo, o fotógrafo obtém um efeito na fotografia denominado profundidade de campo (DOF - Depth Of Field). A expressão “número-f” refere-se:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao ajuste dos pontos de foco', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao controle da velocidade do obturador', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à regulagem de abertura do diafragma', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'à distância focal da objetiva', 0);

    -- Módulo 4 (Diafragma), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q19', N'Além de controlar a luminosidade que chega até o filme ou o sensor digital, o diafragma é responsável', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pela profundidade de campo de uma fotografia.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'pela filtragem de cores em uma fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'pela aberração cromática da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'pela sensibilidade do filme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'pelo ISO do sensor digital.', 0);

    -- Módulo 4 (Diafragma), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q20', N'A profundidade de campo em uma imagem depende da relação dos seguintes elementos: I. Diafragma utilizado. II. Distância fotógrafo-objeto. III. Distância focal utilizada. Quais estão corretas?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apenas I.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas I e II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I, II e III.', 1);

    -- Módulo 4 (Diafragma), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q21', N'Analise as afirmações abaixo e assinale a alternativa INCORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A profundidade de campo também é controlada pelo diafragma', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Quanto maior for a abertura do diafragma, menor será o número de F (“fstop”)', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O diafragma fica na frente da objetiva e controla a entrada de luz', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Um conjunto de lâminas finas e justapostas compõe a estrutura do diafragma', 0);

    -- Módulo 4 (Diafragma), questão original Q22
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q22', N'O uso do diafragma afeta diretamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a granulosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a sensibilidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a impressão de movimento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o tempo de revelação.', 0);

    -- Módulo 4 (Diafragma), questão original Q23
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q23', N'Assinale a alternativa CORRETA. A nitidez e a profundidade de campo da imagem fotográfica são obtidas em função da:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'abertura do diafragma', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'iluminação do ambiente', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'distância do assunto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'tamanho da objetiva', 0);

    -- Módulo 4 (Diafragma), questão original Q24
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q24', N'A profundidade de campo é definida por uma área de focagem compreendida entre duas referências, que pode ser maior ou menor, dependendo de três fatores conjugados: distância focal da objetiva, diafragma e distância da câmera em relação ao tema fotografado. Sobre profundidade de campo, identifique as afirmativas a seguir como verdadeiras (V) ou falsas (F): ( ) Em igualdade de condições, uma objetiva de 35 mm tem profundidade de campo menor que uma teleobjetiva de 105 mm. ( ) Quanto mais aberto está o diafragma, maior será a profundidade de campo disponível para a tomada. ( ) Quanto mais próxima estiver a câmera do tema fotografado, maior será a profundidade de campo. ( ) A profundidade de campo é maior em fotografias paisagens do que nas macrofotografias. Nestas, a profundidade não ultrapassa alguns poucos milímetros. Assinale a alternativa que apresenta a sequência correta, de cima para baixo.', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'V – V – F – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'V – F – V – F.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'F – F – F – V.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'F – V – F – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'V – V – V – F.', 0);

    -- Módulo 4 (Diafragma), questão original Q25
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q25', N'Profundidade de campo é a zona de foco aceitável para frente e para trás do objeto focalizado. Para fazer um retrato com o fundo totalmente desfocado, o fotógrafo deve regular primeiramente o', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diafragma com a menor abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'obturador com a menor velocidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'obturador com a maior velocidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diafragma com a maior abertura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'obturador com a maior abertura', 0);

    -- Módulo 4 (Diafragma), questão original Q26
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q26', N'Profundidade de campo pode ser definida como: I. Zona de nitidez variável da imagem, antes e depois do objeto focado. II. Zona de foco de uma imagem. III. Zona de profundidade de uma imagem para objetos enquadrados em plongé. Quais estão corretas?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apenas I.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas I e II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I, II e III.', 0);

    -- Módulo 4 (Diafragma), questão original Q27
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q27', N'A profundidade de campo está relacionada com os intervalos visuais mais próximos e os mais afastados do motivo fotografado, os quais podem ficar nítidos em determinados planos ou em toda a trajetória do campo visual. O resultado da profundidade de campo depende de duas variáveis:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'plano focal e sensibilidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'distância focal e abertura do diafragma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'plano focal e distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sensibilidade e abertura do diafragma.', 0);

    -- Módulo 4 (Diafragma), questão original Q28
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q28', N'Qual a função do Diafragma na ação de captar uma imagem?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'controlar a quantidade de descarga elétrica produzida pelos fotossensores no CCD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'controlar a quantidade de luz e a profundidade de campo da fotografia.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar a quantidade de raios luminosos que chegam ao CMOS.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'controlar a sensibilidade da luz antes de atingir o plano focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'controlar o registro de ruídos que chegam na imagem.', 0);

    -- Módulo 4 (Diafragma), questão original Q29
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q29', N'Quanto às técnicas de produção fotográfica, a chamada distância focal de uma máquina fotográfica é', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a distância entre a lente e o plano onde se forma uma imagem nítida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a distância entre o objeto e a lente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a distância ente o objeto e o plano infinito', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a distância do objeto ao segundo plano.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a distância entre a lente e o ajuste do foco.', 0);

    -- Módulo 4 (Diafragma), questão original Q30
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q30', N'Sobre profundidade de campo, vamos considerar que o fotográfo tem um objeto a 8 metros de distância e que está com o diafragma da objetiva na posição f4. Que objetiva vai dar como resultado uma fotografia com a menor profundidade de campo?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'28mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'35mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'50mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'70mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'400mm.', 1);

    -- Módulo 4 (Diafragma), questão original Q31
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q31', N'Além dos elementos óticos, outro componente muito importante das objetivas é o diafragma. A respeito do diafragma, assinale a afirmativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'É o responsável pelo enquadramento da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Define com que intensidade a luz vai atingir o filme ou sensor da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Sua abertura não influencia diretamente na área nítida da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Cada abertura de diafragma deixa entrar exatamente o triplo de luz da abertura anterior.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'E) Quanto maior o número – f, maior é a abertura correspondente.', 0);

    -- Módulo 4 (Diafragma), questão original Q32
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q32', N'São os três fatores dos quais depende a nitidez da fotografia, exceto:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Tipo de objeto a ser fotografado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Focalização.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Qualidade de objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Granulação da emulsão.', 0);

    -- Módulo 4 (Diafragma), questão original Q33
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q33', N'Sobre a profundidade de campo, podemos dizer que', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'é o ponto de foco, único local onde há 100% de nitidez na imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'é quando o desfoque da imagem toma conta de toda a cena fotografada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'é a área de nitidez à frente e atrás do ponto de foco que pode ser controlada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'quantidade de nitidez ou desfoque apenas à frente do ponto de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'quantidade de nitidez ou desfoque apenas atrás do ponto de foco.', 0);

    -- Módulo 4 (Diafragma), questão original Q34
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q34', N'Assinale a alternativa que corresponde ao cálculo da abertura do diafragma (nº f).', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A multiplicação do plano focal pela curvatura do pincel cilíndrico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A somatória da distância focal com o comprimento do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A subtração do diâmetro do círculo de confusão pela foco no infinito ótico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Uma função logarítmica da curvatura do elemento principal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A divisão da distância focal pelo diâmetro da abertura do diafragma.', 1);

    -- Módulo 4 (Diafragma), questão original Q35
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q35', N'O diafragma é composto por uma série de lâminas de metal que controlam, além da quantidade de luz que chega ao plano focal, a variação da “profundidade de campo”. Sobre o tema, considere as seguintes afirmativas: 1. Com o f2.0 temos uma profundidade de campo maior que com f22. 2. Com o f2.0 temos uma profundidade de campo menor que com f22. 3. O f2.0 deixa entrar duas vezes menos luz ao plano focal que o f2.8. 4. O f2.0 deixa entrar duas vezes mais luz ao plano focal que o f2.8. Assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Somente a afirmativa 3 é verdadeira.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Somente as afirmativas 1 e 3 são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Somente as afirmativas 2 e 3 são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Somente as afirmativas 2 e 4 são verdadeiras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Somente as afirmativas 1 e 4 são verdadeiras.', 0);

    -- Módulo 4 (Diafragma), questão original Q36
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q36', N'Em fotografia, define-se “diafragma" como a área', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'da abertura pela qual a luz atravessa a objetiva e expõe o sensor nas câmeras digitais, ou o fotograma nas câmeras fotoquímicas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'do sensor (nas câmeras digitais), ou do fotograma (nas câmeras fotoquímicas), que recebe a luz que atravessa a objetiva para formar a imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'do sensor (ou do fotograma) que recebe a informação luminosa, independentemente da distância focal da objetiva. Quanto maior o valor numérico do diafragma, menor a área do sensor (ou do fotograma) e vice-versa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do primeiro elemento óptico de uma objetiva, independentemente da sua distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'da abertura pela qual a luz é desviada para a formação da imagem no visor (viewfinder), ou no LCD (liquid crystal display), que se obstrui no momento do registro da imagem no sensor.', 0);

    -- Módulo 4 (Diafragma), questão original Q37
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q37', N'São fatores determinantes da profundidade de campo focal:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a regulagem do diafragma, a distância que o fotógrafo se encontra do objeto fotografado e o tipo de lente', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a regulagem do obturador, do diafragma e do ISO', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a regulagem do foco, do ISO e do obturador', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a distância que o fotógrafo se encontra do objeto fotografado, a regulagem do obturador e a regulagem do foco', 0);

    -- Módulo 4 (Diafragma), questão original Q38
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q38', N'Profundidade de campo poder ser definida como o intervalo de distâncias', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'à frente e atrás da distância focalizada, dentro do qual (intervalo) o foco se considera aceitável.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'entre o que está enquadrado no infinito e objetos em primeiro plano.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'entre o que está enquadrado no infinito e o plano focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'entre o ponto nodal posterior da objetiva e o objeto em foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'mínima e máxima entre o objeto em foco e o plano focal para que o infinito mantenha nitidez aceitável.', 0);

    -- Módulo 4 (Diafragma), questão original Q39
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q39', N'Pode-se afirmar que a função do diafragma no registro fotográfico é determinar', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o tamanho da abertura necessária à superexposição da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a menor abertura que define o registro da imagem por meio da intensidade luminosa que atinge o filme ou o sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o tamanho da abertura que define o registro da imagem por meio da intensidade luminosa que atinge o filme ou o sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a maior abertura que define o registro da imagem por meio da intensidade luminosa que atinge o filme ou o sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o tamanho da abertura necessária à subexposição da imagem.', 0);

    -- Módulo 4 (Diafragma), questão original Q40
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q40', N'Em fotografia, a sequência 1.8 - 2 - 2.8 4 - 5.6 - 8 - 11 - 16 - 22 caracteriza', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'velocidade do obturador da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sensibilidade fotográfica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'metragem focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'abertura de diafragma da lente.', 1);

    -- Módulo 4 (Diafragma), questão original Q41
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q41', N'O aumento da profundidade de campo NÃO resulta em', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior nitidez em todos os planos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fechamento do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'menor perspectiva da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diminuição da luminosidade da objetiva.', 0);

    -- Módulo 4 (Diafragma), questão original Q42
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q42', N'A abertura do diafragma tem duas funções muito importantes: ela permite a entrada de luz na câmera fotográfica e controla a profundidade de campo na imagem. A relação entre estas funções e o número do diafragma é a seguinte:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'quanto menor o número do diafragma menor será a entrada de luz e menor, a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'quanto menor o número do diafragma maior será a entrada de luz e menor, a profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'quanto menor o número do diafragma maior será a entrada de luz e maior, a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'quanto menor o número do diafragma menor será a entrada de luz e maior, a profundidade de campo.', 0);

    -- Módulo 4 (Diafragma), questão original Q43
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q43', N'A profundidade de campo está diretamente ligada à profundidade de foco de uma imagem. É comum se encontrar o termo fotografia com profundidade de campo. Essa profundidade de campo está diretamente ligada ao diafragma e à objetiva, mas principalmente ao diafragma. Sendo assim, a combinação, dentre as opções a seguir, que representa uma melhor qualidade para uma fotografia sem profundidade de campo é:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'grande angula mais f2.8', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'teleobjetiva mais f1.8', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'teleobjetiva mais f8', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'grande angular mais f11', 0);

    -- Módulo 4 (Diafragma), questão original Q44
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q44', N'A relação entre o máximo diâmetro de passagem de luz por uma objetiva e a distância de seu centro óptico ao plano de foco denomina-se abertura', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Máxima positiva', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Máxima relativa', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Mínima de ação', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Hiperfocal', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Mínima relativa', 0);

    -- Módulo 4 (Diafragma), questão original Q45
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q45', N'A profundidade de campo é determinada pelos seguintes fatores:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'tipo da objetiva (distância focal), tamanho da abertura (diafragma) e tempo de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'tamanho da abertura (diafragma), distância do objeto a ser fotografado (distância de focalização) e sensibilidade do filme (ou sensor).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'tempo de exposição, tamanho da abertura (diafragma) e sensibilidade do filme (ou sensor).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'tipo da objetiva (distância focal), tamanho da abertura (diafragma) e distância do objeto a ser fotografado (distância de focalização).', 1);

    -- Módulo 4 (Diafragma), questão original Q46
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q46', N'Desejando o efeito de fundo desfocado, é necessário', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a iluminação no segundo plano.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a abertura do diafragma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar o tempo de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a velocidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar o foco da imagem.', 0);

    -- Módulo 4 (Diafragma), questão original Q47
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q47', N'PADRÃO VUNESP Observe as imagens a seguir. Em fotografia, as condições de foco e desfoco entre os assuntos dispostos no enquadramento caracterizam diferentes resultados estéticos. X Y No que diz respeito à “profundidade de campo”, a alteração de quais recursos determinam diferentes resultados?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A distância focal da objetiva, a temperatura de cor e a sensibilidade do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O tempo de exposição, a abertura do diafragma e a sensibilidade do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A distância focal da objetiva, a abertura do diafragma e a área do sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O tempo de exposição, o formato widescreen e a abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A velocidade do obturador, a sensibilidade do sensor e a distância focal da objetiva.', 0);

    -- Módulo 4 (Diafragma), questão original Q48
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q48', N'A profundidade de campo em uma imagem depende da relação dos seguintes elementos: I. Diafragma utilizado. II. Distância fotógrafo-objeto. III. Distância focal utilizada. Quais estão corretas?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apenas I.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas I e II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I, II e III.', 1);

    -- Módulo 4 (Diafragma), questão original Q49
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q49', N'O ajuste do diafragma é medido em pontos f. Em relação ao ajuste do diafragma, é CORRETO afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'uma abertura f/2 em uma lente teleobjetiva admite a mesma quantidade de luz que um f/2 em uma lente grandeangular.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'quanto maior a numeração (f), maior a quantidade de luz que passa pela lente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'uma abertura em f/22 permite passar mais luz pela lente do que uma abertura em f/2.8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a abertura do diafragma não interfere na profundidade de campo nem no ajuste de foco.', 0);

    -- Módulo 4 (Diafragma), questão original Q50
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Diafragma - Q50', N'Quanto mais se aproxima do objeto, mais rapidamente a profundidade de campo diminui, com qualquer abertura de lente. É CORRETO afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a profundidade de campo aumenta rapidamente à medida que diminui a distância focal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a profundidade de campo exerce um papel importante na composição fotográfica, a medida em que é mais adequada para medir a fotometria da foto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a profundidade depende exclusivamente do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao diminuir a abertura da lente, consequentemente, diminui-se a profundidade de campo.', 0);

    -- Módulo 5 (Obturador), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q01', N'O ajuste de velocidade do obturador da câmera:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'tem uma escala geral de 1.4; 2; 2.8; 4; 5.6; 8; 11; 16; 22.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'regula o tempo, em segundos ou frações de segundo, em que a película ou sensor será exposto à luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'regula a entrada da luz pela objetiva nas câmeras de pequeno formato e é denominado de número “f”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'regula a profundidade de campo. Quanto maior a velocidade do obturador, menor a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'é responsável por permitir a visualização através da objetiva quando a câmera não estiver no modo de registro de imagem.', 0);

    -- Módulo 5 (Obturador), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q02', N'Quando se fotografa um assunto em movimento, a imagem resultante pode demonstrar o congelamento ou borramento, em função do ajuste de um dos componentes da câmera. Assinale a alternativa que indica CORRETAMENTE este componente:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Diafragma', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Sensibilidade', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Iluminação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Obturador.', 1);

    -- Módulo 5 (Obturador), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q03', N'A função principal do obturador é:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Permitir a exposição do filme do sensor à luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Permitir que a luz não desfoque o filme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Permitir que a luz mantenha sempre a mesma temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Permitir que o filme corra na mesma velocidade que a luz.', 0);

    -- Módulo 5 (Obturador), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q04', N'O recurso que o fotógrafo deve utilizar como definidor das configurações para uma determinada imagem que pretende executar com movimento aparentemente borrado é', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Anel de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Anel de zoom.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Anel de diafragmas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Escala de velocidades.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Escala de sensibilidade.', 0);

    -- Módulo 5 (Obturador), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q05', N'A medida da escala de velocidades em uma câmera fotográfica se refere aos seguintes itens: I. Tempo. II. Partes da diagonal do sensor/fotograma. III. Uma razão entre a diagonal do sensor/fotograma e a abertura da lente. IV. Quantidade de megapixels do sensor. Quais estão corretas?', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apenas I.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas II e III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas I, II e III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas II, III e IV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I, II, III e IV.', 0);

    -- Módulo 5 (Obturador), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q06', N'Para velocidades muito baixas, que aparelho é imprescindível no processo de captação da imagem fotográfica:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Filtro de gelatina.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Paralaxe de pé duplo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Disparador de cabo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Tripé.', 1);

    -- Módulo 5 (Obturador), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q07', N'O dispositivo responsável pelo tempo de entrada de luz na câmera e pelos efeitos do movimento a partir de velocidades diversas é:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a sensibilidade do filme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o obturador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o fotômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a objetiva.', 0);

    -- Módulo 5 (Obturador), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q08', N'Nas câmeras modernas de 35 mm é comum a seqüência: B – T – 8s – 4s – 2 s – 1s – 1/2s - 1/4 s - 1/8s - 1/15s - 1/30s 1/60s - 1/125s - 1/250s - 1/500s - 1/1000s 1/2000s - 1/4000s - 1/8000s. Qual o significado da expressão B, referida na seqüência:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Tempo da exposição em segundos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Exposição continua enquanto uma nova velocidade não é selecionado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A exposição vai ocorrer enquanto o fotógrafo estiver com o disparador pressionado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Nenhuma das alternativas está correta.', 0);

    -- Módulo 5 (Obturador), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q09', N'Qual a função do obturador em uma câmera fotográfica?', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Controlar o tempo de exposição à luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Controlar a quantidade de luz que passa pela objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Fazer a medição de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Selecionar a sensibilidade do filme utilizado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Configurar o angulo de cobertura da lente.', 0);

    -- Módulo 5 (Obturador), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q10', N'Como é possível congelar o movimento da água corrente em uma fotografia?', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Usando uma câmera digital profissional.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Trabalhando em modo automático na câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Trabalhando com velocidades de obturação alta.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Abaixando a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Fotografando com uma objetiva grande angular.', 0);

    -- Módulo 5 (Obturador), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q11', N'Analise as afirmações abaixo sobre características da imagem fotográfica. I – A quantidade de megapixels está diretamente ligada à qualidade da imagem fotográfica. II – As objetivas mais luminosas são aquelas que possuem o número f igual ou menor do que 2.8. III – As velocidades do obturador controlam a quantidade de luz que atinge o filme ou o sensor digital. Quais estão corretas?', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apenas a I.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas a II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas a III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas a II e a III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Todas estão corretas.', 1);

    -- Módulo 5 (Obturador), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q12', N'É correto afirmar que o obturador', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'é muito utilizado para tirar fotos de paisagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permite que o fotógrafo escolha a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fica na lente e funciona como a pupila do olho, controlando a entrada da luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'tem a preferência dos repórteres fotográficos para melhorar os trabalhos com câmaras de formato 35 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'é um dispositivo do equipamento que permite que a luz entre na câmara para gravar a imagem. Ele regula o tempo que o sensor, na câmara digital, fica exposto à luz para a formação das imagens.', 1);

    -- Módulo 5 (Obturador), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q13', N'A utilização do obturador afeta diretamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a impressão de movimento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a granulosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a sensibilidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o tempo de revelação.', 0);

    -- Módulo 5 (Obturador), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q16', N'Embora a tradição aconselhe manter a câmera perfeitamente estável ao se tirar uma foto para que nenhum tremor indesejável estrague a imagem, há ocasiões que atestam o uso criterioso ou criativo de um objeto borrado. Assinale a alternativa CORRETA que apresenta adequadamente os aspectos da técnica da fotografia em movimento para obtenção de um objeto borrado.', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O fotógrafo precisa de um tripé para posicionar a câmera, configurada em alta velocidade para que as imagens fiquem borradas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Pode-se obter uma imagem borrada em praticamente qualquer circunstância apenas usando um tempo longo no obturador enquanto movimenta a câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Adotar um tempo curto no obturador e não utilizar zoom durante a exposição, o resultado será uma imagem com aparência explosiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Se o fotógrafo acompanha em velocidade compatível um objeto em movimento durante a exposição e com obturador em velocidade alta, com foco no primeiro plano, o resultado será toda a imagem borrada.', 0);

    -- Módulo 5 (Obturador), questão original Q17
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q17', N'Leia a seguir as afirmações referentes ao obturador. I A função do obturador é regular o tempo de exposição do suporte sensível à luz. II O seu uso deve estar conjugado com a regulagem da abertura do diafragma. III O obturador pode ajudar a congelar ou borrar a imagem, dependendo da sua regulagem. IV O obturador tem sua função completamente desativada quando o flash é acionado. Das afirmações, estão corretas', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I, III e IV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas II e III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'I, II e III.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas I e IV.', 0);

    -- Módulo 5 (Obturador), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q18', N'O dispositivo responsável pelo tempo de entrada de luz na câmera e pelos efeitos do movimento a partir de velocidades diversas é', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Sensibilidade do filme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Obturador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Fotômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Objetiva.', 0);

    -- Módulo 5 (Obturador), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q19', N'PADRÃO VUNESP Observando-se a figura 3, vemos um efeito de distorção possibilitado pelo ajuste de', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sensibilidade ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'velocidade de obturação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'white balance.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'distância focal.', 0);

    -- Módulo 5 (Obturador), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q20', N'A escala 1/1 1/2 1/4 1/8 1/15 1/30 1/60 1/125 1/250 1/500 1/1000 refere-se na fotografia a:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'À velocidade de obturação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'À abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'À sensibilidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'À distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Ao formato de ampliação.', 0);

    -- Módulo 5 (Obturador), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q21', N'Sobre o uso do tripé para produzir fotografias, assinale com V as afirmativas verdadeiras e com F as falsas. ( ) Deve-se utilizar um tripé em situações de baixa luz em longas exposições. ( ) O tripé pode ser utilizado em condições boas de iluminação para auxiliar a composição. ( ) Para manter uma mesma composição em fotografias para catálogos, não é recomendado o uso do tripé. ( ) Em área externa, é importante utilizar um tripé mais reforçado para que a imagem não saia tremida. Assinale a sequência correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'V F V F', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'F F F V', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'F V V F', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'V V F V', 1);

    -- Módulo 5 (Obturador), questão original Q23
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q23', N'O tempo de exposição mínimo com que se pode fotografar na mão, sem auxílio de tripé é aquela igual a distância focal da objetiva utilizada. Sendo assim, se o fotógrafo estiver utilizando uma objetiva 50mm, o tempo de exposição mínimo será 1/60. Se a objetiva for 200mm, o tempo mínimo será:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/30', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/125', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/160', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/250', 1);

    -- Módulo 5 (Obturador), questão original Q24
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q24', N'O tempo de exposição mínimo com que se pode fotografar na mão, sem auxílio de tripé é aquela igual a distância focal da objetiva utilizada. Sendo assim, se o fotógrafo estiver utilizando uma objetiva 50mm, o tempo de exposição mínimo será 1/60. Se a objetiva for 200mm, o tempo mínimo será:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/30', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/125', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/160', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/250', 1);

    -- Módulo 5 (Obturador), questão original Q25
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q25', N'Sobre as câmeras DSLR, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'possuem um obturador de plano focal, situado atrás do espelho, o que protege o filme (ou sensor) durante o processo de focalização e de troca de objetivas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a distância entre a objetiva e o visor pode, às vezes, ocasionar o erro de paralaxe, fazendo com que a imagem vista no visor não coincida com a registrada pela objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'nelas, a imagem vista na tela de vidro despolido fica invertida, em sentido lateral.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o mecanismo reflex compõe-se de um espelho, colocado a um ângulo de 60 graus, exatamente atrás da objetiva.', 0);

    -- Módulo 5 (Obturador), questão original Q26
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q26', N'É o elemento mecânico que controla a entrada de luz, em espaço de tempo. Suas velocidades são controladas em frações de segundo e em alguns casos podem ultrapassar 1/1000. Trata-se de:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Sal de prata.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Obturador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Batedouro.', 0);

    -- Módulo 5 (Obturador), questão original Q28
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q28', N'O uso do obturador para o controle do tempo de exposição e da abertura do diafragma para o controle da profundidade de campo estão relacionados entre si, porém o ajuste de cada um deles irá provocar um resultado visual diferente na fotografia. Em uma situação hipotética, um fotógrafo registrou um veículo oficial se deslocando a 40km/h utilizando o obturador no tempo 1/30 e a abertura do diafragma em 11.0. Para um segundo registro, ajustou o obturador para o tempo de 1/250 e o diafragma para 4.0. As diferenças visíveis na segunda fotografia são: veículo', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'nítido e público em desfoque.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'em desfoque e público em desfoque.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'nítido e público nítido.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'em desfoque e público nítido.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'com algum desfoque e público pouco nítido.', 0);

    -- Módulo 5 (Obturador), questão original Q29
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q29', N'Com relação à velocidade do obturador, é correto afirmar que o obturador controla o tempo de exposição e:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o ruído da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o brilho da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o movimento da fotografia.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a distância focal da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a profundidade de campo da fotografia.', 0);

    -- Módulo 5 (Obturador), questão original Q30
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q30', N'Para fotografar um carro de Fórmula 1 correndo numa velocidade de 250 Km/h de maneira que ele apareça nítido e com movimento congelado, a velocidade do obturador mais indicada é', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/60 segundo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/90 segundo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/250 segundo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/1000 segundo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1 segundo.', 0);

    -- Módulo 5 (Obturador), questão original Q31
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q31', N'Para se fotografa sem temor de transmitir vibrações à câmera, portanto sem tocar nesta, usa-se o A)disparador automático', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'propugnador', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'incinerador', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'preceptor', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'propulsor', 1);

    -- Módulo 5 (Obturador), questão original Q32
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q32', N'Qual o nome da técnica utilizada para fotografar objeto em movimento de forma que ele fique nítido e os demais elementos do cenário se apresentem borrados? É comum se utilizar essa técnica para fotografar por exemplo um carro em velocidade numa estrada com uma paisagem ao fundo.', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Panning.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Obturador dinâmico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Congelamento da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Velocidade de obturador alta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Movimento da direção da imagem.', 0);

    -- Módulo 5 (Obturador), questão original Q33
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q33', N'Assinale a alternativa que corresponde aos dois principais tipos de obturador presentes nas câmeras fotográficas de uso profissional.', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Obturador traseiro e obturador de persiana.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Obturador central e obturador de cortina.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Obturador lateral e obturador cibernético.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Obturador telemétrico e obturador simples.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Obturador diametral e obturador de chicote.', 0);

    -- Módulo 5 (Obturador), questão original Q34
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q34', N'Uma fotografia registra um momento e o “congela” no tempo e espaço. Para conseguir passar a sensação de movimento de um carro que trafega numa rua, deixando o carro nítido e o fundo borrado, o fotógrafo deve:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Acompanhar o movimento do carro usando o diafragma na maior abertura possível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Acompanhar o movimento do carro usando o diafragma na menor abertura possível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Acompanhar o movimento do carro usando o obturador na menor velocidade possível.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Acompanhar o movimento do carro usando o obturador na maior velocidade possível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Acompanhar o movimento do carro usando o foco manual.', 0);

    -- Módulo 5 (Obturador), questão original Q35
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q35', N'A função do obturador numa câmera fotográfica é controlar:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o tempo de entrada de luz até o filme ou sensor digital.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o espaço de entrada de luz na câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a sensibilidade do sensor à luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a carga de eletricidade necessária ao funcionamento da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o balanço de branco da câmera.', 0);

    -- Módulo 5 (Obturador), questão original Q36
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q36', N'O que se entende por “tempo de exposição”, no registro fotográfico, é o tempo no qual o obturador permanece', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fechado, enquanto o fotógrafo avalia a intensidade lumi nosa disponível na cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fechado, logo após a formação da imagem no sensor, para o registro da imagem no processo digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fechado, enquanto o fotógrafo determina o diafragma necessário àquela exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aberto, mas o fotógrafo ainda não determinou o diafragma pretendido para aquela exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aberto, e os raios luminosos, passando através da objetiva, atingem a superfície sensível e registram a imagem.', 1);

    -- Módulo 5 (Obturador), questão original Q37
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q37', N'Para realizar uma fotografia noturna, tendo um tripé como apoio, a velocidade a ser utilizada é de', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/200s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/500s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/15s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/60s.', 0);

    -- Módulo 5 (Obturador), questão original Q38
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q38', N'Existem três opções para se fazer fotografia de um objeto ou de uma pessoa em movimento. São elas: fotografia congelada; fotografia em panning 1 ou fotografia em panning 2. Para fazer o panning 2, deve-se colocar o obturador com velocidade', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'alta e deixar a câmera fixa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'baixa e deixar a câmera fixa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'baixa e movimentar a câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alta e movimentar a câmera.', 0);

    -- Módulo 5 (Obturador), questão original Q39
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q39', N'Obturador é o dispositivo que regula quanto tempo o filme ou sensor deve ficar exposto à luz. Das opções abaixo, representam-se os tipos de obturadores de velocidade em:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'obturador de entrada e principal', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'obturador central e de entrada', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'obturador central e plano focal', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'obturador de plano focal e principal', 0);

    -- Módulo 5 (Obturador), questão original Q40
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Obturador - Q40', N'Em que situação no interior da câmera fotográfica acontecerá o sincronismo perfeito de um obturador de cortina com o disparo de um flash eletrônico?', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Com a 1ª cortina ainda em curso e a 2ª também', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Com a 1ª cortina no início do curso e a 2ª por iniciar', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Com a 1ª cortina ao final do curso e a 2ª para iniciar', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Com nenhuma cortina iniciando qualquer movimento', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Com a cortina parada', 0);

    -- Módulo 6 (ISO), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q01', N'“Da mesma forma que para um filme ou qualquer emulsão fotográfica se associa uma sensibilidade ISO, o mesmo acontece com um CCD”. (Trigo, 2010) Sobre o tema, considere asseguintes afirmativas:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Com o ISO 100, temos a metade da sensibilidade à luz do ISO 400.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Com o ISO 800, temos a metade da sensibilidade à luz do ISO 1250.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Com o ISO 100, temos a metade da sensibilidade à luz do ISO 200.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Com o ISO 3200, temos o dobro da sensibilidade à luz do ISO 1000.', 0);

    -- Módulo 6 (ISO), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q02', N'Além da sensibilidade dos filmes a escala ISO determina a definição ou nitidez que uma imagem terá na impressão. Qual das sensibilidades abaixo seria a mais adequada para fotografias onde existe grande exigência quanto a qualidade de impressão.', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 6400.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 400.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 3200.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 50.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 200.', 0);

    -- Módulo 6 (ISO), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q03', N'Imagine que você está em uma praia, repleta de crianças, faz muito calor e o dia está muito claro. O tipo de ISO recomendável para fotografar as crianças brincando na areia é:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 100.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 800.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 1600.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 6400.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 400.', 0);

    -- Módulo 6 (ISO), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q04', N'Assinale a alternativa CORRETA. Maior sensibilidade exige menos luz para produzir uma foto. A sensibilidade da imagem na câmera digital à luz é indicada pelo:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pixel', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'diafragma', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'obturador', 0);

    -- Módulo 6 (ISO), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q06', N'Para fotografar um evento em ambiente interno e com pouca luz, foi usado ISO de 3200 e ajustes da velocidade e abertura de acordo com a marcação do fotômetro. Isso pode causar:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Ruído na imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Imagem fora de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Imagem esbranquiçada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Superexposição da foto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Subexposição da foto.', 0);

    -- Módulo 6 (ISO), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q07', N'Na exposição fotográfica, os valores expressos pela escala ISO (International Standards Organization), em fotografia, determinam', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior sensibilidade à luz, com decréscimo de ruído, maior seja o valor do número ISO selecionado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'maior tempo de exposição à luz, com acréscimo de ruído, maior seja o valor do número ISO selecionado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'maior sensibilidade à luz, com acréscimo de ruído, maior seja o valor do número ISO selecionado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'menor tempo de exposição à luz, com decréscimo de ruído, maior seja o valor do número ISO selecionado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'menor sensibilidade à luz, com acréscimo de ruído, menor seja o valor do número ISO selecionado.', 0);

    -- Módulo 6 (ISO), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q08', N'Que sistema é mundialmente usado, na atualidade, para a marcação de rapidez dos filmes fotográficos?', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'KODAK', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'DIN', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'SPEED', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'FUJI', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO', 1);

    -- Módulo 6 (ISO), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q09', N'A escala ISO classifica o nível de sensibilidade dos filmes à luz. A partir desta escala temos filmes muito sensíveis e filmes pouco sensíveis à luz. Qual das situações fotográficas seria a mais adequada para a utilização de um filme de 3200 ISO.', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Fotografia de jóias em um estúdio.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Um piquenique em parque a céu aberto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Editorial de moda ao ar livre.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Fotografia de produto com exigência de detalhes e nitidez na impressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Peça de teatro com iluminação de palco.', 1);

    -- Módulo 6 (ISO), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q10', N'Você foi contratado para fotografar um show de uma dupla sertaneja goiana. Entre os seguintes ISOs (International Standard Organization), qual lhe proporcionará melhor sensibilidade, permitindo que você faça imagens focadas sem auxílio do tripé e do flash?', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 50', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 100', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 400', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 1600', 1);

    -- Módulo 6 (ISO), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q11', N'Assinale a alternativa que completa CORRETAMENTE a seguinte afirmativa: As fotografias, analógicas ou digitais, apresentam ‘granulação’ acentuada nos registros quando...', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a iluminação para a tomada da imagem é muito alta)', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a abertura do diafragma é muito pequena para a tomada da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a velocidade do obturador é muito baixa para a tomada da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a sensibilidade ISO é muito alta para tomada da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a sensibilidade ISO é muito baixa para a tomada da imagem.', 0);

    -- Módulo 6 (ISO), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q12', N'A regulagem do ISO interfere na qualidade gráfica da imagem fotográfica. Assim, é correto afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o ISO é subordinado ao diafragma e deverá considerar a luz mais fraca do ambiente para dar mais qualidade', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o ISO é regulado pelo obturador e deverá trabalhar subordinado ao rádio flash para dar mais qualidade', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'quanto menor o ISO, melhor será a ampliação e a qualidade gráfica de uma fotografia', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'deve-se regular o ISO para o mais alto possível para garantir a melhor ampliação e a qualidade gráfica', 0);

    -- Módulo 6 (ISO), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q13', N'Em uma fotografia noturna, num ambiente de pouca luz, em que não há a possibilidade de se utilizar qualquer iluminação adicional, uma das opções para uma exposição satisfatória é a de aumentar a sensibilidade do sensor. A elevação do número ISO a um nível considerado alto pode gerar o seguinte resultado na imagem:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ruído, principalmente nas áreas desfocadas da imagem situadas, posteriormente, à zona de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aberração cromática conhecida como “vinhetagem”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'perda significativa na profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aberração ótica conhecida como “distorção de barril”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ruído, principalmente nas áreas de baixa iluminação.', 1);

    -- Módulo 6 (ISO), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q15', N'O que determina a sensibilidade do sensor de uma câmera à luz é o ISO. Essa configuração, juntamente com diferentes combinações de diafragma e obturador podem resultar em imagens subexpostas, normais ou superexpostas. Levando em consideração somente à mudança de sensibilidade do sensor, o aumento do número do ISO resultará em:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diminuição da sensibilidade à luz e imagem desfocada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminuição da sensibilidade à luz e imagem subexposta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento da sensibilidade à luz e aumento do ruído na definição da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento da sensibilidade à luz e aumento da saturação da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da sensibilidade à luz e diminuição da saturação e ruído na imagem.', 0);

    -- Módulo 6 (ISO), questão original Q17
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q17', N'ISO é uma medida que indica a sensibilidade do sensor da câmera à luz. Também conhecida como velocidade ISO, essa medida é capaz de deixar a foto mais clara ou escura. Considerando esses fatores, marque a opção FALSA sobre o uso e comportamento do ISO.', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Nas câmeras analógicas, o ISO era chamado de ASA e só poderia ser alterado com a troca do rolo do filme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A cada stop do controle ISO, ou seja, cada vez que ele é aumentado, a sensibilidade do sensor à luz dobra, fazendo a seguinte escala: 100, 200, 400, 800, 1600, 3200 etc.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O aumento da sensibilidade ISO pode comprometer a qualidade da foto, causando o chamado “efeito granulado” ou "ruído". Por isso é indicado mantê-la baixa quando a fotografia for feita em um ambiente com boas condições de luz natural.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'É possível aumentar a sensibilidade à luz com o aumento do ISO sem acréscimo de ruído, desde que as pessoas fotografadas permaneçam paradas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 100 é considerado de baixa sensibilidade e necessita de grande quantidade de luz externa, sendo ela natural (sol) ou artificial (flash).', 0);

    -- Módulo 6 (ISO), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q18', N'A velocidade dos filmes ISO tem marcação em escala do sistema', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Hidrométrica', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Isométrico', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Logaritima', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Métrico', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Helicoidal', 0);

    -- Módulo 6 (ISO), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q19', N'No equipamento fotográfico digital, o ajuste manual da sensibilização do sensor, refere-se à (o)', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'CCD', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Telêmetro', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Fotômetro', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Distância focal', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO', 1);

    -- Módulo 6 (ISO), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q20', N'Os equipamentos digitais permitem modificar a sensibilidade para captação de cada foto. Essa é uma vantagem, em comparação à “puxada” dos processos tradicionais de filme. Por ser um procedimento eletrônico, ao efetuar essa alteração para altas sensibilidades em ambientes com pouca luz, tende-se a aumentar:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o nível de ruído eletrônico.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o nível de sharpening da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a fidelidade e vivacidade das cores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a distância focal da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o grau de percepção dos detalhes da cena.', 0);

    -- Módulo 6 (ISO), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q21', N'A exposição é o processo em que a luz que reflete de um assunto / objeto passa por uma abertura na lente da câmera em direção ao sensor, por um determinado período de tempo. O tamanho dessa abertura e o tempo pelo qual se permite que a luz passe por ela estão intrinsecamente relacionados ao ISO. Em relação ao ISO, analise as afirmativas abaixo. I. O ISO é o valor numérico que atribui o nível de sensibilidade do sensor da câmera. II. Quanto maior o valor numérico de ISO, menor será o nível de ruído eletrônico na imagem. III. Quanto menor o valor numérico de ISO, maior será a profundidade de campo. IV. O maior nível de qualidade das imagens virá do uso do menor ISO possível. Estão corretas as afirmativas:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I e III apenas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'II e III apenas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'I, II e III apenas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I e IV apenas', 1);

    -- Módulo 6 (ISO), questão original Q22
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - ISO - Q22', N'Assinale a alternativa CORRETA. Maior sensibilidade exige menos luz para produzir uma foto. A sensibilidade da imagem na câmera digital à luz é indicada pelo:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pixel', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'diafragma', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'obturador', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q01', N'São mecanismos da câmera fotográfica que têm por função o controle da luz:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Diafragma, obturador e cortina.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Diafragma, obturador e ISO.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Obturador, ISO e cortina.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Diafragma, obturador e objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Diafragma, ISO e cortina.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q02', N'Uma câmera fotográfica profissional, para adequar a luz ambiente ao registro de imagem, independentemente de ser do tipo analógica ou digital, deve possuir, no mínimo, três componentes ajustáveis. Assinale a alternativa que exibe CORRETAMENTE estes componentes.', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Diafragma, objetiva e profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Obturador, sensibilidade e distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Distância focal, profundidade de campo e obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Diafragma, obturador e sensibilidade', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Obturador, diafragma e distância focal.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q03', N'Sobre o funcionamento de uma câmera fotográfica, identifique as afirmativas a seguir como verdadeiras (V) ou falsas (F): ( ) A objetiva serve para ordenar a luz refletida pela cena a ser fotografada, de modo a compor uma imagem luminosa que vai incidir sobre o filme ou sensor. ( ) Na maior parte das câmeras, a objetiva é composta por uma série de lentes convexas (positivas) e côncavas (negativas). ( ) O diafragma é formado por uma série de lâminas que controlam o tempo de entrada de luz. ( ) O diafragma trabalha com escalas de abertura que podem variar em 1; 1,4; 2; 2,8; 4; 5,6; 8; 11; 16; 22. Assinale a alternativa que apresenta a sequência correta, de cima para baixo.', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'V – V – F – V.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'V – F – V – F.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'F – F – F – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'F – V – V – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'V – V – F – F.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q04', N'Numa situação de pouca luz, como, por exemplo, numa cerimônia dentro de um gabinete, de que opções o fotógrafo dispõe para aumentar a possibilidade de uma boa foto? 1. Usar um filme de sensibilidade baixa, como um filme 80 ISO. 2. Usar o diafragma na maior abertura possível. 3. Usar o obturador na menor velocidade possível. 4. Usar foco automático para melhorar a entrada de luz. Estão corretas as opções apresentadas nos itens:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1 e 4 apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'2, 3 e 4 apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1 e 3 apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'2 e 3 apenas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1, 2, 3 e 4.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q06', N'O processo que estabelece quanta luz é necessária para obter o resultado desejado em determinado filme ou sensor digital chama-se:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'controle de difração', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'controle de perspectiva', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controle de exposição', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'controle de luminância', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q07', N'ISO, obturador e diafragma controlam, respectivamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Fotossensibilidade, tempo de entrada de luz e quantidade de entrada de luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Quantidade de entrada de luz, tempo de entrada de luz e fotossensibilidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Tempo de entrada de luz, fotossensibilidade e quantidade de entrada de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Quantidade de entrada de luz, fotossensibilidade e tempo de entrada de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Tempo de entrada de luz, quantidade de entrada de luz e fotossensibilidade.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q08', N'Uma das mais importantes características de uma câmera fotográfica é o controle da quantidade de luz que atinge o sensor digital ou o filme. Três variáveis são consideradas principais no que se refere à exposição da superfície sensível à luz. São elas:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sensibilidade, obturador e diafragma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'plano focal, distância focal e diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'sensibilidade, distância focal e obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sensibilidade, plano focal e obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'distância focal, obturador e diafragma.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q10', N'Uma fotografia tirada em condições normais de iluminação ficou subexposta quando são regulados o diafragma e obturador da seguinte forma:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f: 4 e velocidade 1/60.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f: 5.6 e velocidade 1/125.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f: 11 e velocidade 1/30.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f: 16 e velocidade 1/250.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f:2 e velocidade 1/100.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q11', N'Quais são as unidades com as quais identificamos, respectivamente, a sensibilidade do filme, a abertura do diafragma e a velocidade do obturador?', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO, f, s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'DIN, cm, t.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'sensibilidade, profundidade, tempo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N's, velocidade, sensibilidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO, tempo, f.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q12', N'Considere as seguintes escalas: Abertura: 1.4 – 2 – 2.8 – 4 – 5.6 – 8 – 11 – 16 – 22 Velocidade: 1 – 1/2 – 1/4 – 1/8 – 1/15 – 1/30 – 1/60 – 1/125 – 1/250 – 1/500 – 1/1000 Uma foto com ISO 400 utilizou 1/500 e f:16. Para se fazer a mesma foto utilizandose filme ISO 100, com a mesma velocidade, deve-se:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'mudar a velocidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar abertura 4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar abertura 5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar abertura 8.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar um filme mais sensível ou um flash.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q13', N'Considere as seguintes escalas: Abertura: 1.4 – 2 – 2.8 – 4 – 5.6 – 8 – 11 – 16 – 22 Velocidade: 1 – 1/2 – 1/4 – 1/8 – 1/15 – 1/30 – 1/60 – 1/125 – 1/250 – 1/500 – 1/1000 Uma foto com ISO 100 utilizou 1/125. Para se fazer a mesma foto, utilizando-se ISO 400, deve-se:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'usar velocidade 1/500.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'usar velocidade 1/1000.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'usar velocidade 1/30.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'mudar a abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar um filme menos sensível ou um flash.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q14
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q14', N'Considere as seguintes escalas: Abertura: 1.4 – 2 – 2.8 – 4 – 5.6 – 8 – 11 – 16 – 22 Velocidade: 1 – 1/2 – 1/4 – 1/8 – 1/15 – 1/30 – 1/60 – 1/125 – 1/250 – 1/500 – 1/1000 Uma fotografia foi feita com f:8 e 1/60. Se a abertura for mantida, qual será o tempo dado para uma foto feita com quatro vezes mais luz ambiente?', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/30.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/60.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/250.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/500.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/1000.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q15', N'Considere as seguintes escalas: Abertura: 1.4 – 2 – 2.8 – 4 – 5.6 – 8 – 11 – 16 – 22 Velocidade: 1 – 1/2 – 1/4 – 1/8 – 1/15 – 1/30 – 1/60 – 1/125 – 1/250 – 1/500 – 1/1000 Uma fotografia foi feita com abertura 8 e 1/125. Se a velocidade for mantida, qual será a abertura utilizada para uma foto feita com quatro vezes menos luz ambiente?', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'16', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'2', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'5.6', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'11', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'4', 1);

    -- Módulo 7 (Triângulo de Exposição), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q16', N'Em um evento esportivo, para a captura de uma imagem nítida congelada de um atleta em movimento é necessário que a câmera esteja com a configuração do ___________ em _____________ velocidade e compensação com __________ do __________ para a exposição ideal. Assinale a seguir a alternativa com as palavras que preenchem CORRETAMENTE a frase anterior.', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO, baixa, fechamento, obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO, alta, fechamento, diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'diafragma, alta, fechamento, obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'obturador, baixa, abertura, ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'obturador, alta, abertura, diafragma.', 1);

    -- Módulo 7 (Triângulo de Exposição), questão original Q17
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q17', N'Analise as afirmativas a seguir: I. Existe uma relação entre o obturador e a sensibilidade ISO. Os sensores de alto ISO, necessitam de menos luz, logo maior é a velocidade do obturador (1/500). Os sensores de baixo ISO, necessitam de mais luz, logo menor é a velocidade do obturador (1/60). II. Ao selecionar uma lente objetiva, o fotógrafo é impedido de definir as características da perspectiva, da profundidade de campo, da composição e do enquadramento. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q18', N'Uma câmara fotográfica mecânica possui quatro mecanismos básicos de regulagens. Quais dessas regulagens ficam, na maioria das máquinas, no corpo da câmara?', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Controle da velocidade e ajuste do foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Abertura do diafragma e controle da velocidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Abertura do diafragma e sensibilidade do filme (ISO).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Sensibilidade do filme (ISO) e ajuste do foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Sensibilidade do filme (ISO) e controle da velocidade.', 1);

    -- Módulo 7 (Triângulo de Exposição), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q19', N'Analise as afirmações abaixo e assinale a alternativa INCORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A profundidade de campo também é controlada pelo diafragma', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Quanto maior for a abertura do diafragma, menor será o número de F (“fstop”)', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O diafragma fica na frente da objetiva e controla a entrada de luz', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Um conjunto de lâminas finas e justapostas compõe a estrutura do diafragma', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q20', N'Os ajustes operacionais da câmera, mais do que simples imperativos técnicos, constituem-se em instrumentos importantes da linguagem fotográfica, na medida em que, através deles, se pode definir até o conteúdo da mensagem. São eles:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o foco, o diafragma e a velocidade de obturação;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o enquadramento, o grão e os pixels;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a velocidade da obturação, os pixels e o punctum;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o diafragma, o punctum e o grão;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o enquadramento, o flash e o foco.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q21', N'As câmeras fotográficas para o público amador, embora fáceis de manusear, têm poucos recursos para a obtenção de boas imagens. Os equipamentos profissionais, entretanto, permitem as regulagens de:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sombreamento, perspectiva, foco e dimensionalidade;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sensibilidade do filme, velocidade, sombreamento e foco;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'nitidez, abertura do diafragma, tempo de exposição e cronometragem;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'velocidade, cronometragem, profundidade e nitidez;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'tempo de exposição do filme, abertura do diafragma, foco e sensibilidade do filme.', 1);

    -- Módulo 7 (Triângulo de Exposição), questão original Q22
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q22', N'Em uma câmera fotográfica analógica profissional existem dois elementos mecânicos que controlam a quantidade de luz que sensibiliza o filme. Quais são eles?', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Disparador e objetiva', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Obturador e diafragma', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Obturador e objetiva', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Anel de foco e zoom', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q23
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q23', N'Quanto ao controle de luz na fotografia, é correto afirmar que ela é definida na câmara a partir', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'do enquadramento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do CCD existente nas câmaras digitais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'da abertura do diafragma e da velocidade do obturador.', 1);

    -- Módulo 7 (Triângulo de Exposição), questão original Q24
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q24', N'Analise as frases abaixo e assinale a alternativa correta:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Em um ambiente com pouca luz, o fotógrafo optou por uma maior sensibilidade do sensor, o que torna a imagem mais clara, porém evidencia o ruído. Valores baixos são menos sensíveis, granulam pouco e tem como resultado uma imagem com qualidade melhor', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A baixa sensibilidade em ISO 100 não permite grandes ampliações porque a granulação expõe maiores detalhes do objeto fotografado', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O uso do ISO 200 a 800 requer muita luz, o que delimita o tipo de objeto a ser fotografado, sendo utilizado apenas em fotografa de movimento', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Fechando o diafragma, isto é, reduzindo gradativamente seu diâmetro, aumenta-se ao mesmo tempo a quantidade de luz que entra pela objetiva', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q25
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q25', N'A luz é matéria-prima da fotografia. Sem a luz não se consegue reproduzir uma imagem fotográfica, posto que uma fotografia com excesso de luz é uma imagem superexposta e com falta de luz é sub-exposta. Uma boa imagem fotográfica precisa desse equilíbrio, no que se refere à luz. Os elemento que formam o tripé da fotografia são:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sensibilidade, sensor e ISO', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diafragma, sensor e obturador', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'objetiva, sensibilidade e ISO', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'obturador, diafragma e sensibilidade', 1);

    -- Módulo 7 (Triângulo de Exposição), questão original Q26
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q26', N'As câmeras fotográficas possuem uma série de componentes comuns, sejam câmeras convencionais, que usam filmes, ou digitais, que usam um chip (sensor). Assinale a alternativa correta que representa os componentes comuns das câmeras fotográficas:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Objetiva, Diafragma e Obturador', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Diafragma, Obturador e Rádio Flash', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Objetiva, Obturador e Cartão de Memória', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Radio Flash, Tubo de extensão e Diafragma', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q27
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q27', N'Em situação de pouca luminosidade, o que se deve fazer para a produção de boas fotografias?', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Reduzir a abertura do diafragma e elevar a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Aumentar a sensibilidade do sensor digital (ISO) ou usar flash.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Ajustar o white balance para luz do dia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Usar filtro polarizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Ajustar o temporizador para dois segundos.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q28
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q28', N'Analise o texto abaixo. Na regulagem do obturador, a imagem tende a ficar congelada quando usamos ____________ velocidade; quando utilizamos o diafragma mais fechado, a imagem tende a ficar com _____________ profundidade de campo e usamos ISO alto para situações de _____________ luminosidade. A alternativa que preenche, correta e respectivamente, as lacunas, de cima para baixo, é:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pouca – muita – pouca', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'pouca – pouca – muita', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'muita – pouca – muita', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'muita – muita – muita', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'muita – muita – pouca', 1);

    -- Módulo 7 (Triângulo de Exposição), questão original Q29
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q29', N'Analise as afirmativas a seguir: I. O ruído é o termo que se usa para denominar os pontilhados e aberrações de cores que tornam a fotografia menos nítida. Trata-se de pequenos pontos luminosos que dão a ideia de granulado, pouca definição e são gerados pela instabilidade do sensor ISO. II. A estabilização de imagem é um recurso muito útil que aumenta o número de imagens falhas e tremidas, que pode ser instalado no próprio corpo da câmera ou nas lentes. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q30
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q30', N'Sobre as noções de luz e abertura, marque a afirmativa INCORRETA.', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A abertura f 1.4 é considerada alta abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Exposição é a quantidade de luz que o sensor da câmera recebe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O tempo que o obturador da câmera passa aberto interfere na exposição da foto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Uma fotografia é considerada “estourada" quando o sensor capta menos luz do que deveria.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A configuração “ISO 100, f 1.4, 1/160” gera uma fotografia mais clara que “ISO 100, f 2.8, 1/200”.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q31
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q31', N'Ao iniciar um novo trabalho fotográfico, sugere-se sempre estabelecer uma revisão geral nos parâmetros da câmera, antes de começar a fotografar. Entre as alternativas abaixo, quais ajustes devem ser priorizados?', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Contraste, obturador e escolha do ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Tipo e qualidade do arquivo que será produzido, ISO e WB.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Regulagens dos sais de prata e grãos, ISO e WB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Sensibilidade do sensor, velocidade de disparo e diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Saturação do arquivo, diafragma e WB.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q32
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q32', N'Analise as afirmativas a seguir: I. O obturador é uma espécie de cortina que protege a câmera da luz, que, quando acionado, abre o disparador, permitindo que a luz atinja o CCD ou o sensor. Quanto mais tempo aberto, mais luz entra. A velocidade do obturador é um dos fatores utilizados para alterar o resultado final de uma fotografia pelo fotógrafo. II. A profundidade de campo é um efeito que descreve até que ponto objetos que estão mais próximos ou mais distantes do plano de foco aparentam estar nítidos. Ela é medida pelos tons de verde na imagem. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q33
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q33', N'Para se obter uma fotografia numa avenida à noite de forma que os faróis dos carros em movimento escrevam linhas amarelas na imagem gravada, deve-se:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Colocar a câmera no tripé, acionar o diafragma em f: 5.6 e a velocidade do tempo de obturação em 1/125.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Colocar a câmera no tripé, acionar o diafragma na posição B e o tempo de obturação em 1/30.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Colocar a abertura do diafragma na posição f:16 e a aumentar a velocidade do tempo de obturação para 500.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Colocar a câmera no tripé, abrir ao máximo o diafragma para entrada de luz e acionar a velocidade do tempo de obturação na posição B.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Colocar a abertura do diafragma na posição f:4 para entrada de luz e acionar a velocidade do tempo de obturação em 250.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q34
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q34', N'Um fotógrafo foi pautado para registrar uma apresentação de trabalho em uma sala pequena (12m quadrados) e com pouca luz. A demanda pelo trabalho solicitava imagens em planos gerais. Além disso, os participantes estariam em constante movimento e não seria possível utilizar flash. Em sua bolsa de equipamentos, o fotógrafo dispunha de uma objetiva 18-55mm, com aberturas 3.5 – 5.6; uma objetiva 24-70mm com abertura 2.8, uma objetiva 85mm com abertura 1.8 e uma objetiva 70-200mm com abertura 2.8. A câmera utilizada teria um sensor no formato FX. Dadas as condições apresentadas e a exigência de imagens nítidas e não borradas, a melhor configuração de regulagens e lentes para a realização da tarefa seria:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 1600, obturador em 1/15, e objetiva 18-55mm, com diafragmas variando entre 8 e 16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 200, obturador 1/125, e objetiva 85mm, com diafragma 1.8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 1600, obturador 1/125, e objetiva 24-70mm, com diafragmas variando entre 2.8 e 5.6.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 200, obturador 1/15, e objetiva 24-70mm, com diafragmas variando entre 5.6 e 8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 3200, obturador 1/125, objetiva 70200mm, com diafragmas variando entre 2.8 e 5.6.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q35
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q35', N'Analise as afirmativas a seguir: I. Em geral, as máquinas têm a opção de escolha automática para o ISO. Mas, para fotos internas com pouca luminosidade, é importante aumentar o ISO para que o tempo de exposição seja possível de ser realizado sem tripé. II. A sigla SLR significa Single Lens Reflex, em inglês, e se refere às câmeras que usam um prisma e um jogo de espelhos para a captura da imagem, além de permitir o intercâmbio de lentes e filtros, possibilitando uma maior qualidade das fotos. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q36
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q36', N'Analise as afirmativas a seguir: I. A distância focal, medida em milímetros, é a distância ente o centro ótico da lente e o sensor da câmera. Essa é uma informação importante para classificar as lentes. II. O ISO mede a sensibilidade do sensor ou filme à luz. Quanto maior for o valor do ISO, mais sensível será o sensor. Normalmente, em cenários ou espaços com pouca luz, devemos usar um ISO de valor mais elevado para compensar a falta de luz. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Módulo 7 (Triângulo de Exposição), questão original Q37
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Triângulo de Exposição - Q37', N'Analise as afirmativas a seguir: I. Quando temos demasiada luz, devemos usar um valor ISO mais baixo. No entanto, devemos ter um especial cuidado quando selecionamos o valor do ISO porque, se tratando de um elemento de sensibilidade, ele poderá provocar algum ruído nas fotografias. II. As lentes objetivas com distâncias focais inferiores a aproximadamente 40 mm são consideradas grande angular, pois oferecem um amplo campo de visão, ou seja, com seu uso, podemos enquadrar grandes áreas a uma curta distância. As lentes são indispensáveis para fotografias em locais fechados, como festas. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Módulo 8 (EV), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q01', N'PADRÃO VUNESP Considerando um mesmo valor de ISO, para se obter a mesma intensidade de luz a atingir uma superfície fotossensível, a combinação de velocidade 125 e abertura 8.0 poderia ser substituída, respectivamente, por', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'60 e 11.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'60 e 16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'125 e 11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'250 e 11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'250 e 16.', 0);

    -- Módulo 8 (EV), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q02', N'Em uma determinada situação de luminosidade, após realizar a fotometria, o fotógrafo se deparou com as seguintes combinações, para o ISO previamente ajustado em 100: Abertura de diafragma f/11 e velocidade de obturação 1/250”. Porém, o fotógrafo diminuiu a velocidade para 1/60” e não fez nenhuma compensação nas outras variáveis (ISO e abertura de diafragma), com isso a fotografia se apresentou como resultado final:', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'uma fotografia subexposta', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'uma fotografia superexposta', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'uma fotografia com a exposição correta', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'uma fotografia com alto nível de ruído eletrônico', 0);

    -- Módulo 8 (EV), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q03', N'Em uma determinada situação de luz a leitura feita pelo fotômetro indica uma combinação de diafragma e obturador de f8 com 1/125s. A partir de uma lei de reciprocidade é possível que se coloque a mesma quantidade de luz no filme fazendo compensações com o diafragma e o obturador. Quais das alternativas abaixo indicam combinações possíveis para que se consiga a mesma luminosidade obtida com f8 e 1/125s.', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f11 e 1/60.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f8 e 1/60.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f16 e 1/60.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f5,6 e 1/30.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f2,8 e 1/250.', 0);

    -- Módulo 8 (EV), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q04', N'Uma câmera ajustada com obturador em 1/250, diafragma em f 11 e ISO 200, trabalha com a mesma quantidade de luz se ajustada em:', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/500 / f 16 / ISO 3200.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/1000 / f 8 / ISO 400.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/250 / f 16 / ISO 200.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/125 / f 5.6 / ISO 1600.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/60 / f 8 / ISO 400.', 0);

    -- Módulo 8 (EV), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q05', N'Em um registro fotográfico, sob uma determinada condição de luz, o valor da abertura do diafragma proposto pelo fotômetro é de f/5.6, mas o fotógrafo opta por utilizar a abertura f/2.8. Ao fazer isso, assinale a alternativa que apresenta o que acontece com a intensidade luminosa que atinge o sensor:', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Cai pela metade', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Quadruplica', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Dobra', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Permanece inalterada', 0);

    -- Módulo 8 (EV), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q06', N'Em uma cena externa, com determinada condição de luz, com a câmera regulada no ISO 200, a exposição correta, de acordo com a fotometria, foi a combinação do obturador em 1/125 e diafragma f 8. De acordo com a lei de reciprocidade, a melhor regulagem para se obter uma velocidade que crie um arrasto nos carros em movimento é o obturador e o diafragma, respectivamente, em:', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/15 e a f 22.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/250 e a f 16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/125 e a f 16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/125 e a f 8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/ 30 e a f 5.6.', 0);

    -- Módulo 8 (EV), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q08', N'Com uma velocidade de obturador 1/60, um diafragma f2.8 e ISO 100 a imagem resultante ficou superexposta em dois pontos de diafragma. Que combinação velocidade do obturador X diafragma devo usar para obter a imagem com a exposição correta?', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Velocidade do Obturador 1/60 e Diafragma f8', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Velocidade do Obturador 1/125 e Diafragma f4', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Velocidade do Obturador 1/125 e Diafragma f2.8', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Velocidade do Obturador 1/250 e Diafragma f5.6', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Velocidade do Obturador 1/500 e Diafragma f2.8', 0);

    -- Módulo 8 (EV), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q09', N'Utilizando uma objetiva de 50 mm 1:1.4, um fotógrafo fez uma imagem com sua câmera regulada com um tempo de exposição de 1/30 e f5.6. Contudo, ele quer diminuir ao máximo sua profundidade de campo, mantendo o mesmo índice de exposição. Assinale a alternativa que corresponde à melhor opção que ele tem de regulagem da câmera.', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Tempo de exposição em 1/250 e f16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Tempo de exposição em 1/125 e f11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Tempo de exposição em 1/2 e f22.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Tempo de exposição em 1/30 e f1.4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Tempo de exposição em 1/500 e f1.4.', 1);

    -- Módulo 8 (EV), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q10', N'“Reciprocidade” em fotografia digital se refere a: I. Possibilidade de produzir imagem com uma mesma medida de luz, ainda que utilizando diferentes apontamentos para obturação, diafragma e ISO. II. Mesma coisa que latitude em fotografia analógica. III. Capacidade do sensor de registrar detalhe em áreas de altas e baixas luzes em uma mesma imagem. Quais estão corretas?', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apenas I.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas II e III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I, II e III.', 0);

    -- Módulo 8 (EV), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q11', N'Em uma situação fotográfica, o mecanismo de medida de luz de uma câmera indica ao fotógrafo que ele teria uma condição ideal de iluminação da cena com os mecanismos configurados em ISO 200, diafragma 8 e velocidade 1/250. Qual das seguintes alternativas possibilitaria uma iluminação similar, com configurações de câmera/objetiva diferentes? 100 200 400 800 1600 3200 6400 1 2 4 8 15 30 60 125 250 500 1000 2000 4000 8000 1.8 2.8 4 5.6 8 11 16 22 32', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Aumentando a sensibilidade do sensor em 2 pontos de luz, fechando a abertura 1 ponto de luz e aumentando a velocidade para “1/500”.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Aumentando a sensibilidade do sensor em 2 pontos de luz, abrindo o diafragma em um 1 ponto de luz e aumentando a velocidade para “1/500”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Mantendo o ISO, abrindo o diafragma para “2.8” e aumentando a velocidade para “1/1000”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Diminuindo a sensibilidade do sensor em 1 ponto de luz, fechando a abertura em 1 ponto de luz e aumentando a velocidade para “1/500”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Aumentando o ISO para 800, mantendo o diafragma em “8” e aumentando a velocidade para “1/500”.', 0);

    -- Módulo 8 (EV), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q12', N'PADRÃO VUNESP Durante o jogo de vôlei na praia, o fotógrafo, por meio do uso do fotômetro incorporado à câmera, fez algumas avaliações de exposição, antes de captar a imagem que se observa a seguir. Tratandose de uma manhã de sol, e optando pelo uso de um filtro de densidade neutra ND 0.3, o fotógrafo, com a leitura do fotômetro, obteve como resultado: ISO 100; 1/30; f.16 Observando o resultado da imagem fotografada, pode-se concluir que o fotógrafo alterou adequadamente a configuração de exposição proposta pelo fotômetro. A configuração de exposição utilizada pelo fotógrafo foi:', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 400; 1/250; f.4 e manutenção do filtro ND 0.3.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 400; 1/30; f.8 e manutenção do filtro ND 0.3.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 200; 1/500; f.2.8 e manutenção do filtro ND 0.3.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 800; 1/15; f.8 e eliminação do filtro ND 0.3.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 200; 1/500; f.8 e eliminação do filtro ND 0.3.', 1);

    -- Módulo 8 (EV), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q15', N'Leia a seguinte situação: Ao fotógrafo cabe registrar a imagem de um corpo inerte, deitado em uma cama, no interior de um quarto sem luz elétrica, iluminado apenas por um pouco de luz difusa de fim de tarde que entra pela janela. Não há possibilidade de se usar refletores, pois no ambiente não há corrente elétrica e, por um problema técnico, o flash está inoperante. A primeira leitura de exposição que o fotógrafo faz, enquadrando apenas o corpo, é a seguinte: ISO 3200; 1/125 seg.; f/1.4. O profissional deseja registrar a foto com o melhor resultado possível, evitando ruídos, perda de definição e qualquer alteração no ambiente. Sabendo que o fotógrafo tem à sua disposição um tripé, qual a melhor configuração para que ele alcance o resultado pretendido e mantenha a mesma relação de exposição?', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 1600; 1/30 seg.; f/1.4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 400; 1/4 seg.; f/2.8.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 800; 1/60 seg.; f/2.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 3200; 1/4 seg.; f/1.4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 400; 1/125 seg.; f/2.', 0);

    -- Módulo 8 (EV), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q16', N'Para fazer uma foto na luz do dia, o fotógrafo usou a seguinte combinação: diafragma 5.6 e velocidade 1/500s. De acordo com o Princípio da Reciprocidade, a nova velocidade do obturador, nas mesmas condições de iluminação e com a mesma sensibilidade de filme, se ele precisar usar diafragma 16 deve ser de:', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/60s;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/2000s;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/250s;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/1000s;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/15s.', 0);

    -- Módulo 8 (EV), questão original Q17
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q17', N'Considere a seguinte situação. Um fotógrafo foi contratado para fazer retratos de um advogado em seu escritório. O ambiente é pouco iluminado e o advogado possui forte aversão à luz do flash, o que obriga o fotógrafo a optar pela luz ambiente exclusivamente. O fotógrafo configurou a máquina para os seguintes ajustes: 1/250, f8.0 e ISO 100. O resultado não ficou como ele gostaria por causa da baixa luminosidade do ambiente. A combinação que melhor resolveria o problema descrito acima, considerando um resultado mais eficaz que compense a baixa luz do local, seria', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/500, f8.0, ISO 100.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/250, f11.0, ISO 100.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/250, f16.0, ISO 200.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/125, f8.0, ISO 3200.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/125, f11.0, ISO 400', 1);

    -- Módulo 8 (EV), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - EV - Q18', N'Se, para conseguir a exposição ideal, o fotógrafo precisar diminuir pela metade a quantidade de luz que entra na câmera digital, ele deverá', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a velocidade do obturador de 1/125 para 1/500.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fechar em um ponto (stop) o diafragma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'dobrar a sensibilidade do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'mudar o arquivo de JPG para RAW', 0);

    -- Módulo 9 (Fotometria), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q01', N'Ao termo “fotometria”, damos o significado de:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Tempo da luz', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Força da luz', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Direção da luz', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Medida da luz', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Reflexão da luz', 0);

    -- Módulo 9 (Fotometria), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q02', N'Em sua atividade cotidiana, o fotógrafo utiliza-se de diversos dispositivos tecnológicos, acoplados ao equipamento fotográfico ou utilizados isoladamente para conceber a fotografia. Especificamente, para conhecer a intensidade de luz que sensibilizará o suporte analógico ou digital de captação da imagem, regular a abertura do diafragma e o tempo de exposição, ele precisará usar o', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'espectrômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fotômetro', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'telêmetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'kelvinômetro.', 0);

    -- Módulo 9 (Fotometria), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q03', N'Por que é importante ajustar corretamente a abertura do diafragma e a velocidade de obturação, observando a fotometria da cena?', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Para ter fotos bem expostas, evitando superexposição ou subexposição nas imagens capturadas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Para poder fotografar no modo automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Para fazer fotografias bem focadas e sem reflexos em áreas brilhantes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Para evitar que a profundidade de campo interfira na resolução da ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Não é necessário ajustar a abertura e o diafragma quando se fotografa no modo manual.', 0);

    -- Módulo 9 (Fotometria), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q04', N'O fotômetro é utilizado para medir a:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'distância até o objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sensibilidade do filme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'velocidade de disparo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'intensidade de luz.', 1);

    -- Módulo 9 (Fotometria), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q05', N'Assinale a alternativa CORRETA. Os fotômetros podem ser integrados aos equipamentos fotográficos ou manuais, portanto, externos, tanto um como o outro:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A medição é realizada através de uma escala', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A medição é realizada tendo por base a palma da mão', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A medição é realizada levando-se em conta o ambiente (calor) e temperatura (externA)', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A medição é realizada apenas pela luz refletida da objetiva', 0);

    -- Módulo 9 (Fotometria), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q06', N'Qual é a principal função dos fotômetros?', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Ajustar a distância focal das objetivas fotográficas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Melhorar as cores de uma fotografia, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Medir a luminosidade da cena e sugerir ajustes do obturador e do diafragma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Controlar a distância da câmera ao objeto a ser fotografado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Melhorar o foco da imagem fotográfica.', 0);

    -- Módulo 9 (Fotometria), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q07', N'O fotômetro é um dispositivo muito importante para se ter uma imagem tecnicamente correta. Com relação à fotometria, analise as afirmativas a seguir. I. O fotômetro é um dispositivo que mede a luz da cena a ser fotografada, indicando ao fotógrafo se a imagem está subexposta, exposta ou superexposta. II. O fotômetro da câmera pode ser “enganado” dependendo do objeto no qual a medição é realizada, como em objetos pretos ou brancos. III. Tem-se basicamente dois modelos de fotômetros, o interno da câmera de luz refletida e o fotômetro de mão, de luz incidente. Está(ão) correta(s) a(s) afirmativa(s)', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'II e III, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'I e III, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I, II e III.', 1);

    -- Módulo 9 (Fotometria), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q08', N'O mecanismo que indica qual a melhor exposição através da relação: diafragma, obturador e ISO a ser usada para uma determinada tomada fotográfica é conhecido como', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Kelvinômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Exposímetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Focômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Fotômetro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Hiperfocal.', 0);

    -- Módulo 9 (Fotometria), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q09', N'Sobre o fotômetro, é incorreto afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Pode ser externo à câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Pode ser interno na câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Pode ser digital ou analógico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'É um aparelho utilizado para medir a luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Determina a combinação certa de abertura e velocidade.', 1);

    -- Módulo 9 (Fotometria), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q10', N'As câmeras digitais são equipadas com fotômetros, que medem a intensidade da luz que entra pela objetiva. Trabalhando juntamente com ISO, velocidade do obturador e a abertura do diafragma, o fotômetro automaticamente altera o valor de uma escala assim que qualquer um desses fatores seja alterado. Os modos de medição determinam em qual área o fotômetro irá atuar, sendo importante recurso para a obtenção de boas imagens. É corretor afirmar que o modo de medição', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Partial é adequado para que o fotógrafo faça a exposição correta de cenas que, do seu ponto de vista, estão muito claras ou muito escuras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Spot corresponde ao modo em que o fotômetro faz uma medição na área central, ao redor do ponto central de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Center Weighted Average faz a mensuração por média aritmética, dando mais peso à área periférica do que à área central do visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Pontual se refere à média ponderada calculada pelo fotômetro, dando mais peso à área central do visor e menos peso à área periférica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Evaluative corresponde ao trabalho do fotômetro de calcular a exposição levando em conta toda a área do visor e tirando uma média das luminâncias de todas as áreas da cena.', 1);

    -- Módulo 9 (Fotometria), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q11', N'Fotometrar consiste em se medir a quantidade de luz existente no ambiente onde será tomada a fotografia, para desta maneira ajustar de forma ideal a velocidade de obturação e abertura de diafragma, já levando-se em consideração que o ISO foi previamente ajustado a fim de se obter uma correta exposição. Sobre a fotometria há dois tipos existentes: fotometria de luz incidente e fotometria de luz refletida. Analise as afirmativas abaixo a respeito da fotometria de luz incidente. I. A fotometria de luz incidente consiste em medir-se a quantidade de luz que incide sobre o assunto a ser fotografado, ou seja, neste tipo de fotometria o fotômetro mede a própria fonte de luz. II. Os fotômetros de luz incidente estão integrados as câmeras fotográficas, sendo feito seu ajuste no menu de configurações. III. Como o fotômetro de luz incidente mede a própria fonte de luz e não a luz que reflete do assunto, o mesmo não leva em consideração a taxa de refletância das tonalidades das cores, tornando este tipo de fotometria extremamente preciso se comparado com a fotometria de luz refletida. Estão corretas as afirmativas:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'II apenas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'I e III apenas', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'II e III apenas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I, II e III', 0);

    -- Módulo 9 (Fotometria), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q12', N'A função do fotômetro em uma câmera fotográfica é:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Controlar o tempo de exposição à luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Controlar a quantidade de luz que passa pela objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Fazer a medição de luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Selecionar a sensibilidade do filme utilizado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Configurar o ângulo de cobertura da lente.', 0);

    -- Módulo 9 (Fotometria), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q13', N'A câmera DSLR tem um fotômetro, dispositivo que mede a intensidade de luz da cena a ser fotografada através da objetiva; porém, existe também o fotômetro de mão. A diferença básica entre eles no ato de medir é: Fotômetro da câmera mede________/ Fotômetro de mão mede_______:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'luz refletida / luz incidente', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'luz em tons de cinza / luz branca', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'só a refletida luz / a temperatura', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a alta luz / a baixa luz', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'só a baixa luz / a alta luz', 0);

    -- Módulo 9 (Fotometria), questão original Q14
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q14', N'Assinale a alternativa que corresponde à informação dada pelo principal instrumento de medida do fotógrafo, o fotômetro.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Ele aponta que sua medida é a ideal para se produzir uma fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Ele pode ser lido como: “- Ok, pode fazer a fotografia que vai dar certo”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Ele informa que haverá um “tom médio”, se fotografado segundo suas indicações.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Ele informa a luz correta para se fazer uma fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Ele informa a melhor combinação entre diafragma e obturador.', 0);

    -- Módulo 9 (Fotometria), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q15', N'A luz que a câmera fotográfica mede em uma cena para calcular a exposição é:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'turva', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'difusa', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'incidente', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'refletida', 1);

    -- Módulo 9 (Fotometria), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q16', N'O fotômetro é um aparelho que mede a intensidade da luz. Algumas câmeras possuem um fotômetro interno, em outros casos, é necessário utilizar um fotômetro externo. Em relação aos fotômetros, assinale a alternativa CORRETA.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Existem três tipos de medição de luz nos fotômetros: o de luz refletida, o de luz incidente e o de luz excedente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O fotômetro de luz refletida capta a luz que incide no objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O fotômetro de luz incidente é colocado à frente do objeto, mas virado para a câmera para medir a luz que incide sobre o objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O fotômetro de luz excedente capta o excesso de luz no ambiente, permitindo o ajuste dos controles para uma exposição adequada.', 0);

    -- Módulo 9 (Fotometria), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q18', N'Se o fotógrafo quer o máximo de precisão na fotometragem em um único ponto da imagem, na sua câmera monorreflex, ele opta pelo fotômetro:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'TLR;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'de luz incidente;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'matricial;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'spot;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'SLR.', 0);

    -- Módulo 9 (Fotometria), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q19', N'Assinale a alternativa que indica o recurso utilizado para encontrar a exposição correta da foto ao combinar obturador, diafragma e ISO.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Gerador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Fotômetro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Motor drive.', 0);

    -- Módulo 9 (Fotometria), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q20', N'O modo de medição da luz, chamado de fotometria, presente nas câmeras digitais pode ser alterado para se obter diferentes resultados na fotografia digital. O modo que divide a cena em diferentes zonas e que calcula o brilho médio da cena a ser fotografada é conhecido como:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Modo Pontual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Modo Matricial.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Modo Isolado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Modo Parcial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Modo Estilizado.', 0);

    -- Módulo 9 (Fotometria), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotometria - Q21', N'Analise as afirmativas a seguir: I. O obturador é um dispositivo eletromecânico situado no corpo da máquina fotográfica, após o diafragma, e que controla o tempo de duração restante da bateria ou da pilha. II. A fotometria, na fotografia, é o processo de medir a luz refletida para dentro da câmera através do fotômetro e ajustar seus valores através dos dispositivos diafragma e obturador, de forma a captar uma imagem gravada com qualidade, em uma superfície fotossensível. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Módulo 10 (Focagem), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Focagem - Q01', N'Para garantir a nitidez à imagem em um determinado plano, o ajuste das diversas lentes que compõem a objetiva é feito pela regulação do anel:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'da exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'de focagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da sensibilidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do diafragma.', 0);

    -- Módulo 10 (Focagem), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Focagem - Q02', N'Na máquina fotográfica, o espaço existente entre o eixo da objetiva e o plano no qual se forma a imagem é conhecido como:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'erro de paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'raio de curvatura', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'índice de refração', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'distância focal.', 1);

    -- Módulo 10 (Focagem), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Focagem - Q03', N'O mecanismo disposto sobre a objetiva e que pode ser girado até que se obtenha uma imagem nítida no visor é conhecido como:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Escala de diafragmas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Anel de foco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Escala de velocidades.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Medida de sensibilidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Pré-visualizador de profundidade de campo.', 0);

    -- Módulo 10 (Focagem), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Focagem - Q04', N'Como é feita a medida do foco em uma câmera fotográfica digital?', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Pela distância do objeto focado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Pela luz refletida no objeto focado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Pela luz incidente no objeto focado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Pela abertura da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Pela velocidade de obturação.', 0);

    -- Módulo 10 (Focagem), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Focagem - Q05', N'O sistema de foco das câmeras DSLR é:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'manual e automático.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'automático e por dioptria.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'automático e telemétrico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'automático e catadióptrico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'automático e por metragem.', 0);

    -- Módulo 11 (RGB), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - RGB - Q02', N'A luz branca que atravessa um prisma cria todas as cores do arco-íris, mas só três delas são necessárias para produzir todas as outras. Quais são elas?', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Verde, Azul e Branca.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Amarelo, Azul e Verde.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Vermelho, Verde e Azul.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Ciano, Magenta e Amarelo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Vermelho, Azul e Amarelo.', 0);

    -- Módulo 11 (RGB), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - RGB - Q03', N'Uma imagem com equilíbrio de cores é aquela cuja iluminação apresenta todas as cores em proporções iguais, ou seja, na qual a luz é:', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'azul, vermelha e amarela', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'branca', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'azul', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'laranja e magenta', 0);

    -- Módulo 11 (RGB), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - RGB - Q04', N'As cores primárias subtrativas são:', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'amarelo, magenta e azul.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ciano, verde e amarelo', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ciano, magenta, azul.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'magenta, ciano e amarelo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'vermelho, magenta e amarelo.', 0);

    -- Módulo 11 (RGB), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - RGB - Q05', N'O princípio aditivo do sistema de cores da fotografia digital é também usado no tratamento da imagem digital no computador, em softwares com finalidade de pós -produção. As cores primárias podem produzir qualquer outra cor ou se equilibrarem entre si. O princípio responsável por isso é', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'CMOS.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'CMYK.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'RGB.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'BITS.', 0);

    -- Módulo 11 (RGB), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - RGB - Q06', N'Uma imagem digital colorida é composta pelas seguintes camadas de cor:', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'branco, amarelo e azul', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'azul, amarelo e verde', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'vermelho, verde e azul', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'preto, branco e vermelho', 0);

    -- Módulo 11 (RGB), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - RGB - Q09', N'Para o equipamento fotográfico digital determinar o sistema de cores RGB é necessário determinar', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O verde', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O preto', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O branco', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O vermelho', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O azul', 0);

    -- Módulo 11 (RGB), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - RGB - Q10', N'Os substratos de captura de imagem dos equipamentos fotográficos digitais são normalmente baseados no sistema de cores', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'RGB', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'CCD', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'CMOS', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'DPI', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'CYK', 0);

    -- Módulo 12 (Flash), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q01', N'PADRÃO VUNESP Uma câmera com abertura de diafragma 11, sensibilidade ajustada para ISO 100, e utilizando um flash com número guia (NG) 45, poderia afastar-se de sua cena em aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1,0 m.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1,5 m.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'2,0 m.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'3,0 m.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'4,0 m.', 1);

    -- Módulo 12 (Flash), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q02', N'Na fotografia com flash o conhecimento do número guia pelo fotógrafo será de grande ajuda na determinação do diafragma necessário para se fotografar a uma determinada distancia do tema, já que o numero f é obtido a partir da divisão do numero guia pela distancia, com filme ISO 100. Fotografando um tema a três metros de distância com um flash de número guia 32 qual seria a abertura de diafragma mais indicada?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f: 8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f: 22.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f: 5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f: 16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f: 11.', 1);

    -- Módulo 12 (Flash), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q04', N'Em relação ao Número Guia, é CORRETO afirmar que ele é utilizado para:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'equilibrar a temperatura da cor nas fotografias com luz natural, relacionando corretamente a distância do objeto com o tempo da exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'garantir o uso correto da luz do flash, com o objetivo de relacionar adequadamente a abertura do diafragma com a distância do objeto a ser fotografado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'corrigir as cores antes de se fotografar, sempre levando em conta o relacionamento do enquadramento da cena com a distância do objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'condensar ou compensar o equilíbrio das cores nas fotografias obtidas com luz artificial, relacionando corretamente o espaço e o tempo da exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'corrigir o foco em cenas onde exista iluminação muito débil, para relacionar corretamente a distância e o ângulo com o motivo a ser fotografado.', 0);

    -- Módulo 12 (Flash), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q06', N'Analise as afirmativas a seguir, relativas ao uso de flashes de sapata. I. Possuem um modo automático que faz a leitura da luz através da objetiva da câmera e regula a potência necessária para iluminar a cena ou modo manual, no qual o fotógrafo deve regular a potência manualmente. II. Podem ser sincronizados em qualquer velocidade do obturador da câmera, não interferindo no resultado final da imagem. III. O uso de um difusor, ou mesmo rebater o flash em uma superfície grande como um teto ou parede brancas, ajuda a difundir a luz, resultando em uma imagem com iluminação suave. Estão corretas as afirmativas', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I e II, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'II e III, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'I e III, apenas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I, II e III.', 0);

    -- Módulo 12 (Flash), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q07', N'Quando se usa o flash em exteriores, a luz artificial que ele emite às vezes supera a luz ambiente, produzindo um efeito duro, chapado. Em dias de sol, o desejável é reduzir a intensidade do flash, de forma que a luz discreta que é produzida seja suficiente apenas para preencher as sombras. Supondo que você esteja utilizando um flash manual, a melhor forma de proceder para conseguir esse “enchimento” seria:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Fazer uma leitura com fotômetro incorporado à câmera da luz ambiente, para determinar qual deve ser a exposição correta e avaliar a distância do flash até o assunto (usando o número-guia ou a tabela do próprio flash).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Fazer uma leitura com fotômetro incorporado à câmera da luz ambiente e utilizar o flash na máxima potência, independente do assunto fotografado ou da distância do objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Desconsiderar a fotometria da luz ambiente e ajustar o flash a um nível de potência correspondente à maior abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Desconsiderar a fotometria da luz ambiente e utilizar o flash a uma distância sempre de três metros.', 0);

    -- Módulo 12 (Flash), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q08', N'Para fotografar uma apresentação de teatro à noite, sem flash, desejando-se ter detalhes nas sombras, pessoas bem nítidas no primeiro plano e fundo bem desfocado, é preciso é preciso regular a câmera com uma abertura de diafragma', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'menor possível, ISO de pelo menos 400 e velocidade do obturador de pelo menos 30.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'maior possível, ISO de pelo menos 3 200 e velocidade do obturador de pelo menos 100.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'menor possível, ISO de pelo menos 400 e velocidade do obturador de pelo menos 30.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'maior possível, ISO de pelo menos 200 e velocidade do obturador de pelo menos 125.', 0);

    -- Módulo 12 (Flash), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q09', N'Em um ambiente com pouca luz, como num evento noturno ou em recinto fechado, é possível fazer retratos de pessoas e ao mesmo tempo capturar o cenário em torno dessa pessoa, deixando-o claro. Para isso, usa-se o flash e', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aplica-se o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumenta-se a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fecha-se o diafragma ao máximo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'deixa-se o tempo de exposição suficientemente baixo para capturar a luz ambiente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'abre-se ao máximo o diafragma.', 0);

    -- Módulo 12 (Flash), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q10', N'O que é o modo de flash com a tecnologia Through-de-lens, conhecido como TTL?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'É o modo que evita os tremidos na fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'É o modo que mede a luz que chega ao sensor através das lentes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'É o modo que evita olhos vermelhos nas pessoas retratadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'É o modo que mede a luz que chega ao sensor através de uma fotocélula.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'É o modo que permite uma luz tênue, suavizando as sombras.', 0);

    -- Módulo 12 (Flash), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q11', N'Em relação ao uso do flash, analise as assertivas abaixo. I. É utilizado somente para iluminar locais com pouca ou nenhuma luminosidade. II. Pode ser acionado para aumentar a profundidade de campo da imagem. III. Pode ser acionado para aumentar a velocidade do obturador. IV. Pode ser acionado para utilizar ISO menos sensível. Quais estão corretas?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apenas I.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas I e III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas I, II e IV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas II, III e IV.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I, II, III e IV.', 0);

    -- Módulo 12 (Flash), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q12', N'Analise o texto a seguir. Quando disparamos um flash, a luz propaga-se, criando uma pirâmide de luz, que, ao ___________ a distância, _________________ a área iluminada e divide-se a intensidade da luz por _______________. A alternativa que preenche, correta e respectivamente, as lacunas, de cima para baixo, é:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'dobrar – quadruplica – quatro', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'quadruplicar – dobra – dois', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'dobrar – triplica – quatro', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'triplicar – dobra – três', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'dobrar – dobra – dois', 0);

    -- Módulo 12 (Flash), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q13', N'Um fotógrafo utiliza um flash com NG=32 e está posicionado a 2 metros do elemento a ser fotografado. O diafragma utilizado para se obter uma exposição correta, com ISO 100, deve ser:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f 16.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f 11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f 32.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f 8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f 5.6.', 0);

    -- Módulo 12 (Flash), questão original Q14
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q14', N'O fotógrafo precisa fazer uma foto em um show à noite em uma casa de espetáculos com iluminação apropriada para executar esta tarefa. Nessa situação, os seguintes procedimentos permitirão uma imagem com aproveitamento ideal da iluminação do ambiente, à exceção de um. Assinale-o.', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Ajustar ISO de acordo com a luz do ambiente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Usar o flash externo da câmera independente da luz do show.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Ajustar a sensibilidade com a ajuda do fotômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Com a ajuda do fotômetro, fazer a regulagem entre obturador, diafragma e sensibilidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Medir a luz usando a sensibilidade da câmera digital.', 0);

    -- Módulo 12 (Flash), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q15', N'A potência de um flash eletrônico portátil é, tecnicamente, expressa por um número-guia (guide-number, GN). Quanto mais alto o número, mais potente é o flash. Utilizando-se um flash com número guia fixado em metros de valor 28, qual será a abertura solicitada pelo fotômetro para se fotografar um assunto distante 7 metros do plano focal da câmera (com ajuste ISO 100)?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'5.6', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'8', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'2.8', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'4', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'2', 0);

    -- Módulo 12 (Flash), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q16', N'A capacidade de iluminação de um flash acessório é medida, normalmente, pelo:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ringflash', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'automático', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'TTL', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'número guia', 1);

    -- Módulo 12 (Flash), questão original Q17
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q17', N'Velocidade de sincronismo é a:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'velocidade mínima em que o obturador sincroniza com o flash para uma exposição correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'velocidade mínima em que o diafragma sincroniza com o flash para uma exposição correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'velocidade mínima em que o obturador sincroniza com o diafragma para uma exposição correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'velocidade máxima em que o obturador sincroniza com o flash para uma exposição correta.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'velocidade máxima em que o diafragma sincroniza com o flash para uma exposição correta.', 0);

    -- Módulo 12 (Flash), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q18', N'Na realização de uma fotografia de um pequeno número de pessoas, com uma grande janela aberta de fundo, onde se encontra uma bela paisagem, com o objetivo de inserir as pessoas na paisagem, obviamente deixando-as com claridade suficiente para identificá-las, o fotógrafo deverá:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fotometrar na luz de fundo com a velocidade de sincronismo e usar o flash para iluminar as pessoas da foto', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'medir a luz nas pessoas, combinando obturador e diafragma e em seguida disparar a foto com flash', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'usar a maior velocidade da máquina e abrir bem o diafragma para clarear as pessoas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fechar o diafragma para evitar que o fundo fique claro em excesso e diminuir a velocidade para clarear as pessoas', 0);

    -- Módulo 12 (Flash), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q19', N'A potência de um flash é geralmente expressa por um número-guia. Quanto mais alto o número, mas potente é o flash. Considere um flash (com sistema de medidas expressas em metros) com número guia 28 para uma sensibilidade de ISO 100. Para se iluminar corretamente um assunto que esteja situado a 5 metros, o diafragma deve ser de', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/5.6.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/1.4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/2.8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/16.', 0);

    -- Módulo 12 (Flash), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q20', N'Uma foto tirada em ambiente pouco iluminado, sem uso de flash, pode obter uma imagem com movimento congelado e nítido se o operador/fotógrafo usar uma:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pequena abertura de diafragma, velocidade de obturador baixa e ISO baixo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'lente com grande abertura de diafragma, velocidade de obturador alta e ISO alto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'abertura de diafragma moderada, velocidade de obturador alta e ISO baixo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'lente com grande abertura de diafragma, velocidade de obturador baixa e ISO alto.', 0);

    -- Módulo 12 (Flash), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q21', N'Sobre o flash eletrônico, é correto afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Nunca deve ser utilizado com a luz do sol.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Possui alcance indefinido.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Não pode ser utilizado com filmes de sensibilidades diferentes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Somente deve ser utilizado à noite.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Exige o emprego de uma velocidade de sincronismo, ou inferior.', 1);

    -- Módulo 12 (Flash), questão original Q22
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q22', N'PADRÃO VUNESP Grande parte dos equipamentos de flash profissional tem cabeças que giram e se inclinam, permitindo direcionar o feixe luminoso contra paredes ou tetos, utilizando sobre o motivo iluminação rebatida. Em tais situações, é preciso observar que, ao inclinar o flash,', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a intensidade luminosa é elevada, pois a utilização de superfícies refletoras aumenta a área de abrangência da luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'não há alteração na exposição quando se tratar de superfícies brancas, que refletem 100% da luz que sobre elas incide.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'se torna necessário uma nova mensuração de foco, pois aumenta a distância entre a fonte de luz e o motivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'se torna necessário a mudança de distância focal da objetiva, pois há uma diminuição da área de abrangência da luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a intensidade luminosa é reduzida, pois aumenta a distância entre a fonte de luz e o motivo.', 1);

    -- Módulo 12 (Flash), questão original Q23
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q23', N'Pretende-se fotografar um evento interno iluminado por luzes artificiais. Contudo, o objeto principal está em sombra. O objetivo é fotografar esse objeto sem a perda total da coloração do ambiente. Para isso, usa-se o flash como luz de', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fundo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'preenchimento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'substituição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'lateralidade.', 0);

    -- Módulo 12 (Flash), questão original Q24
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q24', N'A utilização de flash em ambientes ensolarados serve para', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'gerar uma imagem com menos detalhes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'manter as sombras presentes no objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'evitar que a iluminação fique mais suavizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'atenuar as sombras da luz dura do ambiente.', 1);

    -- Módulo 12 (Flash), questão original Q25
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q25', N'Obturador é o nome dado a uma pequena “janela” dentro da câmera que funciona basicamente abrindo no momento do disparo para capturar a luz que passa pela lente. O tempo que o obturador passa aberto é chamado de tempo de exposição ou velocidade de obturação, ou seja, o tempo de exposição do filme (câmeras analógicas) ou do sensor (câmeras digitais), e a variação deste tempo determinam a quantidade de luz que será capturada para a fotografia. Quanto mais tempo aberto, mais luz é capturada, quanto menos tempo aberto, menos luz é capturada. Das velocidades abaixo, desse ver usada com flash eletrônico conectado à maquina, a velocidade:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'intermediária', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'de alta exposição', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'de sincronismo', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'de longa exposição', 0);

    -- Módulo 12 (Flash), questão original Q26
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q26', N'É correta a utilização do Flash de Preenchimento durante a luz do dia, pois deste modo:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A imagem ficará superexposta e, portanto natural', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Há uma melhor distribuição da luz na imagem propicia a diminuição acentuada de sombras', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'As sombras, com a luz do flash sumirão por completo', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Produzirão brilhos agradáveis como resultado do contraste entre luz e sombras', 0);

    -- Módulo 12 (Flash), questão original Q27
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q27', N'O flash eletrônico é usado na fotografia para suprir uma ausência da luz ambiente. Com a chegada da fotografia digital e as novas tecnologias, cada vez os flashes têm facilitado a vida dos fotógrafos. A sigla que significa fazer uma leitura da luz através da lente vem a ser:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'RFT', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'TTL', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'RTL', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'CVL', 0);

    -- Módulo 12 (Flash), questão original Q28
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q28', N'Fotografar eventos noturnos pode ser um desafio, sobretudo quando se trata de iluminar devidamente a pessoa e o cenário ao seu redor, mantendo-o claro na foto final. É possível conseguir esse efeito da seguinte forma:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'usar o flash e aumentar a velocidade do disparo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminuir a velocidade do obturador para captar a luz local e usar o flash para iluminar a pessoa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'direcionar o flash para a lateral de modo que seja possível rebater no cenário.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar o ISO e usar o flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'diminuir a abertura do diafragma e usar o flash.', 0);

    -- Módulo 12 (Flash), questão original Q29
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q29', N'Um dos modos para garantir a iluminação adequada em fotografias é o uso do flash eletrônico. Considerando o uso do flash em modo manual, com relação a velocidade, distância e abertura é necessário:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fixar a velocidade de sincronia indicada pelo fabricante da câmera e ajustar a abertura de acordo com a distância em relação ao assunto a ser fotografado, usando aberturas menores para assuntos mais próximos e aberturas maiores para assuntos mais distantes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fixar a abertura indicada pelo manual da câmera e ajustar a sincronia da velocidade, de acordo com a distância em relação ao assunto a ser fotografado, sendo que devem ser usadas aberturas maiores para assuntos mais próximos e aberturas menores para assuntos mais distantes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fixar a sincronia de velocidade indicada pelo manual da câmera e ajustar a abertura, de acordo com a distância em relação ao assunto a ser fotografado, sendo que devem ser usadas aberturas maiores para assuntos mais próximos e aberturas menores para assuntos mais distantes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fixar a abertura indicada pelo manual da câmera e ajustar a sincronia da velocidade, de acordo com a distância em relação ao assunto a ser fotografado, sendo que o uso de aberturas menores ou maiores independe das distâncias dos assuntos a serem fotografados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'fixar a velocidade de sincronia indicada pelo manual da câmera e ajustar a abertura de forma independente da distância do assunto a ser fotografado, sendo que aberturas menores ou maiores produzem efeitos semelhantes na imagem fotográfica obtida.', 0);

    -- Módulo 12 (Flash), questão original Q31
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q31', N'Sobre o uso do flash na fotografia, temos que I. flash embutido é aquele que vem acoplado ao corpo da câmera, enquanto flash dedicado é aquele que se encaixa na sapata da câmera. II. o pré-flash é um disparo curto emitido pelo flash antes do seu disparo principal. Sua função é reduzir o efeito “olhos vermelhos” e auxiliar na iluminação da cena. III. para minimizar a “luz dura” que o flash pode causar, é possível usar difusores ou direcionar o flash para superfícies refletoras como teto, paredes ou sombrinhas. IV. o flash dedicado pode operar em conjunto com objetivas EOS compatíveis, movendo o tubo do flash para frente e para trás para que o disparo de luz seja compatível com o ângulo de visão da câmera. Marque a alternativa indica a(s) afirmativa(s) CORRETA(S).', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I – II – III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'I – III – IV.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'II – III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'III.', 0);

    -- Módulo 12 (Flash), questão original Q32
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q32', N'É possível utilizar flash para fotografar durante o dia?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Não, o flash é um equipamento para ser usado somente a noite.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Não, porque as imagens capturadas ficam superexpostas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Sim, o flash é um equipamento indicado sempre que houver situação de pouca luz ou para amenizar sombras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Sim, mas só deve ser usado durante o dia em ambiente fechados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Sim, mas antes é necessário ajustar o foco da câmera no modo manual.', 0);

    -- Módulo 12 (Flash), questão original Q33
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q33', N'PADRÃO VUNESP Observe a figura Trata-se de um anel de ajuste de valores para obturador de uma câmera SLR, variando de B até 4000. O valor 250, em destaque, significa:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'velocidade máxima de obturação para congelar cenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'velocidade máxima de obturação para uso de películas ISO 400.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'velocidade mínima de obturação para o uso de grandes aberturas de diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'velocidade máxima de obturação para o uso de flash sincronizado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'velocidade mínima de obturação para o uso de películas em preto e branco.', 0);

    -- Módulo 12 (Flash), questão original Q34
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Flash - Q34', N'Em relação à sincronização e utilização de um flash, é CORRETO afirmar sobre o número guia (NG):', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'trata-se do ângulo de inclinação da câmera em relação ao objeto a ser fotografado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'leva em consideração a posição da câmera ao objeto, sendo irrelevante a posição do flash em relação ao objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'é o resultado da distância entre o flash e o objeto (em pés) vezes o número da abertura correta para exposição àquela distância.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'uma vez configurado o número guia, não há mais necessidade de reajustá-lo, mesmo que haja alteração de posição do objeto e/ou de flash.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q01', N'Para fins fotográficos, as fontes luminosas são classificadas a partir de sua temperatura medida em graus:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Farenheit;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Celsius;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Klein;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Weston;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Kelvin.', 1);

    -- Módulo 13 (Tipos de Luzes), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q03', N'O tipo de iluminação artificial usada para clarear as áreas de sombra e diminuir o contraste da iluminação na imagem é denominada:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'contraluz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'luz de preenchimento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'homogênea.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'high-key.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'luz Rembrandt.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q04', N'Em estúdio, ao fotografar pessoas utilizando apenas uma luz principal, o aspecto do retratado ficará com ar malévolo ou misterioso se o fotógrafo posicionar a fonte de iluminação:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Exatamente em cima da câmara.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Defronte à cabeça do fotógrafo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Atrás da cabeça do fotografado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Abaixo da cabeça do fotografado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Pouco acima da cabeça do fotografado.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q05', N'Qual é a principal fonte de luz natural na fotografia?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A luz polarizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Aquela emitida pelo sol.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Aquela refletida pelas nuvens.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Aquela que entra pelas janelas ou aberturas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Aquela refletida por rebatedores caseiros.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q06', N'Caracteriza-se como contraluz a imagem cuja luz está posicionada', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'por trás do motivo fotografado, direcionada para o fotógrafo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'entre o fotógrafo e o motivo fotografado, direcionada para o motivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'por trás do fotógrafo, direcionada para o motivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'acima do fotógrafo e entre este e o motivo apontado para baixo.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q07', N'Na linguagem usual do fotógrafo, uma luz “mais quente” é a que tem uma coloração', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'preta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'azul.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'vermelha.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'branca.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q08', N'Relacione os tipos de luzes aos efeitos visuais das imagens abaixo. Tipos de Luzes 1. Luz frontal. 2. Luz lateral. 3. Luz Rembrandt. 4. Contraluz. Efeito visual A alternativa que preenche corretamente os parênteses, da esquerda para a direita, é:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1 – 2 – 3 – 4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1 – 3 – 4 – 2.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'4 – 1 – 2 – 3.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'3 – 4 – 1 – 1.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'2 – 3 – 4 – 1.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q09', N'Um fotógrafo de publicidade escolheu um filme colorido de baixa sensibilidade para atender à demanda de um cliente fabricante de joias. Ao fotografar as peças em estúdio com esse filme, o profissional busca um suporte que lhe proporcione:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'usar várias fontes diferentes de luz sem necessidade de filtros de correção de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'produzir fotos granuladas e de tons pastéis, suavizando o brilho das joias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fotografar sem o uso de tripé em baixas condições de iluminação características do estúdio fotográfico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'produzir imagens com alto nível de detalhes e cores mais saturadas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'maior tolerância aos erros de exposição comuns ao flashmeter sob luz artificial.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q10', N'A luz é uma forma de energia radiante e elemento base da fotografia. Pode ser natural ou artificial e é importante tanto para a fotografia colorida quanto preto e branco. Sobre a luz, identifique as afirmativas a seguir como verdadeiras (V) ou falsas (F): ( ) A cor da luz do sol varia com o passar das horas: ao amanhecer e entardecer é alaranjada e nas horas centrais do dia é branca. ( ) Uma luz é suave ou dura conforme o predomínio de cores alaranjadas, azuladas ou brancas de uma cena a ser fotografada. ( ) O flash emite uma luz branca semelhante à luz solar, mas diferentemente desta não é instável nem difícil de regular. ( ) A melhor hora do dia para fotografar é próximo ao meio-dia, em dias ensolarados, em função da boa presença de luz nesses dias, que deixa as imagens com uma luminosidade suave. Assinale a alternativa que apresenta a sequência correta, de cima para baixo.', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'V – F – V – F.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'V – V – F – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'F – F – F – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'F – V – V – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'V – V – F – F.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q11', N'Uma fotografia é considerada contraluz quando a luz', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'lateral é mais suave que a luz frontal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'da frente do objeto é mais intensa que a luz de trás.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'está posicionada atrás do objeto fotografado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'está justaposta com a posição da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'está posicionada no topo do objeto fotografado.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q12', N'Em fotografia, pode-se trabalhar com luzes “duras” ou “suaves”. A variável que influi diretamente nesta qualidade da luz pode ser descrita como', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a intensidade da fonte emissora de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a temperatura de cor da fonte de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o tamanho da fonte de luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a relação entre o diafragma e a velocidade escolhidos para a execução da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o ISO mais alto ou mais baixo escolhido para a execução da imagem.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q13', N'Na fotografia de estúdio, temos alguns equipamentos de luz, que podem ser divididos em duas categorias: luz contínua e flash. Mas as variáveis para a construção da luz de uma cena é determinada pelos acessórios colocados e os posicionamentos de cada fonte de luz. Para conseguir um resultado de uma luz dura, em que exista um alto contraste de alta e baixa luz, devese fazer o uso de', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'um soft box lateral.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'luz rebatida em uma parede branca.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'um rebatedor de isopor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'um difusor em frente à fonte de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'luz direta sem nenhum difusor.', 1);

    -- Módulo 13 (Tipos de Luzes), questão original Q14
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q14', N'Para produzir fotos com muitas texturas, usam-se, principalmente, fontes de luz __________, enquanto, para se produzir fotos suaves e com pouco contraste, utiliza-se luz __________. As palavras que preenchem correta e respectivamente as lacunas da frase acima são', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'polarizada – direta', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'refletida – polarizada', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'amarelada – azulada', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'polarizada – suave', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'direta – difusa', 1);

    -- Módulo 13 (Tipos de Luzes), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q15', N'Podemos dizer que na fotografa a luz é o diferencial, a chamada “cereja do bolo” e, saber usá-la pode significar um bom resultado final em um trabalho fotográfico. Quase tudo que emite luz pode ser uma fonte de iluminação para uma imagem. I. A luz do sol é natural e se modifica ao longo do dia, em fotografa dizemos que, ela esta no ambiente e dela faz parte. II. É uma luz fraca (sol), que se modifica durante todo o dia, mas facilmente controlada através do diafragma. III. Uma luz dura é aquela que não incide diretamente no objeto fotografado, criando sombras de difícil correção. IV. A luz suave é aquela que gera sombras sem contornos definidos, dias ensolarados são um bom exemplo deste tipo de luz. V. O Flare é um defeito ótico causado quando o diafragma esta com defeito. Assinale a alternativa que apresenta as afirmativas incorretas:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'II, III, IV apenas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'II, III, IV, V apenas', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'III, IV, V apenas', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q16', N'Fazer retratos durante o dia, utilizando a luz natural do sol, pode ser tarefa árdua. Isso porque não há o controle total da iluminação como em um estúdio fotográfico, o que favorece o aparecimento de sombras. Contudo, a maneira mais indicada de suavizar as sombras projetadas no rosto da pessoa é feita através do uso de', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'difusor posicionado no lado oposto ao ponto de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'rebatedor dourado posicionado entre o modelo e o ponto de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'rebatedor prata posicionado entre o modelo e o ponto de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'rebatedor branco posicionado no lado oposto ao ponto de luz.', 1);

    -- Módulo 13 (Tipos de Luzes), questão original Q17
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q17', N'Segundo Michael Langford, a “qualidade” da luz pode ser classificada em dois grupos em função das sombras que elas projetam, com contornos “nítidos” ou “graduados”. Assinale a alternativa que corresponde à definição da “qualidade” da luz.', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Dramática ou natural.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Subexposta ou superexposta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Forte ou fraca.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Dura ou suave.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Intensa ou moderada.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q18', N'Segundo o guia completo de fotografia, qualquer material usado para dispensar e, portanto, suavizar a qualidade da iluminação de uma fonte de luz recebe o nome de:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'dispensador;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'difrator;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'extensor;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'difusor;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'filtro.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q19', N'Na grande maioria das câmeras fotográficas digitais, há duas possibilidades de controle de foco: manual e automático. Na prática, indique em quais situações o ajuste manual se torna mais eficiente que o automático?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Em situações de pouca iluminação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Em situações de grande contraste luminoso.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Com tempo de exposição inferior a 1/500 segundos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Com o uso de filtros polarizadores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Com o uso de iluminação de lâmpadas halógenas.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q20', N'A luz natural é composta por duas fontes diferentes de luz que produzem dois tipos diferentes de sombra, resultando-se em diferentes condições de contraste. A que fontes de luz refere-se o texto e qual as relações de sombra e contraste entre elas?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Luz solar: sombra definida e menor contraste. Luz do céu: sombra suave e maior contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Luz solar: sombra definida e maior contraste. Luz do céu: sombra suave e menor contraste.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Luz solar: sombra suave e maior contraste. Luz do céu: sombra definida e menor contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Luz solar: sombra suave e menor contraste. Luz do céu: sombra definida e maior contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Luz solar: sombra definida. Luz do céu: sombra suave. Não há alterações nas condições de contraste entre elas.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q21', N'Na fotografia, de acordo com a classificação do tipo de iluminação, a relação entre luz e sombra estabelece que:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'luz dura é uma qualidade da luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'luz suave ocorre quando luz e sombra são bem demarcadas, independente do objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'luz dura e luz suave relacionam-se ao direcionamento da luz no objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'luz suave é mais perceptível em cenas de contraluz.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q22
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q22', N'Sobre os Tipos de Luzes, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'luz inferior ou de foco inferior é a luz que chega de baixo, criando áreas de sombra bem suaves.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'luz de pino ou foco superior é a luz que está sobre o sujeito; pode ser direta ou indireta.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'luz a 90 graus é a luz que forma um ângulo reto com o sujeito, gerando sombras leves e suaves.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'no contraluz, a luz fica detrás do sujeito, não devendo, no entanto, ser dirigida na direção da câmera.', 0);

    -- Módulo 13 (Tipos de Luzes), questão original Q23
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q23', N'Considere as seguintes afirmações sobre iluminação natural: I. Durante uns instantes, depois do amanhecer e antes do anoitecer, o sol estará baixo, quase horizontal e produzirá sombras alargadas. Este tipo de luz dá relevo às texturas dos objetos e dramatiza as sombras. II. O sol alto nos dá uma Iluminação tipo "de pino" ou "de foco superior”, com as variantes correspondentes em verão e inverno. Caracteriza-se por gerar sombras geralmente largas e recortadas. Normalmente, há uma falta de relevo geral. III. Em dias nublados, o sol gera uma luz difusa, mas que pode gerar áreas de sombras bem marcadas, com alto contraste. É verdadeiro o que se afirma em', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I, II e III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'III apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'II e III apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I apenas.', 1);

    -- Módulo 13 (Tipos de Luzes), questão original Q24
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Luzes - Q24', N'Quanto à fonte da luz, podemos classificá-la em sua origem como:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Alta ou baixa', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Longa ou curta', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Natural ou artificial', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Reta ou curva', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Plana ou composta', 0);

    -- Módulo 14 (Filtros), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q01', N'Os filtros constituem-se de dispositivos de cristal óptico, vidro ou plástico, que em sua maioria podem ser acoplados a frente das objetivas e alguns em sua parte traseira. A função dos filtros é de alterar as características de uma imagem, seja para efetuar correções ou se criar efeitos especiais. Analise as afirmativas sobre as características e funcionalidades sobre um determinado filtro: Remove, muitas vezes em sua totalidade, reflexos indesejados de superfícies não metálicas, como água e vidro, por exemplo. Torna as cores mais saturadas e aumenta o contraste geral da cena fotografada. Assinale a alternativa correta sobre o exposto.', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'É característica e função do filtro de Polarizador', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'É característica e função do filtro Densidade Neutra', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'É característica e função do filtro Difusor', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'É característica e função do filtro Ultravioleta', 0);

    -- Módulo 14 (Filtros), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q02', N'O filtro polarizador pode ser utilizado em câmeras digitais para:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Retirar reflexos de superfícies metálicas como latarias de carros e objetos cromados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Retirar reflexos de superfícies não metálicas como água e vidro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Acentuar os reflexos da luz criando prismas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Aumentar o tempo de exposição em cenas com muita luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Reduzir o tempo de exposição em cenas com pouca luz.', 0);

    -- Módulo 14 (Filtros), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q03', N'Um dos meios de corrigir as condições de luz para obtenção de uma imagem fotográfica balanceada é a utilização de filtros. A coluna 1 apresenta os tipos de filtros e a coluna 2 os efeitos que são obtidos ao utilizá-los. Relacione as colunas 1 e 2 abaixo. Assinale a alternativa que apresenta as relações CORRETAS entre as colunas.', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I–B; II–C; III–D; IV–A', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'I–A; II–B; III–C, IV–D', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'I–C; II–A; III–B; IV–D', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I–D; II–B; III–A; IV–C', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I–C; II–D; III–B; IV–A', 0);

    -- Módulo 14 (Filtros), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q04', N'O uso do filtro close-up', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'auxilia no distanciamento da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'favorece a aproximação da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduz o azul excessivo da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'corrige as distorções da luz branca na imagem.', 0);

    -- Módulo 14 (Filtros), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q05', N'Materiais que são montados diante das objetivas para compensarem a dominância de luz são os:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Parasensores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Filtros.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Medidores de temperatura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Controladores focais.', 0);

    -- Módulo 14 (Filtros), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q07', N'Melhora o contraste e auxilia na saturação da foto. Evita ainda que partes muito claras da paisagem, como o céu, fique sem contraste. Contribui também para a diminuição do reflexo em áreas metálicas ou não metálicas, como água e vidro, além de possibilitar a riqueza de cores e seu detalhamento. Essas funções são do filtro', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'degradeé.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'polarizador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'cross-screen.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ultravioleta.', 0);

    -- Módulo 14 (Filtros), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q08', N'Os filtros polarizadores estão entre os de maior utilidade, especialmente para fotógrafos que usam câmeras digitais ou filmes coloridos. Qual o uso prático desse filtro?', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Melhorar a aberração cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Melhorar o fator cromático da luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Controlar a relação obturador X diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Corrigir os anéis de newton produzidos pela luz do sol.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Intensificar o azul do céu e eliminar reflexos de superfícies como vidros e água.', 1);

    -- Módulo 14 (Filtros), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q09', N'Sobre o filtro polarizador, considere os seguintes usos: 1. Eliminação de reflexos indesejados. 2. Aumento do contraste entre as áreas claras e escuras. 3. Aumento da quantidade de luz que chega até o plano focal. 4. Diminuição da entrada de luz, ainda que essa não seja sua função primordial. O filtro polarizador pode ser usado para:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1, 2 e 4 apenas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1, 2 e 3 apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1 e 3 apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'2 e 3 apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'3 e 4 apenas.', 0);

    -- Módulo 14 (Filtros), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q10', N'Como devem ser guardados os filtros?', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Devem ser guardados em caixas de papelão e limpos uma vez ao ano.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Devem ser guardados em latas de alumínio e limpos todos os dias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Devem ser guardados em estojos e limpos com frequência.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Devem ser guardados em locais com refrigeração.', 0);

    -- Módulo 14 (Filtros), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q11', N'PADRÃO VUNESP Na captação em filme, para eliminar ou diminuir reflexos indesejáveis em superfícies não-metálicas, deve-se usar na objetiva, o filtro:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'central focus.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'polarizador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'prismático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'difusor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'crosscreen.', 0);

    -- Módulo 14 (Filtros), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q12', N'Filtro amarelo, UV, filtros close-up, polarizador e ND são utilizados, respectivamente, para:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Escurecer o azul no P&B – bloquear raios ultravioletas – macrofotografia – eliminar reflexos – diminuir a entrada da luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Macrofotografia – bloquear raios ultravioletas – diminuir a entrada da luz – eliminar reflexos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Diminuir a entrada da luz – escurecer o azul no P&B – bloquear raios ultravioletas – macrofotografia – eliminar reflexos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Escurecer o azul no P&B – eliminar reflexos – macrofotografia – bloqueio de raios ultravioletas – diminuir a entrada da luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Eliminar reflexos – diminuir a entrada da luz – bloqueio de raios ultravioletas – macrofotografia – escurecer o azul no P&B.', 0);

    -- Módulo 14 (Filtros), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q13', N'Qual das afirmações abaixo melhor define a função do filtro polarizador.', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Produz uma difusão da nitidez, possuindo intensidades, cores e tonalidades variáveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Absorve parte da radiação cromática ultravioleta reduzindo a tonalidade azulada da neblina.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Seleciona o sentido de oscilação da luz eliminando parte da direção das reflexões.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Serve para aumentar a exposição em situações nas quais as condições de luz são excessivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Absorve o ultravioleta, o azul e parte do verde alem de ressaltar os amarelos e vermelhos, servindo para clarear céus muito azuis.', 0);

    -- Módulo 14 (Filtros), questão original Q14
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q14', N'Com o objetivo de minimizar os reflexos em água, o fotógrafo pode fazer uso de um filtro:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'UV', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ND', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Polarizador', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Skylight', 0);

    -- Módulo 14 (Filtros), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q15', N'PADRÃO VUNESP Entre inúmeros filtros disponíveis no mercado, aquele utilizado para atenuar a intensidade luminosa da cena em prol de uma correta exposição sem alteração do tempo de exposição, da abertura do diafragma e da temperatura de cor, é o filtro', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'de densidade neutra.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ultravioleta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'polarizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'cross screen.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'enhance.', 0);

    -- Módulo 14 (Filtros), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q16', N'ND, são filtros de densidade neutra, os comuns ND2, ND4 e, ND8, reduzem a quantidade de luz em ambientes muito iluminados. Em fotos de longa exposição, permitem aumentar o tempo de exposição. Sua coloração é:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Amarela', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Verde', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Cinza escuro', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Sépia', 0);

    -- Módulo 14 (Filtros), questão original Q17
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q17', N'Para se corrigir a distorção de cor em uma foto com filme para luz do dia (day light) sob uma fonte de luz incandescente deve-se usar um filtro:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'alaranjado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'azulado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'vermelho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'amarelo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'polarizador.', 0);

    -- Módulo 14 (Filtros), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q18', N'O filtro polarizador é também utilizado para eliminar reflexos em vidro ou água. Para que esse resultado seja alcançado, avalia-se o efeito no visor ou LCD', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'girando-se o filtro, permitindo a passagem da luz não polarizada, a imagem se tornará superexposta, tornando-se necessária a correção da exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'girando-se o filtro sobre a objetiva e, com isso, desfocando-se ao máximo os reflexos para que estes fiquem reduzidos ao mínimo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'sem a necessidade de se girar o filtro, mas compensando a exposição para que no registro da imagem os reflexos sejam reduzidos ao mínimo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sem a necessidade de se girar o filtro, permitindo a passagem da luz não polarizada, reduzindo reflexos e eliminando a compensação da exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'girando-se o filtro e bloqueando a passagem da luz do reflexo que já é polarizada, até que este fique reduzido ao mínimo.', 1);

    -- Módulo 14 (Filtros), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q19', N'Os filtros constituem-se de dispositivos de cristal óptico, vidro ou plástico, que em sua maioria podem ser acoplados a frente das objetivas e alguns em sua parte traseira. A função dos filtros é de alterar as características de uma imagem, seja para efetuar correções ou se criar efeitos especiais. Analise as afirmativas sobre as características e funcionalidades sobre um determinado filtro: Remove, muitas vezes em sua totalidade, reflexos indesejados de superfícies não metálicas, como água e vidro, por exemplo. Torna as cores mais saturadas e aumenta o contraste geral da cena fotografada. Assinale a alternativa correta sobre o exposto.', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'É característica e função do filtro de Polarizador', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'É característica e função do filtro Densidade Neutra', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'É característica e função do filtro Difusor', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'É característica e função do filtro Ultravioleta', 0);

    -- Módulo 14 (Filtros), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q20', N'O filtro polarizador é usado para', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'corrigir a temperatura de cor ambiente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'eliminar nuances avermelhadas do amanhecer/entardecer.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'deter os raios ultravioletas que podem provocar um “véu” em fotos de paisagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diminuir reflexos indesejados.', 1);

    -- Módulo 14 (Filtros), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q21', N'Para eliminar reflexos em superfícies de vidro, o fotógrafo profissional deve escolher o filtro:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'infra-vermelho;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ultra-violeta;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'densidade neutra;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'polarizador;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'skylight.', 0);

    -- Módulo 14 (Filtros), questão original Q22
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q22', N'Os filtros fotográficos agem no sentido de melhorar as imagens. Ao fotografar uma situação em movimento em um dia bastante ensolarado, quando há necessidade de congelar o objeto, o profissional pode optar por um filtro que tem como finalidade escurecer a cena, diminuindo a entrada de luz. Este filtro será o', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'de densidade neutra.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'polarizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'de ultra-violeta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'macro.', 0);

    -- Módulo 14 (Filtros), questão original Q23
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q23', N'Sendo necessário empregar-se em filtro óptico que transmita toda a cor do objeto a ser fotografado e que retenha as demais cores circundantes, que cor deverá ser esse filtro?', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Nenhuma cor será possível', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A inversa da cor do objeto', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A inversa das cores circundantes', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A mesma cor do objeto', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Ultra violeta U.V.', 0);

    -- Módulo 14 (Filtros), questão original Q24
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q24', N'Assinale a alternativa correta. Ao se obter fotografias com filme fotográfico colorido do tipo “luz do dia”, em ambientes iluminados artificialmente:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Recomenda-se a utilização de filtros de correção de temperatura de cor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Recomenda-se a utilização de filtros de subtração de temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Recomenda-se a utilização de filtros de adição de temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Recomenda-se a utilização de filtros de multiplicação de temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Não é necessário o uso de filtros.', 0);

    -- Módulo 14 (Filtros), questão original Q25
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q25', N'Dispensa-se com a utilização da câmera fotográfica digital que possua regulagem manual de graus KELVIN, com o objetivo do branco ser branco, o filtro', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'De correção de cor', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'De contraste', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Neutro', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Polarizador', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Close up', 0);

    -- Módulo 14 (Filtros), questão original Q26
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q26', N'Um filtro UV precisa', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Abrir dois pontos no diafragma', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Fechar dois pontos no diafragma', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Conservar a abertura prevista pelo fotômetro', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Conservar a abertura prevista pelo ampliador', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Observar o telêmetro', 0);

    -- Módulo 14 (Filtros), questão original Q27
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q27', N'Que artifício técnico possível deverá ser empregado, quando a qualidade da luz natural estiver fora dos valores estabelecidos pelo fabricante de um determinado filme colorido?', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Operar com menor tempo de obturador', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Não operar o registro fotográfico', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Operar com emprego de filtro correto', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Operar com maior abertura do diafragma', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Operar normalmente', 0);

    -- Módulo 14 (Filtros), questão original Q28
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Filtros - Q28', N'No que diz respeito a filtro de densidade neutra (ND), é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'é utilizado para diminuir reflexos e brilhos; deve ser girado até que detenha os reflexos e brilhos indesejáveis. Com ele se obtém uma imagem mais pura, com cores mais saturadas nas áreas onde havia reflexos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'é utilizado para suavizar as sombras e as linhas de contorno da imagem; atenua pequenos defeitos em um rosto, deixa menos visíveis rugas e linhas marcantes em retratos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'diminui a quantidade de luz que entra pela objetiva; é necessário quando há luz em excesso, como por exemplo, a luz do sol direta.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'é utilizado para conferir à imagem um efeito de neblina natural, porque cria uma aura ao redor dos pontos de luz.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q01', N'Quando se fotografa com câmeras digitais SLR (single lens reflex), o equilíbrio de branco (isto é, a temperatura de cor) da imagem normalmente é calculado automaticamente pela câmera. Ela ajusta a temperatura da cor de acordo com o tipo de iluminação sob o qual o fotógrafo está fotografando. Em relação a temperatura de cor para medição do balanço de branco, assinale a alternativa que apresenta qual a medida de grandeza física utilizada para tais configurações de temperatura.', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Celsius (ºC)', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Kelvin (K)', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Fahrenheit (ºF)', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Hertz (Hz)', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q03', N'Como se denomina o instrumento utilizado para medir a temperatura de cor na fotografia?', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Voltímetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Fotômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Kelvinômetro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Espectrômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Termômetro.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q04', N'O balanço de branco é o ajuste necessário:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'para corrigir os valores de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'para corrigir a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'para acentuar as aberrações cromáticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'no equipamento fotográfico digital, da temperatura de cor da fonte de luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'acentuar, no equipamento fotográfico digital, a saturação das cores da fonte de luz.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q05', N'Considere que um fotógrafo, ao registrar uma festa de carnaval na rua às 16:00 em um dia ensolarado, notou que as fotos ficaram azuladas. Nesse contexto e considerando o balanço de branco de uma imagem digital, analise as afirmativas a seguir. I. O balanço de branco estava regulado para luz tungstênio (3 200 K), e a iluminação do ambiente era de neutros. II. O fotógrafo mediu a luz no ponto errado, resultando em fotos subexpostas com cores distorcidas. III. O balanço de branco estava regulado para luz dia (5 000 K), e a iluminação era azulada. Está(ão) correta(s) a(s) afirmativa(s)', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I, apenas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'II e III, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'I e III, apenas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I, II e III.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q06', N'Temperatura de cor expressa a aparência da cor da luz emitida pela fonte. A sua unidade de medida é representada pela letra:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'C', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'F', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'K', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'X', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Y', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q08', N'Nas câmeras digitais é possível fazer correções de temperatura de cor para que não aconteçam distorções de cor nas fotografias possibilitando imagens com tonalidades neutras de cor. Qual é o recurso utilizado nas câmeras digitais para esta finalidade?', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Ajuste de matiz e saturação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Formato de arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Modo de medição de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'White balance ou balanço de branco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Bracketing.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q09', N'PADRÃO VUNESP Uma folha de papel branca, iluminada pelo sol, é fotografada por uma câmera digital com o ajuste de white balance em modo “incandescente”. A imagem resultante terá a predominância da seguinte cor:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'vermelho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'magenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'verde.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'amarelo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'azul.', 1);

    -- Módulo 15 (Balanço de Branco), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q11', N'Algumas câmeras digitais possuem um ajuste de cor conforme a temperatura da cor ambiente. Assinale a alternativa CORRETA que retrata tal recurso.', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Flash low-synch (sincronização lenta).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Display LCD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'White-balance (balanço de branco).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Estabilizador de imagem.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q12', N'Ao fotografar uma sala com as seguintes condições de luz: lâmpadas incandescentes no teto, um abajur e uma luz natural que entra direto da janela lateral, a fotografia ficou com uma “invasão“ de azul devido à regulagem:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'de balanço de branco para a luz de tungstênio.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'do diafragma, muito aberto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'do obturador com uma velocidade muito baixa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'de balanço de branco para luz do dia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'do diafragma, muito fechado.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q13', N'Durante o período em que a fotografia foi produzida em base fílmica, ou seja, no formato analógico, os fotógrafos escolhiam os tipos de filme decorrente de sua paleta de cores e granulação. Após a passagem da fotografia para o formato digital, estas escolhas passaram a ser definidas diretamente nas câmeras fotográficas. Os recursos a serem acessados pelo fotógrafo na câmera fotográfica digital que permitem o ajuste da paleta de cores e da granulação são:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO e tamanho da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'balanço de branco e ISO.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'balanço de branco e formato de arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO e obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'diafragma e obturador.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q15', N'A luz tem variações de intensidade e direção. Para medir a luz incidente, usamos um aparelho que nos indicará qual velocidade do obturador e qual diafragma, com base no ISO (sensibilidade), devemos usar para capturar a imagem com a luminosidade correta. Qual o nome desse aparelho?', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Nomógrafo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Cartão Cinza.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Kelvinômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Fotômetro de mão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Fotômetro TTL (Through The Lens).', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q18', N'Observe as imagens a seguir. Todas as três imagens, “A", “B" e “C", foram registradas no mesmo horário do dia, com a diferença de poucos segundos entre um registro e outro. A temperatura de cor da luz do dia, naquele instante, era de 5500 K e, no momento em que a imagem “A" foi capturada, a temperatura de cor configurada na câmera foi de 5500 K. Visto o diminuto intervalo de tempo entre o registro de uma imagem e outra, e a inocorrência de uma mudança significativa na luz do dia, quais as mudanças de configuração efetuadas na câmera para que os resultados em “B", e em “C", fossem, respectivamente, obtidos?', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Em “B", a câmera foi configurada em uma temperatura de cor acima de 5500 K, pois se nota a predominância da “tonalidade fria" do azul. Em “C", a câmera foi configurada em uma temperatura de cor abaixo de 5500 K, pois se nota a predominância da “tonalidade quente" do vermelho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'As três imagens são registradas sob a mesma configuração de temperatura de cor, mas em “B" tem-se uma sobreposição em relação a “A", prevalecendo a transmissão das ondas eletromagnéticas de maior frequência (azul), e, em “C", uma subexposição em relação a “A", prevalecendo a transmissão das ondas de menor frequência (vermelho).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Em “B", a câmera foi configurada em uma temperatura de cor abaixo de 5500 K, fazendo com que a câmera “entendesse" como necessária a atenuação da predominância da “tonalidade quente" do vermelho. Em “C", a câmera foi configurada em uma temperatura de cor acima de 5500 K, fazendo com que a câmera “entendesse" como necessária a atenuação da predominância da “tonalidade fria" do azul.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As três imagens são registradas sob a mesma configuração de temperatura de cor, mas em “B" tem-se a utilização, na câmera, de um filtro de conversão âmbar (série Wratten 85), e, em “C", a utilização, na câmera, de um filtro de conversão azul (série Wratten 80).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Nas câmeras digitais (DSLR), não há a possiblidade de mudança na configuração da temperatura de cor, pois esta configuração já é definida pelo fabricante e não permite alterações.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q19', N'Assinale a alternativa que completa CORRETAMENTE as lacunas do seguinte trecho: “Uma das características da luz é a temperatura de cor, que determina a cor na fotografia. A luz de tungstênio e a luz de flash apresentam cores _____________ e ___________, respectivamente, pois possuem temperaturas de cor em torno de ______ e _____ graus Kelvin.”', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'branca / azul / 5500 / 3000', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'amarela / branca / 3000 / 5500', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'azul / branca / 8000 / 5500', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'branca / alaranjada / 5500 / 3000', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q20', N'Analise as afirmativas a seguir: I. Nas câmeras reflex, é possível controlar manualmente o balanço de brancos, conferindo, assim, uma imagem mais genuína às fotografias. De acordo com o objetivo e o gosto pessoal do fotógrafo, é possível “aquecer” ou “esfriar” o balanço de cores da imagem, conferindo-lhe tonalidades diferentes. II. As lentes zoom possuem distância focal fixa e única, sendo por isso muito versáteis e práticas por nos possibilitar fazer vários tipos de enquadramento com um único equipamento. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q21', N'A escala “temperatura de cor" expressa', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a predominância de determinadas frequências na emissão de luz correspondente ao espectro de luz visível. A unidade de medida é o grau Kelvin.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'as diferentes cargas de energia elétrica geradas por um potenciômetro (dimmer) no acionamento de um refletor de luz artificial. A unidade de medida é o Watt.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'os diferentes níveis de energia térmica gerados pelas lâmpadas incandescentes sob diferentes cargas de potência elétrica. A unidade de medida é o grau Celsius.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a variação em consumo de energia por unidade de tempo para diferentes fontes de iluminação, desde lâmpadas de tungstênio a lâmpadas de HMI. A unidade de medida é o Quilowatt/hora.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a sensação psicológica transmitida pela cor. Cores quentes, que nos transmitem a sensação de calor e aconchego, têm maior temperatura de cor. Cores frias, que nos transmitem a sensação de isolamento e frio, têm menor temperatura de cor. A unidade de medida é o QE.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q22
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q22', N'Em fotografia, a combinação de comprimentos de ondas com diferentes tipos de luz é mensurada em termos de temperatura de cor, utilizando-se para isso a escala Kelvin. Em termos gerais, pode-se dizer que as temperaturas de cor da luz de tungstênio, da luz do flash eletrônico e da luz de um céu encoberto correspondem, respectivamente, a', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'5600 K, 8000 K, 3200 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'3200 K, 5600 K, 8000 K.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'5600 K, 3200 K, 8000 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'3200 K, 8000 K, 5600 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'8000 K, 5600 K, 3200 K.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q23
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q23', N'PADRÃO VUNESP Partindo-se do pressuposto que todas as três imagens foram captadas sob a mesma condição de luz e com apenas o intervalo de 01 minuto entre elas, e que durante o registro da imagem “B” o fotógrafo procedeu ao ajuste de white balance (balanceamento do branco), em graus Kelvin, para aquela condição de luz, pode-se concluir:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a foto “C” foi registrada com ajuste do valor de white balance, em graus Kelvin, superior à foto “B”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a foto “B” foi registrada com ajuste do valor de white balance, em graus Kelvin, superior à foto “A”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a foto “A” foi registrada com ajuste do valor de white balance, em graus Kelvin, inferior à foto “B”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a foto “B” foi registrada com ajuste do valor de white balance, em graus Kelvin, inferior à foto “C”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a foto “A” foi registrada com ajuste do valor de white balance, em graus Kelvin, superior à foto “B”.', 1);

    -- Módulo 15 (Balanço de Branco), questão original Q24
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q24', N'PADRÃO VUNESP Diferentes fontes de luz geram diferentes temperaturas de cor com diferentes preponderâncias cromáticas. Levando-se em conta o espectro eletromagnético para a luz visível, pode-se observar, de maneira comparativa, a seguinte predominância tonal para refletores com lâmpadas de tungstênio e refletores com lâmpadas HMI, respectivamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'tom acinzentado e tom esbranquiçado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'tom acinzentado e tom alaranjado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'tom alaranjado e tom azulado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'tom esbranquiçado e tom acinzentado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'tom azulado e tom alaranjado.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q26
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q26', N'A cor sempre foi uma questão importante para a fotografia. Em relação às variações cromáticas que a fotografia digital pode ter, é CORRETO afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a mudança de temperatura da luz é uma das grandes responsáveis pelas alterações de cores nas fotos. Uma regulagem errada pode ocasionar uma foto mais amarelada ou mais azulada, por exemplo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o ajuste balanço de branco (WB) considera uma superfície branca para colorir objetos brancos com cores não reais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'uma fotografia utilizada em site deve estar no formato CMYK, enquanto a mesma utilizada em uma revista impressa deve estar em modo RGB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do ponto de vista da fotografia, quanto mais fria uma cor, mais azulada ela será.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'as aberrações cromáticas não podem ser corrigidas com o uso de filtros, pois são decorrentes de uma alteração no ajuste da câmera.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q27
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q27', N'O conceito de temperatura de cor diz respeito à tonalidade de cor assumida por uma fotografia dependendo da fonte de luz com a qual ela é feita. Tal temperatura de cor é medida em uma escala de graus Kelvin (K), sendo que cada fonte de luz (natural ou artificial) possui uma temperatura de cor específica responsável por tonalidades diferenciadas nas fotos. Assinale a alternativa que apresenta informação correta a respeito da temperatura de cor das fontes de luz.', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Lâmpada incandescente de tungstênio – temperatura de cor de 5500K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Luz do sol no final de tarde – temperatura de cor de 7000K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Luz do sol ao meio dia sem nuvens no céu – temperatura de cor de 2500K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Lâmpada de flash eletrônico – temperatura de cor de 5500K.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Luz de vela – temperatura de cor de 10.000K.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q28
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q28', N'A partir de sua resposta na questão anterior qual seria a tonalidade de cor predominante nesta fonte de luz?', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Branca.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Verde.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Amarela.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Azul.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Vermelho.', 0);

    -- Módulo 15 (Balanço de Branco), questão original Q29
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Balanço de Branco - Q29', N'Analise as afirmativas a seguir: I. O balanço de brancos permite controlar a luz que entra na câmera fotográfica. Ou seja, a temperatura da cor. Atualmente, a maior parte das câmeras fotografias, sejam elas digitais ou reflex, possuem um programa automático de controle do balanço de brancos. II. Em uma câmera, depois da resolução, o fator mais importante a ser levado em consideração é a lente. Para tirar boas fotos, a câmera deve ter lentes de qualidade, o que significa que devem ser feitas de plástico, nada de vidro. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Módulo 16 (Histograma), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Histograma - Q01', N'As câmeras digitais possuem meios para visualizar e avaliar imediatamente a imagem realizada. Um dos recursos disponíveis para esta avaliação é capaz de informar a respeito da qualidade da imagem e possibilitar, inclusive, seu ajuste. Assinale a alternativa que identifica e apresenta CORRETAMENTE este recurso.', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O histograma é visualizado apenas no monitor do computador, onde é possível identificar os valores luminosos da imagem fotográfica arquivada no cartão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O LCD é o responsável pela visualização da imagem fotográfica e determina a sua correção de forma rápida, sempre que for necessário.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O CCD é constituído de milhões de células fotoelétricas, dispostas em formato de grade, capazes de reter e modificar as imagens tomadas pela câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O CMOS possibilita reter as imagens tomadas pela câmera e retocá-las por meio de programas integrados, com a vantagem de consumir pouca energia', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O histograma é constituído de um sistema gráfico-estatístico capaz de demonstrar e possibilitar a alteração das características da imagem tomada pela câmera', 1);

    -- Módulo 16 (Histograma), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Histograma - Q02', N'A representação gráfica que mostra os números relativos de um intervalo de valores entre as sombras e as altas luzes é chamada de', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'histograma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'bandagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'interpolação.', 0);

    -- Módulo 16 (Histograma), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Histograma - Q03', N'Observe o esquema a seguir. Trata-se de um sistema cartesiano de coordenadas ortogonais que determina o Histograma de uma imagem digital, onde duas variáveis, x e y, são avaliadas e mensuradas. Essas variantes são, respectivamente, para x e y:', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'quantidade de pixels na imagem; escala tonal dividida, em ordem crescente, em tons escuros, médios e claros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'representação gráfica da imagem, onde se situam as áreas de maior resolução espectral; quantidade de pixels na imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'representação gráfica da imagem, onde se situam as áreas de maior contraste; escala tonal dividida, em ordem crescente, em tons escuros, médios e claros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'escala tonal dividida, em ordem crescente, em tons escuros, médios e claros; quantidade de pixels na imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'quantidade de pixels na imagem; determinação de profundidade de campo com o centro representando a maior área em foco.', 0);

    -- Módulo 16 (Histograma), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Histograma - Q04', N'Assinale a alternativa que completa corretamente o fragmento a seguir. Compreender o que são e como funcionam os histogramas é importante para quem vai trabalhar com imagens digitais. Por isso, os fotógrafos devem saber que _____', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o histograma é a representação de várias fotos obtidas analogicamente e gravadas num CD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'para encontrar o histograma, calcula-se o tamanho do arquivo e o ângulo de captura da foto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o histograma fica na objetiva e só pode ser visualizado quando o arquivo é baixado no computador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o histograma representa a relação entre o obturador e o foco de uma imagem analógica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o histograma é uma representação gráfica e estatística, visualizada em máquinas digitais, que mostra se a imagem foi exposta corretamente.', 1);

    -- Módulo 16 (Histograma), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Histograma - Q05', N'PADRÃO VUNESP Grande parte das câmeras fotográficas digitais oferece uma representação gráfica, instrumento de avaliação, tanto antes como depois da exposição e do registro da imagem. A representação gráfica a que se refere o enunciado é', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a curva característica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o diagrama de representação cromática (CIE).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o histograma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a curva logarítmica da exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a curva sensitométrica.', 0);

    -- Módulo 16 (Histograma), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Histograma - Q06', N'PADRÃO VUNESP Com a exibição do gráfico mencionado na questão anterior, o fotógrafo é capaz de verificar', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a distribuição da intensidade luminosa nas áreas de baixa iluminação, sugerindo o uso de um diafragma de menor diâmetro como compensação da exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a distribuição dos pixels ao longo dos valores da escala tonal da imagem, permitindo avaliar as condições de exposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a distribuição da intensidade luminosa nas áreas de baixa iluminação, permitindo a avaliação da melhor exposição por meio do uso de fotômetro manual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a latitude de exposição do sensor e qual filtro de correção cromática é necessário.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a distribuição da intensidade luminosa por toda a imagem, destacando-se somente as áreas de alta e baixa iluminação.', 0);

    -- Módulo 16 (Histograma), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Histograma - Q07', N'O histograma é um gráfico que mostra os diversos níveis de luminosidade de uma imagem e a quantidade de pixels presentes em cada um desses níveis. Precisamos entender antes o comportamento de um pixel em uma imagem e como ele é mostrado no histograma. O brilho de um pixel é determinado por um número que vai de 0 a 255. Com base nisso, podemos afirmar que no histograma:', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O pixel pode variar do 0 (branco absoluto) até 128 (cinza absoluto) da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O pixel pode variar do 0 (branco absoluto) até 255 (preto absoluto) da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O pixel pode variar do 0 (preto absoluto) até 255 (branco absoluto) da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O pixel pode variar do 0 (branco absoluto) até 255 (cinza absoluto) da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O pixel pode variar do 0 (cinza absoluto) até 255 (branco absoluto) da imagem.', 0);

    -- Módulo 16 (Histograma), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Histograma - Q08', N'Observando-se o histograma da figura 4, pode-se afirmar que a imagem nela representada está', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'muito clara.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'desfocada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'em preto e branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'em formato JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'subexposta.', 1);

    -- Módulo 16 (Histograma), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Histograma - Q09', N'Assinale a alternativa que corresponde ao termo correto para completar o espaço em branco da seguinte afirmação: “O __________ ilustra como os pixels em uma imagem são distribuídos em cada nível de intensidade de cor. Ele mostra se a imagem contém detalhes nas sombras, nos tons médios e nos realces para realizar uma boa correção”. (Martins, 2010)', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'histograma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'pixel.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'photoshop.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'dodging.', 0);

    -- Módulo 17 (Impressão), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q01', N'Quando se pensa em uma imagem fotográfica impressa, necessariamente é preciso pensar na sua qualidade. Quando temos uma imagem fotográfica impressa, seja por qual processo for, utiliza-se como referência a unidade de medida DPI (Dots Per Inch ou Pontos por polegadA). Em relação a imagem para que seja considerada uma impressão com qualidade fotográfica, assinale a alternativa que apresenta quantos DPI a imagem deve ter.', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'72 DPI', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'150 DPI', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'200 DPI', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'300 DPI', 1);

    -- Módulo 17 (Impressão), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q02', N'O termo “resolução de imagem” é utilizado, no senso comum, para diversas finalidades. Porém, a resolução de uma imagem digital é diferente da resolução de uma imagem impressa. Os termos que correspondem à expressão da resolução da imagem digital e da imagem impressa, respectivamente, são', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'DPI − PPI.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Pixels − PPI.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'PPI − Pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'PPI − DPI.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'DPI − Pixels', 0);

    -- Módulo 17 (Impressão), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q03', N'Em relação aos “pixels por polegada” (ppi) de uma imagem fotográfica, é correto afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Quanto maior seu número, maior o tamanho da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Quanto maior seu número, menor o tamanho da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Quanto maior seu número, maior a qualidade da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Quanto maior seu número, menor a qualidade da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A alteração de seu número não interfere sobre a qualidade da imagem.', 0);

    -- Módulo 17 (Impressão), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q04', N'Em uma coletiva de imprensa, um parlamentar é fotografado por dois profissionais distintos. As fotos serão impressas em uma revista. Um fotógrafo registrou suas imagens em formato JPEG com resolução 72 ppi no tamanho 10 × 15 cm, já o segundo fotógrafo registrou em formato JPEG com resolução 300 ppi também no tamanho 10 × 15 cm. O resultado de impressão de ambas as imagens no tamanho 10 × 15 cm será, respectivamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'foto nítida; foto nítida.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'foto nítida; foto não visível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'foto pouco nítida; foto nítida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'foto não visível; foto pouco nítida.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'foto visível: foto nítida.', 0);

    -- Módulo 17 (Impressão), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q05', N'Ajustar a resolução para produzir fotografias digitais é importante para:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Ter fotografias mais coloridas e com mais contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Poder revelar em laboratórios em processo químico preto e branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Manter o sensor sempre limpo e livre de impurezas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Guardar corretamente as fotos em unidades de disco externos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Produzir arquivos de tamanho adequado para o fim pretendido, internet, impressão ou ampliação fotográfica.', 1);

    -- Módulo 17 (Impressão), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q06', N'Podemos afirmar que um arquivo digital com 1280 X 960 de 01 megapixel pode ser usado para a ampliação com qualidade foto para o tamanho:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A3.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'10cm X 15cm.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'13cm X 18cm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'20cm X 25cm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'20cm X 30cm.', 0);

    -- Módulo 17 (Impressão), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q07', N'Um arquivo de foto com dimensões 2848×4272 pixels pode ser impresso em boa qualidade, numa saída de 300 dpi, com o máximo de aproximadamente quantos centímetros ?', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'12×36 cm', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'24×36 cm', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'28×42 cm', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'36×54 cm', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'54×96 cm', 0);

    -- Módulo 17 (Impressão), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q08', N'O cálculo da resolução de uma imagem digital tem como base a:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sensibilidade do ISO utilizado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'tecnologia do sensor da câmera fotográfica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'quantidade de elementos óticos da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'quantidade de pixels em milímetros quadrados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'multiplicação de pixels da linha horizontal pelos pixels da linha vertical.', 1);

    -- Módulo 17 (Impressão), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q09', N'Uma imagem com resolução de 300 dpi tem boa qualidade para impressão. Para imprimir uma imagem no tamanho 20cm por 25cm, qual a resolução mínima em pixels na horizontal e vertical precisa ter o meu arquivo digital para que eu obtenha uma impressão com qualidade de foto?', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1280 x 960', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1600 x 1200', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'2048 x 1536', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'2240 x 1680', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'2560 x 1920', 1);

    -- Módulo 17 (Impressão), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q10', N'Assinale a alternativa que corresponde ao termo correto para completar o espaço em branco da seguinte afirmação: “Uma imagem digital é formada por ______________, que são os elementos formadores da imagem”. (Trigo, 2010)', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fótons.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'grãos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'pixels.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'bits.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'cores.', 0);

    -- Módulo 17 (Impressão), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q11', N'A fotografia é definida como um processo pelo qual uma imagem, sob a ação da luz, atravessa uma objetiva e é gravada sobre uma película sensível em placa no interior de uma câmara escura. Quanto à cor de uma fotografia, é correto dizer que ela é formada pela relação entre as luzes do espectro: vermelho (R), verde (G) e azul (B). Juntas, essas cores formarão boa parte das cores que podem ser percebidas pelo olho humano. Já no processo de impressão de uma imagem, a sigla RGB (vermelho, verde e azul) é convertida em', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'VAAP – vermelho, azul, amarelo e preto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'AAVP – azul, amarelo, vermelho e preto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'CMYK – azul ciano, amarelo, magenta e preto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'BLS – brilho, luz e saturação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'VAA – vermelho, amarelo e azul.', 0);

    -- Módulo 17 (Impressão), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q12', N'Em relação às imagens digitais, analise as assertivas que seguem. I. As imagens digitais são formadas por unidades conhecidas como pixel. II. Ao digitalizar uma imagem se recomenda utilizar a alta resolução, para depois adaptar a imagem ao tamanho desejado. III. Para a internet ou apresentação na tela, a imagem deve ter 72 DPI. IV. Para impressões que necessitem de mais definição sugere-se utilizar a imagem com 300 DPI. Quais estão corretas?', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apenas I.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas I e II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas II e III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas II e IV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I, II, III e IV.', 1);

    -- Módulo 17 (Impressão), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q13', N'Considere como suficiente para a impressão a resolução de 300 dpi. Quais as dimensões em pixels que uma imagem deve ter para se permitir a impressão em formato 20 cm x 30 cm?', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'480 x 920 pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'200 x 300 pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'240 x 360 pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'4800 x 9200 pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'2400 x 3600 pixels.', 1);

    -- Módulo 17 (Impressão), questão original Q14
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q14', N'Quando se pensa em uma imagem fotográfica impressa, necessariamente é preciso pensar na sua qualidade. Quando temos uma imagem fotográfica impressa, seja por qual processo for, utiliza-se como referência a unidade de medida DPI (Dots Per Inch ou Pontos por polegada). Em relação a imagem para que seja considerada uma impressão com qualidade fotográfica, assinale a alternativa que apresenta quantos DPI a imagem deve ter.', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'72 DPI', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'150 DPI', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'200 DPI', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'300 DPI', 1);

    -- Módulo 17 (Impressão), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q15', N'Assinale a alternativa que apresenta qual é a Relação entre a Qualidade da Imagem e o Número de Pixels:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Uma imagem com alta resolução terá menos pixels, menos detalhes e definição', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Menores sensores de imagem produzem maior número de pixels que por sua vez irão gerar imagens digitais de melhor qualidade', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A qualidade da imagem é diretamente proporcional ao número de pixels que forma a imagem', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O pixel é a unidade de medida para imagens digitais e análogicas', 0);

    -- Módulo 17 (Impressão), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q16', N'A imagem digital capturada pelo substrato no equipamento fotográfico digital e relativo à resolução é formada por', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'DPls', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Pixels', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'CCls', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'CCDs', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO', 0);

    -- Módulo 17 (Impressão), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q18', N'Em relação à câmera fotográfica digital, é correto afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Uma câmera de 8 mega pixels permite imagens de maior qualidade do que uma de 5 mega pixels.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Uma câmera de 3 mega pixels permite imagens de maior qualidade do que uma de 5 mega pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A qualidade das imagens produzidas depende do programa que, usualmente, acompanha a câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A qualidade de uma imagem depende de sua maior ou menor capacidade de armazenamento de dados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Suas dimensões relacionam-se diretamente à sua capacidade de armazenamento de imagens.', 0);

    -- Módulo 17 (Impressão), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Impressão - Q21', N'A publicação de uma imagem requer alta resolução, se esta for para utilização em:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Banner', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Publicação impressa', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Monografa', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Redes Sociais', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q01', N'A fotografia 35 mm está baseada no formato de um fotograma de dimensões 24 × 36 mm. Nas câmeras digitais de formato 35 mm há diferentes modelos com sensores com dimensões distintas. Essa característica modifica a relação das objetivas utilizadas no equipamento, ou seja, uma objetiva colocada em uma câmera com sensor de dimensões 16 × 24 mm irá reproduzir uma imagem em um ângulo de visão diferente quando comparada com uma câmera com sensor 24 × 36 mm. O ângulo de visão de uma objetiva 50 mm colocada em uma câmera de sensor 16 × 24 mm é', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'50 mm', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'70 mm', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'90 mm', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'40 mm', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'55 mm', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q02', N'São componentes diferenciadores da câmera digital em relação à analógica:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Gravação em CCD, pixels, cartão de memória, scanners.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Gravação em CCD, pixels, filme, cartão de memória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Gravação em CCD, pixels, monitor de LCD, cartão de memória.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Gravação em CCD, pixels, cartão memória, negativo, ASA.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Pixels, ampliador, gravação em CCD, cartão de memória.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q03', N'Câmeras analógicas e câmeras digitais têm praticamente a mesma função, ou seja, registram uma cena por meio da energia da luz sobre um material sensível. Com relação às câmeras digitais, considere as seguintes afirmativas: 1. Nas câmeras digitais, o filme é substituído por um fotossensor, também chamado de CCD, sensível à luz e que permite a conversão da luz em cargas elétricas que transformam a informação analógica em digital. 2. Nas câmeras digitais, a resolução da foto é medida em pixel. Quanto maior o número de pixels, maior a qualidade da imagem. 3. Câmeras digitais podem ter zoom ótico e zoom digital. Câmeras com zoom digital apresentam melhor qualidade de imagem quando se faz um zoom, pois esse recurso é formado pelas próprias lentes da câmera. 4. Não há necessidade de se preocupar com o controle de sensibilidade (ISO) em câmeras digitais. Esse elemento só é relevante para analógicas, pois estas usam filmes com diferentes sensibilidades. Assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Somente a afirmativa 3 é verdadeira.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Somente as afirmativas 1 e 2 são verdadeiras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Somente as afirmativas 1, 3 e 4 são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Somente as afirmativas 2 e 4 são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'As afirmativas 1, 2, 3 e 4 são verdadeiras.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q04', N'Em relação às câmeras digitais, analise as afirmativas a seguir. I. Em vez de filme fotográfico, a câmera digital converte os sinais luminosos em pixels. II. A câmera digital tem um sensor CMOS, que consiste em uma grade de transistores fotográficos que detectam a intensidade da luz ao longo do plano de foco. III. Os sensores CMOS são um pouco diferentes dos sensores CCD por utilizarem menos energia e terem outro tipo de material de detecção de luz. Assinale:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'se somente a afirmativa I estiver correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'se somente a afirmativa III estiver correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'se somente as afirmativas I e II estiverem corretas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'se somente as afirmativas I e III estiverem corretas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'se todas as afirmativas estiverem corretas.', 1);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q05', N'Ao longo dos avanços tecnológicos, a formação das imagens permanece a mesma. A mudança está no suporte no qual a imagem se forma. Sendo assim, a diferença fundamental entre o processo analógico fotográfico e o processo digital fotográfico está', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'no tipo de sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'em que um é químico e o outro é eletro/eletrônico.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'na capacidade de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'na sensibilidade do filme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'no ajuste da profundidade de campo.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q06', N'PADRÃO VUNESP Em fotografia digital, o número de pixels de um sensor corresponde', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao número de pixels dispostos na diagonal da área do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao número de pixels dispostos na horizontal multiplicado pelo número de pixels dispostos na vertical do sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao número máximo da sensibilidade em ISO alcançada pelo sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao mesmo número de grãos de haletos de prata dispostos aleatoriamente no fotograma fotoquímico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao número de pixels dispostos na horizontal dividido pelo número de pixels dispostos na vertical do sensor.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q07', N'O que significa o termo “full frame” (quadro cheio) para as câmeras fotográficas DSLR?', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Câmera equipada com sensor de formato quadrado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Câmera equipada com sensor de formato retangular.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Câmera equipada com sensor de formato circular.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Câmera equipada com sensor de 24 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Câmera equipada com sensor de 35 mm.', 1);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q08', N'PADRÃO VUNESP Nas câmeras SRL (single lens reflex), a imagem é formada sobre uma emulsão fotoquímica gerando a imagem latente; nas câmeras DSLR (digital single lens reflex), a emulsão fotoquímica foi substituída pelo', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'LCD (liquid cristal display).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'despolido.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'cartão de memória', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'view-finder.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q09', N'Assinale a alternativa que corresponde aos termos corretos para completar os espaços em branco da seguinte afirmação: “A grande maioria das câmeras digitais opera com profundidade de bits de 8 bits para cada canal RGB. Isso significa ______ tons de vermelho, ______ tons de verde, ______ tons de azul, que podem ser combinados na formação da imagem”. (Trigo, 2010)', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'256 / 256 / 256.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'16.700.000 / 16.700.000 / 16.700.000.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'32 / 32 / 32.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1.064 / 1.064 / 1.064.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'16.000 / 16.000 / 16.000.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q10', N'Na era da fotografia analógica, após o clique do fotógrafo, as imagens eram arquivadas na película, ainda na máquina fotográfica. Na era digital, as imagens são gravadas no', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sensor eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'banco de metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'cartão de memória.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'display de cristal líquido.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q11', N'Nas imagens digitais, cada ponto é chamado pixel, uma contração de picture element. O termo megapixel equivale a:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'100 mil pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'10 mil pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1 mil pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1 milhão de pixels.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1 bilhão de pixels.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q12', N'Assinale a alternativa que competa corretamente o fragmento a seguir. Quando o sensor de uma câmera digital não é full frame, as objetivas _________', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'tornam-se mais luminosas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'tornam-se proporcionalmente mais longas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'não sofrem qualquer alteração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'tornam-se proporcionalmente mais curtas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'tornam-se menos luminosas.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q13', N'As câmeras digitais do tipo compacto já agregam tecnologias importantes, como objetivas com recursos de zoom. Sobre os tipos de zoom oferecidos por essas máquinas, é CORRETO afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o zoom óptico representa a capacidade real de aproximação da objetiva, sem perda de resolução; o zoom digital aumenta o poder de aproximação da objetiva, mas compromete a resolução.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o uso do zoom digital é melhor e mais adequado na maioria das situações, pois além de proporcionar maior alcance, utiliza completamente toda a área de captação do sensor de imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o zoom óptico serve para dimensionar a distância correta entre a câmera e os objetos fotografados, mas pode-se melhorar e aumentar a qualidade final da imagem ao optar-se pelo zoom digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o zoom óptico e o zoom digital têm a mesma capacidade de captura e aproximação; a principal diferença está no fato de que um funciona de forma manual e o outro de forma automática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o zoom digital representa a capacidade real de aproximação da objetiva, sem perda de resolução; o zoom óptico realiza uma aproximação falsa das cenas e ainda compromete a resolução.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q14
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q14', N'A _________ de imagens consiste em ______ novos pontos a ela, baseado nos pontos existentes, de modo a ________ assim a sua quantidade total. Na prática, a ________ serve para _______ a imagem, dando apenas a impressão de possuir uma________ sem, entretanto aumentar o nível de detalhes. Assinale a alternativa que preencha correta e respectivamente as lacunas.', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Interpolação, diminuir, diminuir, compactação, clarear, resolução', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Compactação, adicionar, diminuir, interpolação, clarear, versão', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Preservação, diminuir, aumentar, resolução, embaçar, resolução', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Interpolação, adicionar, aumentar, interpolação, embaçar, resolução', 1);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q15', N'Para uma situação fotográfica que exija congelamento das ações de uma cena mal iluminada, foco seletivo e qualidade de imagem, com pouco ruído, a melhor configuração do equipamento fotográfico seria:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Câmera com formato de sensor full frame, ISO entre 800 e 1600, diafragma 2.8 e velocidades rápidas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Câmera com formato de sensor full frame, ISO entre 800 e 1600, diafragma 16 e velocidades rápidas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Câmera com formato de sensor com “crop” na proporção 1.6, ISO entre 2000 e 3200, diafragmas 2.8 e velocidades rápidas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Câmera com formato de sensor com crop, na proporção 1.5, ISO entre 2000 e 3200, diafragmas 16 e velocidades lentas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Câmera com formato de sensor full frame, ISO entre 1600 e 3200, diafragmas 8 e velocidades lentas.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q16', N'Um fotógrafo escolhe para trabalhar uma objetiva que lhe possibilita distâncias focais que variam entre 12 e 24mm, construída para uma câmera com sensor no formato “DX” ou com fator de “crop” de 1.5x. Sobre essa objetiva, pode-se afirmar que: I. Trata-se de uma objetiva de tipo zoom, com distâncias focais atuando dentro do campo das grandes angulares. II. Pelo fator de “crop”, os campos de visão proporcionados equivaleriam ao de uma objetiva com distâncias focais que variassem entre 18 e 36mm. III. A escolha desta objetiva é adequada para uma imagem “que encha o quadro com o assunto”, em que os objetos a serem registrados estejam distantes e que o fotografo não tenha possibilidade de aproximação da cena. Quais estão corretas?', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apenas I.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas I e II.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I, II e III.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q17
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q17', N'O que significa o método de interpolação na imagem fotográfica?', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Método usado para determinar o ISO correto para cada situação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Modo de focagem que deixa tanto o fundo como o primeiro plano devidamente focados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Manipulação digital que permite deixar uma parte da foto colorida e outra preto e branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Método que diminui o tamanho dos pixels, resultando numa imagem mais nítida.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Método usado para fazer grandes ampliações, onde pixels são copiados e reproduzidos por aproximação.', 1);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q18', N'As câmeras digitais adotam o mesmo princípio das tradicionais: gravam uma cena usando a energia da luz refletida pelos objetos. Nesses novos modelos de câmeras, um sensor eletrônico absorve a luz e a converte em um sinal digital que é processado e transformado em um arquivo digital. Atualmente, quais são os dois tipos de sensores mais utilizados?', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'RAW e TIFF', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Pixel e Jpeg', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'CCD e CMOS', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'LCD e Bitmap', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q19', N'Relacione as colunas, associando os conceitos fotográficos conforme a sua lógica na prática fotográfica. A ordem correta dos números da segunda coluna, de cima para baixo, é', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1 – 5 – 3 – 2 – 4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1 – 5 – 6 – 3 – 4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'2 – 4 – 1 – 5 – 6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'4 – 1 – 3 – 6 – 2.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'5 – 2 – 4 – 6 – 3.', 1);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q20', N'Assinale a alternativa que corresponde aos termos corretos para completar os espaços em branco da seguinte afirmação: “_____________é o processo que o software usa para aumentar a resolução perceptível de uma imagem. Ele faz isso ao criar _____________ a mais no meio dos que foram digitalizados pelo sensor”. (Martins, 2010)', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Pixelation / máscaras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Interpolação / pixels.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Vetorização / histogramas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Scaneamento / ruídos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Saturação / bits.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q21', N'A respeito de objetivas para a câmera fotográfica, pode-se afirmar que: I. Objetivas zoom sempre se referem a teleobjetivas, com distâncias focais variáveis ou fixas. II. Se o fotógrafo estiver sempre no mesmo ponto espacial ao realizar uma tomada, uma objetiva fixa vai lhe possibilitar enquadramentos equivalentes a distâncias focais variáveis. III. Uma objetiva com distâncias focais variáveis entre 18mm e 55mm, em uma câmera com sensor DX, com fator de “crop” de 1.5, possibilita diferentes enquadramentos mesmo que o fotógrafo se mantenha posicionado em um mesmo ponto espacial. Quais estão corretas?', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apenas I.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas III.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas I e II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I, II e III.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q22
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q22', N'Na fotografia analógica, a definição da imagem é determinada pelo ISO do filme, o qual apresenta grãos de haletos de prata, maiores ou menores. Na fotografia digital, o que se deve observar necessariamente para obter melhor definição da imagem e, conseqüentemente, fazer-se grandes ampliações?', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O zoom presente na câmera', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O tempo de disparo da câmera', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A capacidade do cartão de memória', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A quantidade de pixels que ela captura por imagem', 1);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q23
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q23', N'Qual dos seguintes tipos de extensões de arquivos, utilizados para armazenamento de imagem em câmeras digitais, mantêm as características originais da imagem fotográfica, exatamente como foi capturada?', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'JPEG', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'TIFF', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'RAW', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'BITMAP', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q24
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q24', N'A respeito de resolução da imagem, assinale alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A resolução é a quantidade de pixels de uma imagem que permite ao fotógrafo saber, com antecedência, se a foto pode passar por tratamentos em um programa de edição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A resolução da imagem permite ao fotógrafo, ao fazer o backup do trabalho, saber que, depois de armazenadas, elas não perderão a qualidade de impressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'As máquinas digitais, diferentes das analógicas, permitem, a partir da resolução, saber até que tamanho a imagem pode ser ampliada sem perder a qualidade do branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As imagens digitais são construídas por pixels – picture elements –, que são sensíveis à luz. A quantidade de pixels vai influenciar no tamanho da imagem e na sua resolução. Quanto maior o número de pixels, mais se pode ampliar a imagem sem perder qualidade, mais detalhes podem-se perceber na imagem final.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A melhor resolução de uma imagem é conseguida ao se trabalhar com um programa de edição, na ferramenta “curvas”.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q25
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q25', N'Os formatos das câmeras fotográficas estão diretamente relacionados com o tamanho do filme ou com o sensor digital. Qual é a conseqüência direta disso sobre a qualidade das imagens fotográficas?', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Não há nenhuma conseqüência direta disso na qualidade final das fotos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Nenhuma, pois, para se obter boas fotos, somente a qualidade da óptica é importante.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Quanto maior a área do filme ou do sensor digital, melhor será a qualidade da imagem fotográfica.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Geralmente, as câmeras de menor formato produzem fotos melhores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Nenhuma, pois apenas a precisão do mecanismo das câmeras é importante para a produção de boas fotos.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q26
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q26', N'Acerca do formato de imagem RAW, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'É um formato que oferece apenas melhor qualidade em ciano, magenta, amarelo e preto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'É o negativo da imagem que não foi processada pela câmara, vem direto do CCD e tem de ser editada por um aplicativo como o Photoshop. A resolução e a qualidade da imagem são melhores do que em JPEG, que é uma imagem comprimida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'É um formato que facilita trabalhar a imagem em camadas no Photoshop, para melhor equilíbrio das cores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'É um formato de compressão da imagem que perde em qualidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'É diferente do JPEG, pois permite o tratamento e a transmissão de fotos, via Internet, com mais facilidade e mais qualidade.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q27
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q27', N'Uma câmara digital utiliza uma matriz de sensores de milhões de pequenos pixels, a fim de produzir a imagem final. O tipo mais comum de arranjo de filtro na captação de cores é chamado de "Bayer Array” (Matriz de Array) que consiste de fileiras alternadas de filtros:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'vermelho-verde e verde-azul.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'amarelo-azul e verde-laranja.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'azul-vermelho e verde-laranja.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'amarelo-verde e azul-vermelho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'vermelho-amarelo e azul-vermelho.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q28
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q28', N'Uma objetiva 50 mm é considerada normal para uma câmera 35 mm analógica. Mas para as câmeras digitais construídas num corpo similar elas podem variar a cobertura do objeto fotografado à mesma distância, pois o que define a distância focal é a sua relação com:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o ISO utilizado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a diagonal do sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a abertura máxima do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a disposição dos elementos óticos.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q29
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q29', N'Depois de fazer a cobertura de um acontecimento, o fotógrafo resolve, na edição das imagens, interpolar algumas imagens que foram escolhidas para uso imediato. Nesse contexto, interpolar significa', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'inserir, colocar um elemento a mais na imagem, que não constava de seu referente inicial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar técnica para transporte da imagem, reduzindo, evidentemente, o tamanho do arquivo para facilitar o transporte e(ou) armazenamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'usar o recurso de aumentar o número de pixels que compõem a imagem; fato que ocorre com frequência se, na tomada da foto, a resolução escolhida não tiver sido suficiente para o tamanho da impressão desejada ou para a finalidade a que a foto se destina: revista, folder etc.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fundir uma imagem com outra imagem, utilizando programas específicos no tratamento e na edição das imagens.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'adotar um tipo de compressão da imagem que perde em qualidade.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q30
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q30', N'Nas câmeras digitais, os raios de luz que atravessam a objetiva formam a imagem quando atingem o sensor. Na grande maioria dos equipamentos, o sensor é uma superfície plana composta por uma matriz bidimensional de:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'cristais de haletos de prata distribuídos desordenadamente, que convertem a intensidade luminosa em corrente elétrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'cristais de haletos de prata distribuídos uniformemente e sensíveis à luz, que transformam a intensidade luminosa em registro digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'microcélulas fotoelétricas, distribuídas desordenadamente, que convertem a intensidade luminosa em registro digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'microfotossensores, que convertem em cargas elétricas a intensidade luminosa de cada ponto da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'microfotossensores, que convertem a intensidade luminosa em registro digital.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q31
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q31', N'Ferramenta utilizada para que um arquivo possa ser impresso em tamanho maior do que sua quantidade de pixel permite sem uma deterioração aparente, ou até mesmo significativa, dependendo da sua aplicação, na qualidade da imagem. É um método utilizado para se obter um novo conjunto de dados a partir de um conjunto de dados existente. Esta ferramenta refere -se:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao histograma', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao sistema de cores CMYK', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a interpolação', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a distância hiperfocal', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q32
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q32', N'Nas câmeras digitais, podemos armazenar dados em vários tipos de cartões de memória. Existem câmeras que suportam mais de um tipo de armazenamento. Assinale a alternativa que não corresponde a um destes tipos.', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'CompactFlash', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Memory Stick', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'SmartMedia', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'CMOS', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'SD', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q33
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q33', N'Requisitos mais importantes a serem observados na hora de adquirir uma câmera digital profissional.', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Sensibilidade à luz (ISO), tela de LCD, abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Velocidade de obturação, cartão de memória, zoom digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Tela de LCD, sensibilidade à luz (ISO), função manual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Qualidade das objetivas, sensibilidade à luz (ISO), velocidade de obturação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Abertura do diafragma, velocidade de obturação, zoom digital.', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q34
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q34', N'Analise as afirmativas sobre tecnologias de sensores para câmeras digitais. I - A tecnologia full frame permite a captura da luz no espaço máximo disponível do quadro da imagem. II - As câmeras digitais, cujos sensores apresentam fator de corte, aproveitam melhor o espaço de enquadramento da imagem. III - O sensor CMOS (Complementary Metal Oxide Semicondutor) tem melhor desempenho para imagens de alta qualidade do que o seu concorrente CCD (Charged Coupled Device). IV - O sensor CCD é mais sensível à baixa luminosidade e por isso produz imagens mais nítidas. Está correto o que se afirma em', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'II e III, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'I e IV, apenas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'I e II, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'III e IV, apenas', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q35
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q35', N'É um termo relacionado à fotografia digital:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'triacetato de celulose', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'cibachrome', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'código dx', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'charge-couped device', 1);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q36
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q36', N'Na linguagem digital, é a representação visual de informações luminosas, capturadas pelo sensor eletrônico da câmera fotográfica. Transforma os raios luminosos incidentes em informações matemáticas, como a posição espacial, coordenadas x e y e valores de luz. Essas informações são enviadas a uma placa gráfica, que as transforma em imagens digitais. Essa descrição refere-se a', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'grãos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'pontos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'linhas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'pixels.', 1);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q37
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q37', N'O filme e o sensor tem o mesmo papel na fotografia: capturar a luz que passa pelas lentes e transformar isso em uma imagem que será a foto. E é com base nos padrões de filme que se chaga aos parâmetros de sensores digitais. Outro ponto dentro da fotografia digital é o fator de corte. O sensor que oferece uma maior qualidade de imagem e tem um ângulo de visão maior é o:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sensor APS-C 22 x 15mm', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sensor APS-C 23.5 x 16mm', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'sensor FULLFRAME 24 x 36mm', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sensr FULLFRAME 24 x 18mm', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q38
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q38', N'Na fotografia digital, “CCD” significa o', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sensor onde ficam gravadas as fotografias digitais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'mecanismo que permite o flash comunicar-se com o corpo da máquina fotográfica digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'sensor digital que permite alterar o formato da fotografia final.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'dispositivo digital que forma os pixels captados pela lente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sensor formado por um circuito integrado que capta a luz das cenas, transformando-a em imagens.', 1);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q39
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q39', N'No que diz respeito às semelhanças e às diferenças existentes entre a fotografia analógica e a digital, é INCORRETO afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a diferença básica entre as duas técnicas está no modo como a imagem é capturada e gravada. A câmera analógica utiliza um processo químico para formar suas imagens, enquanto a digital usa o sensor CCD para gravá-las.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a maioria das câmeras profissionais digitais não têm memória interna e armazenam suas fotografias em algum meio removível como cartões de memórias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'os formatos TIFF e RAW são considerados os negativos da fotografia digital', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'assim como as analógicas, as máquinas digitais usam a energia da luz refletida pelos objetos da cena e que é capaz de modificar o estado de um material sensível à luz como um filme ou um sensor, por exemplo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'assim como o ruído podia comprometer a fotografia analógica, a alta quantidade de pixels pode prejudicar a qualidade da fotografia digital. Maiores CCDs produzem maior número de pixels que, por sua vez, irá gerar imagens digitais de menor qualidade.', 1);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q40
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q40', N'O lugar do filme fotográfico na câmera fotográfica convencional temos na câmera fotográfica digital', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Capturador de imagem', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Varredor de captura de imagem', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'CPU de captura de imagem', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Sensor de captura de imagem', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Grãos refinadores de captura', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q41
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q41', N'Em uma fotografia digital na qual se utiliza o zoom digital, os pontos intermediários encontrados pelo equipamento na fotografia denomina-se', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Interligação', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Interpolação', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Escaneamento', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Digitalização ótica', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Digitalização cromática', 0);

    -- Módulo 18 (Sensor e Fator de Corte), questão original Q42
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Sensor e Fator de Corte - Q42', N'No que diz respeito a sensores, pode-se afirmar corretamente que', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'por terem pixels menores, os sensores APS-C produzem uma imagem com menos ruídos (aparência granulada) se comparados com os sensores full frame.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'os sensores full frame permitem às câmeras digitais captar imagens que têm praticamente o mesmo tamanho daquelas captadas por um filme fotográfico de 70 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o crop factor produzido pelos sensores APS-C nem sempre é negativo. Embora diminua o tamanho da imagem, ele pode expandir o alcance da objetiva, aumentando a distância focal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'os sensores CCD e CMOS partem de um mesmo princípio: precisam converter luz em elétrons. De modo geral, no entanto, os CCDs criam imagens de menor qualidade e alto "ruído". Os sensores CMOS já são tradicionalmente menos suscetíveis ao “ruído”.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q01', N'O formato que não sofre compressão nem perda de qualidade, e é considerado como o negativo digital, é o:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'GIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'PSD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'RAW.', 1);

    -- Módulo 19 (Tipos de Arquivos), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q02', N'A primeira geração de imagem capturada numa câmera digital pode ter vários formatos. Um dos formatos não compactados da imagem é o:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'JPG', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'DCT', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'RAW', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'JFIF', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'JPEG', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q03', N'Algumas câmeras digitais mais avançadas têm a capacidade de produzir simultaneamente um arquivo RAW e um JPEG. Com uma câmera com um maior número de megapixels, também se trabalha com arquivos relativamente grandes e quanto maior o tamanho do arquivo, menos fotos podem ser armazenadas em um cartão. Em relação aos formatos Raw (RAW) e Jpeg (JPEG), analise as afirmativas abaixo. I. O formato Jpeg é um formato de arquivo compactado. Ele tem um tamanho muito maior que o RAW e, consequentemente é possível armazenar poucas imagens no cartão de memória. II. Com RAW não é possível alterar o balanço (equilíbrio) de branco e de outras propriedades na pós produção, o que pode ser muito mais fácil com JPEGs. III. Arquivo de imagem RAW contém alguns metadados sobre a fotografia tirada, como câmera, lente, ISO, velocidade de obturação e abertura de diafragma utilizado. Essas informações podem ser úteis para propósitos de catalogação. IV. Quanto mais se compacta uma imagem Jpeg, pior a qualidade dela. Estão corretas as afirmativas:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'II e III apenas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'I e III apenas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'III e IV apenas', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I e IV apenas', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q04', N'Quais são os formatos de arquivo de imagem mais comuns nas câmeras digitais?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'TIFF e JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'RAW e JPEG.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'RAW e TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'TIFF e GIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Somente RAW.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q05', N'Quais das afirmativas abaixo expressam informações FALSAS sobre uma imagem capturada em formato RAW?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'É um formato de arquivo cru, pois é nativo da câmera fotográfica', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Preserva todas as informações da fotografia sendo possível fazer alterações a posteriore sem comprometer os pixels da imagem', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'É mais compactado sendo mais leve e ocupando menos espaço nos cartões de memória', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Torna possível a recuperação de fotos sobrexpostas ou subexpostas em até dois pontos', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Torna possível a o balanço de branco depois da imagem ter sido capturada', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q06', N'As câmeras fotográficas digitais podem gerar diferentes tipos de arquivo. Com o advento da tecnologia digital e das ferramentas avançadas de edição de imagem (softwares de edição), algumas imagens podem ser manipuladas a ponto de alterar completamente sua veracidade. Dentre os formatos, existe um que não pode ser editado, não permite seleções, e assim garantem a “veracidade” das imagens, e provavelmente serão aceitos até como provas judiciais. Este formato refere-se ao:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'PNG', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'JPEG', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'RAW', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'TIFF', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q07', N'Geralmente conseguimos saber, através da extensão de um arquivo (exemplo: jack.com | com é a extensão), qual software foi utilizado para elaborá-lo. Dentro deste tópico temos os arquivos que podem ter vários quadros animados, e isso permite que eles funcionem como pequenos vídeos leves e repetitivos. Estes arquivos recebem a extensão:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'JSEG', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'PNP', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'JNP', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'GIF', 1);

    -- Módulo 19 (Tipos de Arquivos), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q08', N'No sentido de tentar garantir a “credibilidade” das fotografias digitais, boa parte dos equipamentos avançados permite que as imagens sejam gravadas em um formato que registra as mesmas informações do sensor da câmera. Assinale a alternativa que apresenta esse tipo de formato de arquivo, também conhecido como DGN (digital negative).', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'GIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'JPEG Fine.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'RAW.', 1);

    -- Módulo 19 (Tipos de Arquivos), questão original Q09
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q09', N'Os arquivos digitais do tipo jpeg são conhecidos por', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'comprimirem as imagens digitais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'terem licença de uso muito cara.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'serem um formato proprietário.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'gerarem arquivos grandes e pesados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'não permitirem a edição de imagens através de softwares fotográficos.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q10', N'PADRÃO VUNESP Arquivos de metadados de uma imagem fotográfica digital, que não podem ser alterados, são aqueles do tipo', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'IPTC.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'VPN.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'DICOM.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'EXIF.', 1);

    -- Módulo 19 (Tipos de Arquivos), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q11', N'Que tipos de extensões de arquivos são encontrados nos arquivos gerados pelas câmeras fotográficas digitais?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'JPG, XLS, DOC e DWG', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'JPG, JPEG, GIF e DWG', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'TIFF, RAW, DWG e JPG', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'JPEG, TIFF, CDR e RAW', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'JPG, BMP, TIFF e RAW', 1);

    -- Módulo 19 (Tipos de Arquivos), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q12', N'Joaquim recebeu cinco arquivos da mesma fotografia com extensões diferentes (GIF, TIFF, BMP, PNG e JPG). Qual extensão seria a mais indicada para imprimir e por quê?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A extensão gif, porque originaria o menor arquivo com a melhor qualidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A extensão tiff, porque ela guarda o maior número de informações digitais, garantindo qualidade final.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A extensão BMP, porque contém o mapeamento das informações dentro do arquivo, com melhor qualidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A extensão png ou ping, porque foi criada para diminuir o tamanho dos arquivos de imagens.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A extensão JPG, porque é comumente utilizada como padrão pelas câmaras fotográficas.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q13', N'Na fotografia digital, o que são os metadados?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'São as predefinições dos modos de captura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Conjunto de informação que segue no arquivo original da foto como datas, modelo de câmera, horário, etc.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Sistema cúbico com impressão variada de numerais de 1 a 6 em cada face.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Compressão de arquivos com extensão JPG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Conjunto de dados para impressão de fotografia digital de alta resolução.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q14
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q14', N'Em fotos produzidas para impressão de peças gráficas, como cartazes, panfletos ou folders, é importante garantir a qualidade da foto final na impressão gráfica, sendo necessário salvar a imagem no formato correto. Qual tipo de arquivo implica melhores resultados sem compactação da imagem para impressão?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'tiff.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'jpg.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'png.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'giff.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q15', N'Leia atentamente as alternativas abaixo e, assinale a INCORRETA', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'GIF (Graphics Interchange Format) é um formato de imagem muito comum na Internet. É um arquivo leve e famoso pelas fotografas com movimento (gifs animados). Recomendado para quem precisa espalhar muita imagem na internet, com a vantagem de gerar arquivos de tamanho reduzido, e para quem não está preocupado em enviar imagens com pouca cor, já que o GIF só trabalha com esquema de 256 cores (8 bits), por isso não é muito comum em fotografias', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'PNG (Portable Network Graphics) Ao contrário do GIF, o PNG suporta mais cores, não apenas 256, sendo assim, é uma ótima opção para fotos. Surgiu em 1996 e, é um concorrente do GIF. Uma característica a mais no PNG é a transparência por 24 imagens de bit RGB', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'RAW (“cru” em inglês) é um padrão em algumas câmeras digitais, mas não é um formato obrigatório, podendo-se escolher entre os padrões JPG ou PNG. É “cru” por não conter aplicação de efeitos ou ajustes. Por causa disso, os arquivos neste padrão não são “puros”, porém oferece alta qualidade de imagem e menor profundidade de cores, o que permite ao editor a liberdade para utilizar a imagem do jeito como foi capturada e aplicar seus próprios efeitos ou ajustes', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Bitmap podem suportar milhões de cores e preservam os detalhes, porém deixam os arquivos extremamente pesados, pois não utilizam compressão, o formato torna o envio de imagens na internet lento', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q16', N'RAW (“cru” em inglês) é um padrão em algumas câmeras digitais, mas não é um formato obrigatório, podendo-se escolher entre os padrões JPG ou PNG. É “cru” por não conter aplicação de efeitos ou ajustes. Por causa disso, oferece alta qualidade de imagem e maior profundidade de cores. Como os arquivos neste padrão SÃO "PUROS", o editor tem a liberdade de utilizar a imagem do jeito como foi capturada e aplicar seus próprios efeitos ou ajustes, normalmente gerando fotos muito boas. Assinale a alternativa CORRETA em relação aos arquivos do tipo RAW.', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'São formatos de imagens digitais desenvolvidos exclusivamente para internet.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Trata-se de um formato escolhido pelos fotógrafos devido ao seu pequeno tamanho, o que possibilita gravar um número maior de fotos em um cartão de memória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'São arquivos brutos gravados diretamente do sensor da câmera, sem qualquer processamento de imagem ou compressão, o que resulta em um arquivo grande devido à grande quantidade de informação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Os formatos mais populares de arquivos RAW são JPEG, TIFF e GIF.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q17
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q17', N'A câmera fotográfica digital com características profissionais pode gravar imagens nos seguintes formatos:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Eps, Html e Jpeg.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Psd, Gif e Tiff.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Html, Raw e Pdf.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Jpeg, Tiff e Raw.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Pdf, Bmp e Eps.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q18', N'Ao se analisar, em um computador, uma pasta que contém arquivos de imagens, pode-se ter alguma idéia das dimensões e/ou da qualidade dessas imagens:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'por suas dimensões em centímetros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'por suas dimensões em milímetros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'por seus “dpi”.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'em função de quantos bytes o arquivo possui.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'pela extensão do arquivo (JPEG, TIFF, etc.).', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q19', N'Considerando-se somente os diversos tamanhos (em bytes) em que pode ser salva uma mesma fotografia, qual deles pode ser melhor empregado para uma impressão de grandes dimensões e alta qualidade?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1.177 kb.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'3 mb.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'400 kb.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'0,25 mb.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'20.300 kb.', 1);

    -- Módulo 19 (Tipos de Arquivos), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q20', N'Para uma transmissão rápida, via Internet, é desejável que uma imagem fotográfica tenha:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior tamanho (em bytes).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'menor tamanho (em bytes).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alta resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'baixa resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'média resolução.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q21', N'Leia atentamente as alternativas abaixo e, assinale a INCORRETA', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'GIF (Graphics Interchange Format) é um formato de imagem muito comum na Internet. É um arquivo leve e famoso pelas fotografas com movimento (gifs animados). Recomendado para quem precisa espalhar muita imagem na internet, com a vantagem de gerar arquivos de tamanho reduzido, e para quem não está preocupado em enviar imagens com pouca cor, já que o GIF só trabalha com esquema de 256 cores (8 bits), por isso não é muito comum em fotografas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'PNG (Portable Network Graphics) Ao contrário do GIF, o PNG suporta mais cores, não apenas 256, sendo assim, é uma ótima opção para fotos. Surgiu em 1996 e, é um concorrente do GIF. Uma característica a mais no PNG é a transparência por 24 imagens de bit RGB', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'RAW (“cru” em inglês) é um padrão em algumas câmeras digitais, mas não é um formato obrigatório, podendo-se escolher entre os padrões JPG ou PNG. É “cru” por não conter aplicação de efeitos ou ajustes. Por causa disso, os arquivos neste padrão não são “puros”, porém oferece alta qualidade de imagem e menor profundidade de cores, o que permite ao editor a liberdade para utilizar a imagem do jeito como foi capturada e aplicar seus próprios efeitos ou ajustes', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Bitmap podem suportar milhões de cores e preservam os detalhes, porém deixam os arquivos extremamente pesados, pois não utilizam compressão, o formato torna o envio de imagens na internet lento', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q22
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q22', N'O armazenamento correto do acervo fotográfico garante que uma imagem possa ser localizada facilmente e utilizada à medida que novas demandas surgem. O conjunto de ações que melhor assegura que um acervo fotográfico tenha fácil acesso e boa utilização é:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'back-up; inclusão de metadados, consistência de informação inserida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'back externo; inclusão de metadados; conversão de arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'formatação do HD, inclusão de metadados; back-up.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'duplicação de arquivos, back-up; conversão de arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Formatação de HD, back-up, conversão de arquivos.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q23
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q23', N'Sobre os formatos de arquivos na fotografia digital, é incorreto afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O arquivo JPEG é o tipo mais usado por ter maior qualidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O formato RAW produz arquivos maiores que o JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Arquivos TIFF podem ser manipulados no Adobe Photoshop.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Arquivos JPEG podem ser manipulados no Adobe Photoshop.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O arquivo de formato RAW pode ser convertido para o formato JPEG.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q24
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q24', N'Quando terminamos uma produção fotográfica, que passos devemos seguir com as imagens digitais para garantir a segurança das imagens originais?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Descarregar no computador, fazer um backup em CD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Descarregar no computador, editar as imagens e fazer um backup no pendrive.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Descarregar no computador, editar as imagens e fazer um backup no cartão de memória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Editar as imagens a partir do cartão de memória, gravar as editadas em CD e formatar o cartão de memória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Descarregar em um computador, fazer um backup em um HD externo ou interno, e formatar o cartão de memória.', 1);

    -- Módulo 19 (Tipos de Arquivos), questão original Q25
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q25', N'Quando captávamos uma fotografia com um filme fotográfico, a imagem gravada na película era chamada de imagem latente. Nos sistemas digitais podemos considerar que o equivalente é:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'RAW.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Canais RGB da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A informação do histograma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O conversor de imagem JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A luminosidade da imagem digital.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q26
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q26', N'Os softwares de edição de fotografias, depois da edição das imagens, exportam os arquivos em diferentes formatos, para uso em arquivamento e impressão de jornais e revistas. Quais são eles?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'DNG, GIF, EPS e BMP.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'JPEG, PNG, PICT e BMP.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'DNG, RAW, JPEG e TIFF.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'JPEG, NTSC,TIFF e PALM.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'PAL-M, PHOTOSHOP, PICT e RAW.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q27
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q27', N'O processo de arquivamento de imagens determina que o fotógrafo seja responsável pelas informações como: Conteúdo, Contato, Status, Direitos Autorais, Autor da imagem (Criador), Legenda e Local, contidas no arquivo imagem. Em que área do arquivo digital essas informações são guardadas?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'GPS.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'DNG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'IPTC.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'FRAME.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q28
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q28', N'Em que área do arquivo digital informações como Exposição, Distância Focal, ISO, Diafragma, Velocidade do Obturador, se usou flash ou não, data e hora da captura da foto e outros dados são guardadas?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'MAC.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'FULL.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'EXIF.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'RAW.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q29
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q29', N'Assinale a alternativa que corresponde aos termos corretos para completar os espaços em branco da seguinte afirmação: “Nos arquivos ________ a câmera ajusta automaticamente certos aspectos, como saturação, contraste e balanço de branco. Quando se trabalha com arquivos ______ pode-se ajustar essas características manualmente”. (Martins, 2010)', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'RAW / DNG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'TIFF / JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'JPEG / TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'RAW / TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'JPEG / RAW.', 1);

    -- Módulo 19 (Tipos de Arquivos), questão original Q30
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q30', N'Segundo Michael Langford, tanto o GIMP quanto o Photoshop permitem uma ampla gama de processos de edição de imagens, que vão desde ajustes simples a complexas operações de manipulação envolvendo inúmeras imagens. Sobre o processo de edição de imagens, considere os seguintes itens: 1. Junção de imagens para constituição de fotomontagens. 2. Modificação dos parâmetros originais dos arquivos RAW. 3. Controle preciso de tons em diversas gamas tonais. 4. Interpolação das imagens, oferecendo diferentes tipos de cálculos. Os processos de edição de imagens incluem:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'3 apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1, 3 e 4 apenas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'2 e 4 apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'2 e 3 apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1, 2, 3 e 4. 10', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q31
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q31', N'Para armazenamento de fotografias digitais, os tipos mais utilizados de formatos de arquivos são:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'JPG, RAW e TIFF', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'CCD, DVD e PDF', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'GPD, CMOS, CCD', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'DVD, HD e CCD', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q32
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q32', N'O melhor formato de arquivo para a reprodução impressa de imagem é:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'TIFF', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'PDF', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'JPG', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'RAW', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q33
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q33', N'São extensões de arquivos digitais fotográficos que não utilizam compressão', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'BMP e JPG', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'JPG e TIFF', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'TIFF e RAW', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'BMP e TIFF', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'DWG e TIFF', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q34
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q34', N'Quando uma imagem se torna um arquivo digital por meio da câmera, ela pode ser usada e armazenada de várias formas. Levando-se em consideração que o negativo fotográfico é um suporte físico e pode ser danificado, o que se pode afirmar com relação ao arquivo digital?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Uma vez armazenado, o arquivo digital não pode sofrer alterações e, consequentemente, não pode ser danificado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Quando a imagem é transferida para um computador externo, em um disco rígido diferente do cartão da câmera, ela não pode mais sofrer alterações.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'HD externos são inadequados para o armazenamento dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Os backups dos arquivos são necessários apenas após a edição da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O primeiro cuidado antes do tratamento da imagem é fazer uma cópia do arquivo, mantendo as configurações originais.', 1);

    -- Módulo 19 (Tipos de Arquivos), questão original Q35
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q35', N'Pode-se considerar que, nos sistemas digitais, o equivalente à imagem latente do filme fotográfico fotoquímico é(são)', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o arquivo fotográfico tipo RAW.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'os canais RGB da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a informação de luminância da imagem digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a matriz de Bayer do sensor digital da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o conversor analógico-digital que gera a imagem em formato JPG.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q36
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q36', N'As câmeras fotográficas digitais podem gerar diferentes tipos de arquivo. Com o advento da tecnologia digital e das ferramentas avançadas de edição de imagem (softwares de edição), algumas imagens podem ser manipuladas a ponto de alterar completamente sua veracidade. Dentre os formatos, existe um que não pode ser editado, não permite seleções, e assim garantem a “veracidade” das imagens, e provavelmente serão aceitos até como provas judiciais. Este formato refere-se ao:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'PNG', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'JPEG', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'RAW', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'TIFF', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q37
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q37', N'A fotografia digital pode ter diversos formatos. Marque a alternativa que relaciona todos os itens representando arquivos digitais da imagem.', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'WAV, PDF, DOC, AVI.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'VHS, PNG, JPEG, TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'JPEG, RAW, TIFF, PNG.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'PDF, JPEG, WAV, PNG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'RAW, AVI, TIFF, PDF.', 0);

    -- Módulo 19 (Tipos de Arquivos), questão original Q38
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Tipos de Arquivos - Q38', N'Considerando o contexto dos arquivos com informações digitais, a sigla MD5 refere-se a', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'um mecanismo de segurança do arquivo que se baseia na produção de uma imagem do próprio arquivo, em pequenas dimensões, que pode ser comparada com o original.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'uma chave de acesso restrito, necessária para que o arquivo seja aberto ou editado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'um processo de autenticação que gera uma palavra chave associada ao arquivo, a partir da qual se pode verificar a integridade do arquivo ou se este foi corrompido ou adulterado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'uma forma de compactação de alta eficiência que permite reduzir o arquivo a um valor máximo de até 512 bytes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'um algoritmo de compressão específico projetado para uso em arquivos de som e imagem.', 0);

    -- Módulo 20 (Protocolo e Cartão de Memória), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Protocolo e Cartão de Memória - Q01', N'Para transferir, com maior rapidez, um lote de imagens pela web, que protocolo de transferência devo utilizar?', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'FTP', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'MAIL', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'IEEE', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'TCP-IP', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'FIRMWARE', 0);

    -- Módulo 20 (Protocolo e Cartão de Memória), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Protocolo e Cartão de Memória - Q02', N'Os tipos de conexão direta que podemos encontrar nas câmera fotográficas digitais são:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'USB e Firewire', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'CCD e CMOS', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Zoom ótico e digital', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Controle de exposição e abertura', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'RURST e MULTI-RURST', 0);

    -- Módulo 20 (Protocolo e Cartão de Memória), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Protocolo e Cartão de Memória - Q03', N'Correspondem a sistemas de arquivos comumente utilizados por cartões de memória das câmeras fotográficas digitais', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Fat 32 e CMOS', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Fat 16 e Fat 32', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'NTFS e CCD', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'CMOS e CCD', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'CMOS E USB', 0);

    -- Módulo 20 (Protocolo e Cartão de Memória), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Protocolo e Cartão de Memória - Q04', N'São tipos de cartões de memória para o armazenamento da imagem digital na câmera fotográfica digital:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'“Compact Flash, CCD, CMOS e SD”', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'“Memory Stick, USB, Compact Flash e PCMCIA”', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'“Memory Stick, CMOS, Compact Flash e PCMCIA', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'“Memory Stick, MMC, SD e Compact Flash”', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'“Microdrive, USB, Memory Stick e MMC', 0);

    -- Módulo 21 (Modos da Câmera), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Modos da Câmera - Q01', N'Em um jogo de futebol, o fotógrafo encontrou a seguinte situação de luz: o estádio está iluminado pela luz do sol e uma boa parte do campo está na sombra. A partida é muito dinâmica e a solução para congelar o movimento nas áreas com altas e baixas luzes é trabalhar com', 1,
        (SELECT id FROM temas WHERE nome = N'Modos da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a prioridade de abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO baixo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a prioridade de velocidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o diafragma fixo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o balanço de branco automático', 0);

    -- Módulo 21 (Modos da Câmera), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Modos da Câmera - Q02', N'O ajuste que permite ao equipamento fotográfico digital fazer disparos sequenciais denomina-se', 1,
        (SELECT id FROM temas WHERE nome = N'Modos da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Fotômetro', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Auto-bracketing', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Swap', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Flash', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Burst', 1);

    -- Módulo 21 (Modos da Câmera), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Modos da Câmera - Q03', N'Ao fotografar com a câmera fotográfica configurada para um modo de prioridade de abertura, em um ambiente com pouca iluminação, um fotógrafo deve estar atento: I. Ao controle da velocidade de obturação para não incorrer no risco de fotografar com velocidades demasiadamente lentas. II. Ao controle do ISO, para que este o possibilite usar velocidades de obturação mais rápidas. III. À sua necessidade de maiores ou menores profundidades de campo. Quais estão corretas?', 1,
        (SELECT id FROM temas WHERE nome = N'Modos da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apenas I.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas I e II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I, II e III.', 1);

    -- Módulo 21 (Modos da Câmera), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Modos da Câmera - Q04', N'O desenho de uma flor encontrado em diversos seletores e menus das câmeras fotográficas digitais serve para fazer fotografias em', 1,
        (SELECT id FROM temas WHERE nome = N'Modos da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Locais de pouca luz', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Grande angular', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Teleobjetiva', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Macro', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Locais de muita luz', 0);

    -- Módulo 21 (Modos da Câmera), questão original Q05
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Modos da Câmera - Q05', N'Para facilitar e agilizar o controle da exposição, alguns modelos de câmeras monorreflex analógicas possuem automatismos. Com esse equipamento, o fotógrafo pode optar por: I. dar prioridade à profundidade de campo, escolhendo o diafragma e deixando para a câmera o ajuste automático do obturador. II. em situações de movimento, escolher a velocidade do obturador, deixando para a câmera o ajuste automático do diafragma. III. avaliar as indicações do fotômetro e ajustar manualmente a combinação adequada entre diafragma e obturador. Esses automatismos são apresentados na SLR analógica, respectivamente, como:', 1,
        (SELECT id FROM temas WHERE nome = N'Modos da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'TV, AV e M.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'M, TV e P.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'AV, TV e M.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Auto, TV e AF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'AF, Auto, M.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q01
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q01', N'Quais são as etapas principais do processo de revelação do filme, respectivamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Banho de interruptor, revelação, fixação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Fixação, banho de interruptor, revelação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Banho de interrupto, fixação, revelação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Revelação, banho de interruptor, fixação.', 1);

    -- Módulo 22 (Fotografia Analógica), questão original Q02
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q02', N'Filme é um material sensível a luz. Nele, são gravadas as imagens capturadas pelas lentes de uma câmera. O filme é constituído por uma base plástica, geralmente de celulose, flexível e transparente. Essa base é uma emulsão banhada pelo seguinte produto químico:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'haletos de potássio', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'haletos de prata', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'haletos de brometo', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'haletos de hipossulfito', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q03
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q03', N'A ordem correta dos três banhos químicos destinados a revelação de um filme preto e branco é:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'branqueador, fixador e interruptor;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fixador, estabilizador e revelador;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'revelador, interruptor e fixador;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'interruptor, branqueador e revelador;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'estabilizador, revelador e branqueador.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q04
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q04', N'Emulsões ortocromáticas são aquelas insensíveis ao:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'azul;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'vermelho;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ciano;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'verde;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'amarelo.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q06
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q06', N'A classificação das câmeras analógicas conforme o formato dos filmes, é:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Formato compacto, 110, médio formato e grande formato.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Formato 110, 135, 120 ( médio formato ) e grande formato.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Formato compacto, compacto avançado, 135, grande formato.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Formato compacto avançado, 110, 120, grande formato.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Formato pequeno, médio formato e grande formato.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q07
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q07', N'O filme é o local onde a foto fica registrada na fotografia analógica. Leia as sentenças a seguir e marque (V) para as VERDADEIRAS e (F) para as FALSAS. ( ) Os filmes de média sensibilidade são adequados para fotografias feitas em ambientes claros ou com auxílio do flash, enquanto os de sensibilidades maiores são indicados para situações que precisamos usar o obturador em baixa velocidade. ( ) A qualidade final da fotografia impressa não depende da sensibilidade do filme. ( ) Filmes de baixa sensibilidade garantem uma ampliação de maior qualidade, pois os cristais de prata que compõem o filme são menores e, por isso geram uma distorção menor. ( ) O índice de exposição ou de sensibilidade segue uma escala do padrão ISO que agrupa os padrões americanos (DIN) e alemães (ASA). Marque a opção que apresenta a sequência CORRETA.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'F – F – V – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'V – V – F – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'F – F – F – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'F – F – V – F.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'V – F – V – F.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q08
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q08', N'Em relação às principais diferenças entre as câmeras analógicas e digitais, assinale a afirmativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Algumas câmeras analógicas não precisam de bateria, outras exigem apenas uma para ligar o medidor de luz, motor drive e autofoco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Câmeras digitais consomem pouca energia e funcionam sem bateria.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Os negativos e slides podem durar centenas de anos, mesmo sendo guardados em ambientes adversos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'É muito comum o ruído na imagem analógica e não na digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Ao expandir uma foto digital ela ficará pixelizada e nunca mais poderá ser usada.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q10
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q10', N'Um filme fotográfico comum compõese de camadas', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Sensíveis com sais de prata mais base acetato', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Sensíveis com sais de ouro mais base acetato', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Sensíveis com sais de cobre mais base acetato', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Sensíveis com prata metálica mais base acetato', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'De acetato com placas de brometo', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q11
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q11', N'O nome do equipamento de laboratório usado na fotografia tradicional para a confecção de cópias fotográficas é', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ampliador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'condensador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'amplificador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'computador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'revelador.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q12
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q12', N'A sensibilidade de um filme fotográfico afeta diretamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a impressão de movimento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a granulosidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a nitidez do ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'as dimensões do fotograma.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q13
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q13', N'Qual é a ordem correta no processamento de um filme em preto e branco para que resulte em um negativo de qualidade?', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Lavagem, interrupção, revelação e viragem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Fixação, revelação, lavagem e interrupção.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Viragem, revelação, fixação e lavagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Revelação, viragem, interrupção e fixação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Revelação, interrupção, fixação e lavagem.', 1);

    -- Módulo 22 (Fotografia Analógica), questão original Q14
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q14', N'PADRÃO VUNESP A palavra contraste pode ter diversas conotações em função da temática na qual ela está sendo inserida. No que diz respeito à “imagem fotográfica”, o conceito de contraste está relacionado', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao uso de filtros de densidade neutra no intuito de eliminar a superexposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'às imagens captadas em película branco e preto cuja emulsão é isenta de camadas de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à escala de luminosidade entre os tons claros e os escuros de uma imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao processo de substituição da película fotoquímica pelo sensor fotoeletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'à utilização de diferentes temperaturas de cor em refletores utilizados no registro da imagem.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q15
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q15', N'Quais são as fases químicas de um processamento técnico de filmes coloridos para a impressão de positivos?', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Revelador cor + branqueador + fixador + estabilizador', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Branqueador + estabilizador + fixador + revelador cor', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Revelador cor + fixador + estabilizador + branqueador', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Fixador + revelador cor + branqueador + estabilizador', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Estabilizador + revelador cor + estabilizador + fixador', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q16
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q16', N'Durante a ação físico-química do registro da imagem, o que ocorre nos sais de prata?', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Nada ocorre nos sais de prata', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Ocorre uma emissão de luz', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Ocorre uma mudança de posição', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Ocorre o aparecimento de prata metálica', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O bromato desaparece do flme', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q17
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q17', N'O principal agente fixador é:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Hipossulfito de sódio', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Bórax', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Metol', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Hidroquinona', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Carbonato', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q18
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q18', N'Na revelação de um filme preto e branco, são usados três produtos químicos: o revelador, o interruptor e o fixador. Sobre a ação desses produtos, identifique as afirmativas a seguir como verdadeiras (V) ou falsas (F): ( ) O revelador elimina os sais de prata da película do filme. ( ) O interruptor detém a ação do revelador sobre a película do filme. ( ) O interruptor afeta a imagem formada na película, pois elimina os sais de prata ainda existentes. ( ) O fixador torna a película insensível à luz. Assinale a alternativa que apresenta a sequência correta, de cima para baixo.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'V – V – F – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'V – F – V – F.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'F – F – V – V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'F – V – F – V.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'V – V – F – F.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q19
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q19', N'A obtenção de imagens de alta definição em suportes de grande formato, tanto na tecnologia tradicional quanto na digital, está diretamente relacionada tanto com o tamanho do negativo quanto com o formato do arquivo digital utilizado. Com base nesta afirmação, assinale a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Negativo de médio formato produzido em filmes de sensibilidade alta; e arquivos digitais em formato JPG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Negativo de grande formato produzido em filmes de sensibilidade média; e arquivos digitais em formato RAW.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Negativo de pequeno formato produzido em filmes de sensibilidade média; e arquivos digitais em formato TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Negativo de médio formato produzido em filmes de sensibilidade alta; e arquivos digitais em formato TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Negativo de pequeno formato produzido em filmes de sensibilidade alta; e arquivos digitais em formato JPG.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q20
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q20', N'Qual é a ordem correta da primeira à terceira camada sensível de um filme colorido?', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Verde, vermelho e amarelo', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Cyan, magenta e amarelo', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Amarelo, cyan e magenta', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Magenta, cyan e amarelo', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Amarelo, magenta e cyan', 1);

    -- Módulo 22 (Fotografia Analógica), questão original Q21
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q21', N'A resultante do registro fotográfico, imediatamente após a exposição à luz, na câmera fotográfica denomina-se imagem', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Foto-sensível', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Adjacente', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Consequente', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Latente', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Lactante', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q22
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q22', N'Considerando que as câmeras fotográficas digitais estão substituindo as câmeras chamadas analógicas, é CORRETO afirmar que as câmeras digitais:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'modificaram radicalmente os princípios básicos da fotografia analógica e possibilitaram o desenvolvimento de tecnologias eficientes em relação ao registro e à documentação fotográfica', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'mantiveram os princípios básicos da fotografia analógica e limitaram o desenvolvimento de novas e mais eficientes tecnologias em relação ao registro e à edição fotográfica', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'mantiveram os princípios básicos da fotografia tradicional e possibilitaram o desenvolvimento de tecnologias novas e eficientes em relação ao registro e à edição fotográfica', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'modificaram os princípios básicos da fotografia analógica e dificultaram o desenvolvimento de tecnologias capazes de realizar registros e edição fotográfica condizentes com a expectativa do mercado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'mantiveram os princípios básicos da fotografia analógica, entretanto, não possibilitaram o desenvolvimento adequado de tecnologias capazes de realizar registros fotográficos eficientes.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q23
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q23', N'O princípio físico para obtenção da imagem da câmera digital é o mesmo que o da câmera convencional?', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Não, porque a fotografia digital é muito mais nova.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Não, porque a fotografia digital tem mais tecnologia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Sim, as duas utilizam o mesmo princípio da ótica para produzir as imagens dentro da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Depende da qualidade da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Depende da qualidade da luz.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q24
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q24', N'Ao dividir a câmara escura para revelação de filmes em preto e branco em áreas úmida e seca, o que marca a diferença entre as duas áreas é a presença:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'do revelador e do ampliador na parte úmida.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'da bacia do fixador e da guilhotina na parte seca.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da luz branca como luz de segurança na área úmida e de luz vermelha na seca.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do revelador, do interruptor e do fixador na parte úmida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'de lanternas de segurança azuis na parte seca.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q25
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q25', N'Ao fotografar um ambiente iluminado exclusivamente por lâmpadas incandescentes, o fotógrafo usou a exposição correta para um filme cromo daylight, mas não usou flash, nem qualquer filtro de correção. Devido à temperatura de cor da fonte luminosa da sala, seus slides originais estavam com o tom da imagem tendendo para:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'verde.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'violeta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'cinza.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'azul.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'laranja.', 1);

    -- Módulo 22 (Fotografia Analógica), questão original Q26
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q26', N'Emulsão ou emulsão sensível é o nome dado àquela substância que é uma mistura de:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Gelatina e brometo de prata.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Geléia e bromo de ouro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Celulose e brometo de bronze.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Glicose e brometo de prata.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q27
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q27', N'O negativo colorido é formado por camadas de corantes amarelo, magenta e ciano. No processo de ampliação, essas camadas, por meio de processos de filtragem, vão gerar suas cores complementares que são, respectivamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'laranja, verde e azul.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'vermelho, anil e verde.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'azul, verde e vermelho.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'verde, vermelho e preto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'vermelho, azul, verde.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q28
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q28', N'Chamamos de imagem latente a fotografia quando ela se encontra na seguinte fase:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Fase visível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Fase invisível.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Fase com visibilidade parcial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Quando não haverá possibilidade de revelação.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q29
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q29', N'São os sistemas de medir a sensibilidade, exceto:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ASA.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Weston.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'CWI.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Scheiner.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q30
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q30', N'Quando se observa um filme colorido já revelado, pode-se observar a existência de cores primárias em partes da imagem. Pergunta-se: qual a denominação das cores que deram origem às primárias?', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Complementares', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Implementares', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Coadjuvantes', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Suplementares', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Aditivadas', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q31
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q31', N'Para execução de ampliações fotográficas analógicas é necessário o uso de ampliadores dotados de fole flexível. Assinale a alternativa que indica a função do fole flexível nos ampliadores fotográficos.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Permite a focalização da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Determina o tempo de exposição da cópia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Ajusta o tamanho da ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Comporta diversos formatos de negativo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Altera os níveis de contraste em papeis multigrade.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q32
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q32', N'O filme destinado especificamente à obtenção de slides denomina-se', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Reversível', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Irrelevante', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Irreversível', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Mutante', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Pancromático', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q33
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q33', N'Como é chamada a solução que transforma a imagem latente em visível?', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Fixador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Secador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Revelador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Transformador.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q34
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q34', N'Qual o principal componente do banho fixador?', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Hipossulfito de sódio.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Hipossulfito de ferro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Hipossulfito de alumínio.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Hipossulfito de potássio.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q35
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q35', N'Um filme ortocromático é insensível às cores', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Azul e cinza', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Vermelha e laranja', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Azul e amarela', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Amarela e cinza', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Verde e branca', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q36
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q36', N'Ao utilizar um filme daylight para fotografar sob luz de tungstênio, o filtro de correção indicado para evitar distorção nos tons é o:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'85 B.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'80 A.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Skylight.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ND.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Cross.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q37
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q37', N'Qual dos itens abaixo não é um componente de uma câmera fotográfica analógica?', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'LCD', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'espelho', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'cortina', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sapata', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'prisma', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q38
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q38', N'Imagem latente é a que:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Vai ser fotografada para depois ser revelada', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Já foi fotografada, mas ainda não foi revelada', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Foi fotografada e já foi revelada', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Foi revelada, mas ainda não fixada', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Está no negativo revelado', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q39
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q39', N'Relacione as colunas, associando os termos recorrentes na fotografia tradicional aos seus semelhantes na fotografia digital. A ordem correta dos números da segunda coluna, de cima para baixo, é', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1 – 4 – 6 – 2 – 3.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'2 – 3 – 5 – 6 – 4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'2 – 5 – 4 – 3 – 1.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'5 – 2 – 3 – 6 – 1.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'6 – 5 – 4 – 1 – 3.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q40
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q40', N'Com relação à conservação e à preservação de arquivos fotográficos (fotografia analógica), assinale a alternativa que indica CORRETAMENTE quais são as condições ambientais recomendadas que devem ser oferecidas pelos espaços físicos que abrigam os acervos.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Clima seco e temperatura elevada', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Clima úmido e temperatura baixa', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Clima úmido e temperatura elevada', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Clima úmido e temperatura ambiental.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Clima seco e temperatura amena', 1);

    -- Módulo 22 (Fotografia Analógica), questão original Q41
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q41', N'Um filme fotográfico comum compõese de camadas', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Sensíveis com sais de prata mais base acetato', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Sensíveis com sais de ouro mais base acetato', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Sensíveis com sais de cobre mais base acetato', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Sensíveis com prata metálica mais base acetato', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'De acetato com placas de brometo', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q42
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q42', N'A iluminação incandescente possui baixa temperatura de cor; portanto, as fotografias feitas com filmes “luz do dia”, sob essa iluminação, ficam __________. Entretanto, se forem usados filmes para lâmpadas incandescentes em locais com iluminação solar, as fotografias ficam __________. As palavras que completam correta e respectivamente as lacunas do enunciado acima são', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'amareladas – esverdeadas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'amareladas – avermelhadas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'amareladas – azuladas', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'azuladas – amareladas', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'azuladas – esverdeadas', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q43
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q43', N'Analise as assertivas em relação ao trabalho em laboratório fotográfico analógico. I. A luz de segurança vermelha utilizada no laboratório fotográfico e o filtro de segurança dos ampliadores permitem o trabalho no local sem velar o papel fotográfico. II. Ao fazermos cópias fotográficas colocamos em bandejas os químicos do processamento na ordem correta e para transportar as cópias de uma bandeja para a outra, utilizamos pinças que não devem ser misturadas. III. É importante manter a temperatura constante dos químicos. Empresas responsáveis pela produção destas soluções, como a Kodak, recomendam temperaturas em torno dos 18/18,5 ºC – 24 ºC para os químicos revelador, interruptor, fixador e a água. IV. A ordem correta para a utilização dos químicos deve ser obedecida. Quais estão corretas?', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Apenas I.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas III.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas I e II.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas III e IV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I, II, III e IV.', 1);

    -- Módulo 22 (Fotografia Analógica), questão original Q44
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q44', N'Em relação ao processamento químico dos filmes fotográficos, relacione a Coluna 1 à Coluna 2. Coluna 1 1. Fixador. 2. Revelador. 3. Interruptor. Coluna 2 ( ) Age sobre o material sensível à luz, transformando haletos de prata em prata metálica. ( ) Detém imediatamente a ação do revelador. ( ) Torna solúvel em água o material fotossensível não exposto à luz. A alternativa que preenche corretamente os parênteses, de cima para baixo, é:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1 – 2 – 3.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1 – 3 – 2.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'2 – 1 – 3.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'3 – 2 – 1.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'2 – 3 – 1.', 1);

    -- Módulo 22 (Fotografia Analógica), questão original Q45
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q45', N'Assinale a sequência correta para revelação de filmes analógicos.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Espiral, revelador, interruptor, fixador, lavagem, secagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Revelador, espiral, fixador, interruptor, lavagem, secagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Espiral, interruptor, revelador, fixador, lavagem, secagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Fixador, interruptor, espiral, revelador, lavagem, secagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Revelador, fixador, espiral, interruptor, lavagem e secagem.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q46
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q46', N'Existem três tipos principais de materiais utilizados na base de filmes fotográficos:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'acetatos de celulose, amoníaco e antimônio;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'nitrato de celulose, acetatos de celulose e poliéster;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'poliéster, antimônio e nitrato de celulose;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'amoníaco, acetona e sulfato de cobre;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sulfato de cobre, nitrato de celulose e acetona.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q47
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q47', N'Cada filme, de acordo com sua sensibilidade, precisa de uma quantidade determinada de luz para formar a imagem fotográfica. Essa quantidade que chega à película é regulada pelo:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'contraste e velocidade de obturação;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'foco e contraste;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'diafragma da lente e da velocidade de obturação;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'tripé e diafragma da lente;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'campo focal e granulação.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q48
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q48', N'Sequência correta analógica do negativo no ampliador fotográfico.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Negativo é colocado no suporte do ampliador, regulagem do foco, posicionamento do papel fotográfico na base do ampliador, exposição à luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Negativo é colocado no revelador, interruptor, fixador, lavagem e secagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Negativo é colocado na base do ampliador, papel fotográfico é colocado no suporte do ampliador, regulagem do foco, exposição à luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Negativo é colocado no fixador, revelador, interruptor, lavagem e secagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Negativo é colocado no fixador, interruptor, revelador, lavagem e secagem.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q49
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q49', N'A sequência CORRETA dos reagentes químicos para revelar ou ampliar uma fotografia preto e branco analógica é', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'revelador, interruptor e fixador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'revelador, fixador e interruptor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fixador, interruptor e revelador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'interruptor, revelador e fixador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'fixador, revelador, interruptor.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q50
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q50', N'PADRÃO VUNESP São valores típicos para identificar alguns tamanhos de películas:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'35 mm e 120 polegadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'35 mm e 4x5 polegadas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'3x5 polegadas e 120 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'6x7 polegadas e 4x5 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'6x7 mm e 4x5 polegadas.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q51
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q51', N'Os ampliadores estão relacionados diretamente às:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Amplificações fotográficas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Cópias fotográficas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Revelações fotográficas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Interrupções fotográficas.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q52
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q52', N'Apesar de sua enorme importância, a revelação de negativos é um dos passos mais simples e mecânicos de todo processo fotográfico. O segredo de uma revelação bem-sucedida é consistência e cuidado. Em relação ao processo de revelação, assinale a alternativa INCORRETA.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O primeiro passo na revelação de filmes é a preparação dos agentes químicos necessários, assegurando-se de não contaminar os produtos químicos com a troca de recipientes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Com todas as luzes do laboratório apagadas: tire o filme da bobina enrole-o na espiral da revelação, coloque a espiral no tanque de revelação e feche-o firmemente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Uma vez que a espiral carregada com o filme esteja dentro do tanque fechado, podem-se ascender as luzes e terminar o processo de revelação no claro. O filme estará protegido dentro do tanque.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O processo de revelação consiste em dar várias secagens no filme em estado de revelação para que a imagem possa ser refletida.', 1);

    -- Módulo 22 (Fotografia Analógica), questão original Q53
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q53', N'A respeito do processo de revelação de um filme fotográfico, assinale a alternativa CORRETA.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O revelador deve ser estocado em garrafas ou outros recipientes de cores claras para manter a incidência de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Geralmente, os reveladores consistem em um agente revelador e vários outros elementos físicos que tornam o revelador efetivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O agente revelador transforma os íons de prata no haleto de prata exposto em prata metálica para converter a imagem latente em imagem visível.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Os cristais de prata não expostos, que não contém átomos de prata metálica, também são modificados pelo revelador.', 0);

    -- Módulo 22 (Fotografia Analógica), questão original Q54
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP - Apostila Técnicas Audiovisuais - Fotografia Analógica - Q54', N'O motor drive é um acessório destinado a:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o efeito das teleobjetivas;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'acionar o disparador da câmera distância;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'medir a luz de um disparo de flash;', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'permitir a execução de fotos em seqüência;', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'duplicar o tamanho do filme.', 0);

    COMMIT TRANSACTION;
    PRINT 'Lote de 573 questões (Técnicas Audiovisuais) inserido com sucesso.';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO
