-- Insercao de 200 novas questoes autorais de altissima dificuldade
-- ("hard"), segundo lote, a partir dos arquivos QuestoesFto/hard11.pdf a
-- hard20.pdf (numeracao global 1-200 nos proprios documentos, mapeada
-- para referencia Q201-Q400 no banco para nao colidir com o lote anterior
-- Q001-Q200 ja existente).
--
-- Todos os 10 arquivos traziam gabarito proprio ao final (linha "N-Letra"
-- separada por "|"). Todas as questoes numericas/de calculo (exposicao,
-- numero-guia de flash, filtros ND, fator de corte, dioptrias, lei do
-- inverso do quadrado, teleconversores, PPI etc.) foram reconferidas de
-- forma independente e bateram com o gabarito da fonte -- nenhuma
-- correcao foi necessaria neste lote.
--
-- referencia = "QNNN" (201-400), banca = "Ineditas - Padrao Vunesp", ano = NULL.

USE ConcursosDB;
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Triângulo de Exposição')
    INSERT INTO temas (nome) VALUES (N'Triângulo de Exposição');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'ISO')
    INSERT INTO temas (nome) VALUES (N'ISO');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Filtros')
    INSERT INTO temas (nome) VALUES (N'Filtros');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Fotometria')
    INSERT INTO temas (nome) VALUES (N'Fotometria');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Tipos de Arquivos')
    INSERT INTO temas (nome) VALUES (N'Tipos de Arquivos');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Sensor e Fator de Corte')
    INSERT INTO temas (nome) VALUES (N'Sensor e Fator de Corte');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Flash')
    INSERT INTO temas (nome) VALUES (N'Flash');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Impressão')
    INSERT INTO temas (nome) VALUES (N'Impressão');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Balanço de Branco')
    INSERT INTO temas (nome) VALUES (N'Balanço de Branco');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Histograma')
    INSERT INTO temas (nome) VALUES (N'Histograma');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Objetivas')
    INSERT INTO temas (nome) VALUES (N'Objetivas');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Protocolo e Cartão de Memória')
    INSERT INTO temas (nome) VALUES (N'Protocolo e Cartão de Memória');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'EV')
    INSERT INTO temas (nome) VALUES (N'EV');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Composição e Enquadramento')
    INSERT INTO temas (nome) VALUES (N'Composição e Enquadramento');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Edição de Imagens')
    INSERT INTO temas (nome) VALUES (N'Edição de Imagens');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Diafragma')
    INSERT INTO temas (nome) VALUES (N'Diafragma');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Focagem')
    INSERT INTO temas (nome) VALUES (N'Focagem');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'RGB')
    INSERT INTO temas (nome) VALUES (N'RGB');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Componentes da Câmera')
    INSERT INTO temas (nome) VALUES (N'Componentes da Câmera');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Tipos de Luzes')
    INSERT INTO temas (nome) VALUES (N'Tipos de Luzes');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Resolução e Qualidade de Imagem')
    INSERT INTO temas (nome) VALUES (N'Resolução e Qualidade de Imagem');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Fotografia Analógica')
    INSERT INTO temas (nome) VALUES (N'Fotografia Analógica');
GO

BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Q201 (lote11.txt, questao original 1, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q201', N'Um fotógrafo realiza uma exposição correta em 1/250 s, f/8 e ISO 400. Mantendo a mesma iluminação, altera a sensibilidade para ISO 100 e pretende preservar f/8 e a mesma exposição fotométrica. O tempo de exposição deverá ser:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/1000 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/500 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/125 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/60 s', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/30 s', 0);

    -- Q202 (lote11.txt, questao original 2, tema ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q202', N'Em uma câmera digital, o aumento do ISO, sem alteração da quantidade de luz efetivamente captada pelo sensor, corresponde fundamentalmente:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao aumento físico da capacidade de coleta de fótons de cada fotodiodo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'à amplificação do sinal produzido pelo sensor, podendo reduzir a relação sinal-ruído.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao aumento da profundidade de bits do conversor A/D.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'à ampliação da faixa espectral à qual os fotodiodos são sensíveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'à redução automática da frequência espacial de amostragem do sensor.', 0);

    -- Q203 (lote11.txt, questao original 3, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q203', N'Um fotógrafo utiliza um filtro ND8, cuja densidade corresponde a uma redução de três pontos de luz. Sem o filtro, a exposição correta é 1/500 s em f/8, mantendo-se ISO e abertura. Com a instalação do filtro, o tempo equivalente será:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/250 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/125 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/60 s', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/30 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/15 s', 0);

    -- Q204 (lote11.txt, questao original 4, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q204', N'Durante a fotografia de uma superfície predominantemente branca, uniformemente iluminada, a medição refletida da câmera é utilizada sem qualquer compensação. Considerando o comportamento convencional do sistema fotométrico, é provável que:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a câmera aumente necessariamente o ISO, independentemente do modo de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a superfície branca seja registrada próxima de um tom médio, resultando em subexposição em relação à aparência esperada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o fotômetro reconheça automaticamente a refletância física da superfície e preserve seu branco original.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a superfície seja superexposta porque o fotômetro pressupõe que objetos claros refletem pouca luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a medição seja equivalente à realizada por um fotômetro de luz incidente.', 0);

    -- Q205 (lote11.txt, questao original 5, tema Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q205', N'Em relação aos arquivos RAW produzidos por câmeras digitais, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Contêm obrigatoriamente uma imagem RGB já completamente demosaicizada e pronta para exibição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Não podem armazenar metadados EXIF, pois estes são exclusivos de JPEG e TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Preservam dados provenientes do sensor com processamento relativamente reduzido, permitindo maior flexibilidade de interpretação posterior.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'São necessariamente arquivos sem compressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Possuem padronização única, de modo que diferentes fabricantes utilizam a mesma estrutura proprietária.', 0);

    -- Q206 (lote11.txt, questao original 6, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q206', N'Em um sensor que utiliza uma matriz de filtros de cor do tipo Bayer, o processo de demosaicing tem como principal finalidade:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'converter os valores RGB diretamente em resolução física de impressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'estimar os componentes de cor ausentes em cada posição para formar uma imagem colorida completa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar exclusivamente o ruído térmico produzido nas exposições longas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'corrigir a distorção geométrica introduzida pelas lentes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'converter automaticamente a profundidade de 14 bits em 8 bits.', 0);

    -- Q207 (lote11.txt, questao original 7, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q207', N'Um fotógrafo utiliza flash manual com número-guia 40, especificado para ISO 100. Desconsiderando perdas e modificadores, para fotografar corretamente um objeto situado a 5 metros, a abertura teoricamente indicada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/4', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/5,6', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/8', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/11', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/16', 0);

    -- Q208 (lote11.txt, questao original 8, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q208', N'Em uma câmera com obturador de plano focal, utilizar um flash convencional em velocidade significativamente superior à velocidade máxima de sincronismo, sem recurso de sincronização em alta velocidade, tende a produzir:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento uniforme da exposição devido à sobreposição das cortinas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'perda exclusiva de nitidez causada pela curta duração do clarão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'iluminação apenas de parte do quadro, pois o sensor não fica integralmente descoberto em um único instante.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alteração da temperatura de cor do flash sem alteração da distribuição luminosa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'duplicação da imagem em razão do movimento das cortinas.', 0);

    -- Q209 (lote11.txt, questao original 9, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q209', N'Um fotógrafo deseja reduzir reflexos presentes na superfície de água e aumentar a saturação aparente da vegetação. O filtro mais apropriado é o:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ND graduado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ultravioleta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'polarizador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'difusor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'conversor de temperatura de cor.', 0);

    -- Q210 (lote11.txt, questao original 10, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q210', N'Sobre o funcionamento de um filtro polarizador, é correto afirmar que sua capacidade de reduzir reflexos:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'é igualmente eficiente em qualquer superfície, inclusive metais não pintados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'independe do ângulo entre câmera, superfície e fonte luminosa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'pode variar conforme a geometria da cena e tende a ser limitada em reflexos provenientes diretamente de superfícies metálicas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'somente ocorre quando utilizado em conjunto com um filtro ND.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'depende exclusivamente da distância focal utilizada.', 0);

    -- Q211 (lote11.txt, questao original 11, tema Impressão)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q211', N'Uma imagem possui 6000 × 4000 pixels. Se for impressa sem reamostragem a 300 ppi, suas dimensões aproximadas serão:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'20 × 13,3 polegadas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'30 × 20 polegadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'60 × 40 polegadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'50 × 33,3 polegadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'12 × 8 polegadas.', 0);

    -- Q212 (lote11.txt, questao original 12, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q212', N'Sobre profundidade de campo, considerando o mesmo enquadramento final, a mesma abertura nominal e sensores de tamanhos diferentes, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o tamanho do sensor, isoladamente, determina a profundidade de campo, independentemente da distância focal e da distância de tomada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'qualquer sensor menor necessariamente produz menor profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a comparação exige considerar as alterações de distância focal e/ou distância de tomada necessárias para manter o mesmo enquadramento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sensores maiores produzem sempre maior profundidade de campo porque possuem fotodiodos maiores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'profundidade de campo é determinada exclusivamente pelo número f.', 0);

    -- Q213 (lote11.txt, questao original 13, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q213', N'Ao fotografar sob iluminação de tungstênio aproximadamente 3200 K, uma câmera é configurada equivocadamente para balanço de branco correspondente à luz do dia, aproximadamente 5500 K. A tendência predominante será obter uma imagem:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'excessivamente azulada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'excessivamente amarelada/alaranjada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'neutra, pois o balanço de branco não interfere na reprodução cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'esverdeada devido exclusivamente à diferença entre 3200 K e 5500 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'magenta, independentemente das características espectrais da fonte.', 0);

    -- Q214 (lote11.txt, questao original 14, tema Histograma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q214', N'Na fotografia digital, o histograma concentrado próximo à extremidade direita:', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'demonstra necessariamente que a fotografia está corretamente exposta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'demonstra necessariamente que todos os canais RGB sofreram clipping.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'indica predominância de valores tonais elevados, mas sua interpretação depende do conteúdo da cena e da existência ou não de recorte nas altas luzes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'comprova que a imagem foi registrada em ISO elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'corresponde obrigatoriamente a uma imagem de baixo contraste.', 0);

    -- Q215 (lote11.txt, questao original 15, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q215', N'Considere duas objetivas utilizadas na mesma câmera: uma de 35 mm e outra de 200 mm. Mantendo-se a câmera exatamente na mesma posição e fotografando o mesmo objeto, é correto afirmar que a objetiva de 200 mm:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'altera fisicamente a perspectiva da cena apenas por possuir maior distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apresenta campo de visão mais estreito e maior ampliação da imagem do objeto no sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'necessariamente apresenta menor abertura máxima.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumenta a distância real entre os planos da cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'elimina a distorção de perspectiva existente na tomada.', 0);

    -- Q216 (lote11.txt, questao original 16, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q216', N'A chamada “compressão de perspectiva” frequentemente associada às teleobjetivas decorre principalmente:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'da construção óptica das teleobjetivas, que reduz fisicamente a distância entre os objetos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'do uso de distâncias maiores entre câmera e assunto para obtenção de determinado enquadramento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da menor abertura máxima característica de todas as teleobjetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do aumento do círculo de confusão provocado pela distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'da menor profundidade de bits produzida pela ampliação óptica.', 0);

    -- Q217 (lote11.txt, questao original 17, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q217', N'No padrão de metadados fotográficos, informações como modelo da câmera, distância focal, abertura, velocidade do obturador e ISO são tipicamente associadas:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'exclusivamente ao IPTC.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao EXIF.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusivamente ao XMP.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao ICC.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao DPI.', 0);

    -- Q218 (lote11.txt, questao original 18, tema EV)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q218', N'Em fotografia macro, quando a ampliação aumenta significativamente, a exposição pode exigir compensação porque:', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a distância focal nominal da objetiva necessariamente diminui.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a abertura física do diafragma aumenta espontaneamente durante a focalização próxima.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a abertura efetiva pode tornar-se menor em termos fotométricos, reduzindo a iluminância que efetivamente alcança o sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o ISO real do sensor diminui proporcionalmente à ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o obturador passa obrigatoriamente a operar em sincronismo eletrônico.', 0);

    -- Q219 (lote11.txt, questao original 19, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q219', N'Um sensor digital possui capacidade de registrar valores com profundidade de 12 bits por canal/amostra, em determinado estágio do processamento. Em termos teóricos, 12 bits permitem representar:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'12 níveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'144 níveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1024 níveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'4096 níveis.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'65.536 níveis.', 0);

    -- Q220 (lote11.txt, questao original 20, tema Histograma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q220', N'Em uma cena de alto contraste, o fotógrafo pretende preservar o máximo possível de informação útil nas altas luzes durante a captura RAW. Considerando que áreas efetivamente saturadas no sensor podem não ser recuperáveis, a conduta tecnicamente mais adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar deliberadamente a exposição até que todas as altas luzes ultrapassem o limite de saturação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'preservar as altas luzes relevantes abaixo do ponto de clipping, avaliando a distribuição tonal e a margem disponível para posterior processamento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir obrigatoriamente o ISO ao menor valor disponível, pois isso garante que nenhuma região possa saturar.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar JPEG, pois a compressão recupera informações que ultrapassaram a capacidade do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a saturação da câmera, pois isso amplia a faixa dinâmica disponível.', 0);

    -- Q221 (lote12.txt, questao original 21, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q221', N'Uma cena é corretamente exposta com ISO 200, f/5,6 e 1/125 s. O fotógrafo altera a configuração para ISO 800 e f/11. Para manter aproximadamente a mesma exposição, o tempo de obturação deverá ser:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/500 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/250 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/125 s', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/60 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/30 s', 0);

    -- Q222 (lote12.txt, questao original 22, tema ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q222', N'Ao fotografar uma cena estática com câmera apoiada em tripé, um fotógrafo reduz o ISO de 1600 para 200 e compensa integralmente essa alteração apenas pelo tempo de exposição. Desconsiderando alterações na cena e limitações do equipamento, essa decisão tende a:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o ruído associado à amplificação do sinal, exigindo tempo de exposição oito vezes maior.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir o ruído, exigindo tempo de exposição quatro vezes maior.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a profundidade de campo porque o ISO interfere diretamente na abertura efetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'exigir tempo oito vezes menor devido à maior eficiência do sensor em ISO baixo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'preservar o tempo original, pois ISO não participa da equivalência de exposição.', 0);

    -- Q223 (lote12.txt, questao original 23, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q223', N'Uma câmera apresenta velocidade máxima convencional de sincronismo com flash de 1/200 s. Em ambiente com forte iluminação contínua, mantendo-se potência, distância e abertura constantes, a alteração do obturador de 1/100 s para 1/200 s tende a:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir igualmente a contribuição do flash e da iluminação ambiente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir principalmente a contribuição da iluminação ambiente, enquanto a exposição produzida pelo breve clarão do flash permanece aproximadamente constante.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a contribuição do flash em um ponto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir a potência física emitida pelo flash pela metade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'não produzir qualquer alteração porque o obturador não interfere na luz contínua.', 0);

    -- Q224 (lote12.txt, questao original 24, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q224', N'Em uma fotografia RAW registrada sob iluminação artificial, o fotógrafo selecionou um balanço de branco inadequado. Na pós- produção, a correção tende a ser mais flexível do que em JPEG porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o RAW não registra qualquer informação relacionada ao balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o RAW preserva dados com menor processamento definitivo, permitindo reinterpretar o balanço de branco com menor comprometimento dos dados originais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o JPEG não possui canais de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o RAW registra exclusivamente luminância, reconstruindo todas as cores apenas durante a exportação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o JPEG elimina obrigatoriamente todos os metadados relativos à captura.', 0);

    -- Q225 (lote12.txt, questao original 25, tema EV)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q225', N'Um fotógrafo deseja obter 1:1 utilizando um sistema macro cuja exposição exige considerar o fator de extensão. Admitindo a relação simplificada de compensação (1 + m)², em que m é a ampliação, o fator de exposição em 1:1 será:', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'2, equivalente a +1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'2, equivalente a +2 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'4, equivalente a +2 EV.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'4, equivalente a +4 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'8, equivalente a +3 EV.', 0);

    -- Q226 (lote12.txt, questao original 26, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q226', N'Em relação ao chamado pixel morto, é correto afirmar que ele:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'permanece tipicamente com resposta luminosa máxima, aparecendo sempre branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apresenta resposta ausente ou muito reduzida por falha do elemento fotossensível, podendo aparecer persistentemente escuro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'somente aparece durante exposições superiores a um segundo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'corresponde necessariamente a uma falha do monitor, e não do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'é sinônimo técnico obrigatório de hot pixel.', 0);

    -- Q227 (lote12.txt, questao original 27, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q227', N'Durante uma exposição longa, determinados pontos muito luminosos e recorrentes aparecem na imagem devido principalmente à corrente de escuro e ao comportamento térmico de alguns fotodiodos. Esses defeitos são mais compatíveis com:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'dead pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'hot pixels.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'moiré.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aliasing cromático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'banding exclusivamente mecânico.', 0);

    -- Q228 (lote12.txt, questao original 28, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q228', N'Uma objetiva é ajustada de f/4 para f/8, mantendo-se ISO constante. Para conservar a mesma exposição exclusivamente por meio do obturador, o fotógrafo deverá:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar tempo quatro vezes mais longo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar tempo duas vezes mais longo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar tempo quatro vezes mais curto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar tempo oito vezes mais longo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'manter o mesmo tempo, pois f/4 e f/8 diferem apenas em profundidade de campo.', 0);

    -- Q229 (lote12.txt, questao original 29, tema Composição e Enquadramento)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q229', N'Em uma fotografia de arquitetura, linhas verticais paralelas do edifício parecem convergir quando a câmera é inclinada para cima. Esse fenômeno:', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'decorre exclusivamente de distorção de barril da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'é essencialmente uma consequência da perspectiva decorrente da orientação da câmera em relação ao objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ocorre apenas em objetivas olho-de-peixe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'pode ser eliminado aumentando-se o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'é produzido pela aberração cromática lateral.', 0);

    -- Q230 (lote12.txt, questao original 30, tema Edição de Imagens)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q230', N'Em um arquivo de imagem, o perfil ICC está relacionado principalmente:', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao armazenamento das coordenadas GPS da captura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao gerenciamento e à caracterização da reprodução de cores entre dispositivos e espaços de cor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à identificação da velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao registro da autoria e das palavras-chave jornalísticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'à determinação da distância hiperfocal da objetiva.', 0);

    -- Q231 (lote12.txt, questao original 31, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q231', N'Um fotógrafo utiliza uma objetiva de 100 mm e obtém determinado enquadramento. Depois troca para uma objetiva de 50 mm, permanece exatamente na mesma posição e posteriormente recorta a imagem para reproduzir aproximadamente o enquadramento da primeira fotografia. Desconsiderando diferenças de resolução e características ópticas, a perspectiva geométrica entre os objetos da cena será:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diferente, porque a distância focal determina diretamente a perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'essencialmente a mesma, porque a posição da câmera em relação à cena permaneceu inalterada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'necessariamente mais comprimida na imagem produzida com 50 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'necessariamente mais comprimida na imagem produzida com 100 mm, mesmo com a câmera imóvel.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'impossível de comparar, pois perspectivas somente podem ser analisadas com objetivas de mesma distância focal.', 0);

    -- Q232 (lote12.txt, questao original 32, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q232', N'Um fotômetro de luz incidente é empregado para medir a iluminação que atinge um retratado. Em comparação com a medição refletida convencional, sua principal vantagem conceitual é:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'determinar diretamente a distância focal adequada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'depender menos da refletância própria do objeto fotografado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'medir exclusivamente a luz refletida pelas áreas mais claras da cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar qualquer necessidade de decisão sobre exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'medir diretamente a faixa dinâmica máxima do sensor.', 0);

    -- Q233 (lote12.txt, questao original 33, tema Histograma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q233', N'Uma cena contém uma área muito clara que precisa conservar textura. No histograma, essa região atinge e ultrapassa o limite máximo registrável pelo sensor. Nessa situação, ocorreu:', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'posterização.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'interpolação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'clipping de altas luzes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'subamostragem cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aliasing.', 0);

    -- Q234 (lote12.txt, questao original 34, tema Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q234', N'A respeito da difração em fotografia, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O fechamento progressivo do diafragma sempre aumenta a resolução final porque amplia a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A difração pode reduzir a nitidez registrada quando são utilizadas aberturas suficientemente pequenas, apesar do aumento da profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A difração ocorre exclusivamente em sensores CCD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O fenômeno depende apenas da velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A difração é uma aberração cromática causada pela incapacidade da lente de focalizar diferentes comprimentos de onda.', 0);

    -- Q235 (lote12.txt, questao original 35, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q235', N'Um fotógrafo pretende usar velocidade de obturação menor em ambiente muito iluminado para produzir movimento borrado na água, sem fechar excessivamente o diafragma. A solução óptica mais adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'filtro polarizador exclusivamente, porque sua função primária é reduzir três pontos de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'filtro UV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'filtro ND.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'filtro de correção de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'filtro close-up.', 0);

    -- Q236 (lote12.txt, questao original 36, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q236', N'Uma câmera registra RAW com profundidade de 14 bits por amostra. Teoricamente, isso permite representar:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'4.096 níveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'8.192 níveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'14.000 níveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'16.384 níveis.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'65.536 níveis.', 0);

    -- Q237 (lote12.txt, questao original 37, tema Impressão)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q237', N'Sobre a diferença entre PPI e DPI, assinale a alternativa tecnicamente mais adequada.', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'São conceitos rigorosamente idênticos e nunca devem ser diferenciados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'PPI refere-se normalmente à densidade de pixels de uma imagem ou dispositivo, enquanto DPI é empregado para densidade de pontos de impressão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'DPI representa exclusivamente a profundidade de bits do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'PPI mede a quantidade de tinta depositada em cada pixel.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'DPI determina a quantidade total de pixels existentes no sensor.', 0);

    -- Q238 (lote12.txt, questao original 38, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q238', N'Ao fotografar uma hélice em movimento utilizando sensor CMOS com leitura sequencial, determinadas linhas que deveriam ser retas podem aparecer inclinadas ou deformadas. Esse efeito está associado principalmente:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao rolling shutter.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'à aberração esférica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao focus breathing.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao blooming.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'à vinhetagem mecânica.', 0);

    -- Q239 (lote12.txt, questao original 39, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q239', N'Uma fotografia realizada em 1/60 s, f/4 e ISO 400 apresenta exposição adequada. O fotógrafo pretende utilizar 1/250 s para reduzir o borramento de movimento e deseja compensar a alteração exclusivamente pelo diafragma. A abertura aproximadamente equivalente será:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/1,4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/2.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/2,8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/8.', 0);

    -- Q240 (lote12.txt, questao original 40, tema Edição de Imagens)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q240', N'Durante a edição de um arquivo JPEG de 8 bits, ajustes tonais muito intensos e sucessivos podem tornar visíveis descontinuidades em gradientes suaves. Esse fenômeno é denominado:', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'blooming.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'posterização ou banding tonal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'coma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'flare.', 0);

    -- Q241 (lote13.txt, questao original 41, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q241', N'Uma cena foi corretamente exposta em ISO 100, f/8 e 1/125 s. O fotógrafo deseja utilizar f/4 para reduzir a profundidade de campo e, simultaneamente, altera o ISO para 200. Para manter a mesma exposição, deverá utilizar aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/125 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/250 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/500 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/1000 s', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/60 s', 0);

    -- Q242 (lote13.txt, questao original 42, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q242', N'Durante a fotografia de um objeto predominantemente preto, a medição refletida da câmera, utilizada sem compensação de exposição, tende a:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reproduzir necessariamente o objeto como preto absoluto, pois o fotômetro reconhece sua cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a exposição em relação ao necessário para manter o objeto escuro, aproximando sua tonalidade de um valor médio.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'diminuir a exposição porque superfícies escuras absorvem maior quantidade de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'produzir resultado idêntico ao de um fotômetro incidente posicionado junto ao objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar apenas o balanço de branco, sem interferir na exposição.', 0);

    -- Q243 (lote13.txt, questao original 43, tema ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q243', N'Em determinada câmera, a faixa dinâmica máxima é obtida próxima ao ISO base. Ao elevar substancialmente o ISO, é correto afirmar, de maneira geral, que:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumenta necessariamente a quantidade de fótons capturados pelos fotodiodos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumenta fisicamente a capacidade máxima de carga dos fotodiodos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a faixa dinâmica disponível pode diminuir, especialmente pela redução da margem útil nas altas luzes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a profundidade de bits do conversor A/D aumenta proporcionalmente ao ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a sensibilidade espectral do sensor desloca-se necessariamente para o infravermelho.', 0);

    -- Q244 (lote13.txt, questao original 44, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q244', N'Um fotógrafo utiliza um flash de NG 56 em ISO 100. Mantendo-se a potência total e considerando a relação clássica do número- guia, a abertura calculada para um assunto a 10 metros será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/2,8', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/4', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/5,6', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/8', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/11', 0);

    -- Q245 (lote13.txt, questao original 45, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q245', N'Mantidas as demais condições, o número-guia de um flash especificado como NG 40 em ISO 100 será teoricamente próximo de qual valor em ISO 400?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'56', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'80', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'100', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'120', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'160', 0);

    -- Q246 (lote13.txt, questao original 46, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q246', N'Um fotógrafo utiliza um filtro ND16. Considerando a nomenclatura baseada no fator de transmissão, esse filtro reduz a exposição em:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'2 pontos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'3 pontos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'4 pontos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'8 pontos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'16 pontos.', 0);

    -- Q247 (lote13.txt, questao original 47, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q247', N'Sem filtro, determinada exposição é obtida em 1/250 s, f/11 e ISO 100. Ao instalar um filtro ND16 e manter abertura e ISO inalterados, o tempo equivalente será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/125 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/60 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/30 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/15 s', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/8 s', 0);

    -- Q248 (lote13.txt, questao original 48, tema Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q248', N'A respeito da distância hiperfocal, é correto afirmar que, para determinada combinação de distância focal, abertura e critério de círculo de confusão, ela corresponde:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'à menor distância de foco na qual o infinito permanece dentro da profundidade de campo aceitável.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'à distância mínima de focalização física da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à distância em que a profundidade de campo fica igualmente distribuída, em termos métricos, à frente e atrás do plano focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao ponto em que toda a cena, desde a câmera até o infinito, apresenta nitidez óptica absoluta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'à distância em que uma objetiva passa a comportar-se como uma objetiva macro 1:1.', 0);

    -- Q249 (lote13.txt, questao original 49, tema Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q249', N'Uma objetiva apresenta forte focus breathing durante a mudança da distância de foco. Isso significa que:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sua abertura efetiva varia obrigatoriamente durante qualquer exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'seu campo de visão ou ampliação aparente muda perceptivelmente conforme a distância de foco é alterada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'seu plano focal sofre necessariamente inclinação em relação ao sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sua distância mínima de foco aumenta conforme o diafragma é fechado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sua profundidade de campo permanece constante em todas as distâncias de foco.', 0);

    -- Q250 (lote13.txt, questao original 50, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q250', N'Uma fotografia apresenta franjas coloridas próximas às bordas de objetos de alto contraste, especialmente afastados do centro do quadro, com separação lateral entre componentes cromáticos. O defeito descrito é mais compatível com:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aberração cromática lateral.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aberração esférica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'coma sagital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'distorção de almofada.', 0);

    -- Q251 (lote13.txt, questao original 51, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q251', N'Em uma objetiva que apresenta distorção de barril, linhas retas próximas às bordas do quadro tendem a:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'curvar-se para dentro, em direção ao centro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'curvar-se para fora, assumindo aparência abaulada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apresentar exclusivamente franjas azuladas e avermelhadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'perder contraste sem sofrer alteração geométrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'convergir exclusivamente em razão da posição da câmera.', 0);

    -- Q252 (lote13.txt, questao original 52, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q252', N'Ao fotografar uma textura repetitiva muito fina cuja frequência espacial supera a capacidade adequada de amostragem do sensor, podem surgir padrões artificiais que não existiam originalmente na cena. Esse fenômeno está relacionado principalmente:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao aliasing e ao moiré.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao blooming.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à vinhetagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao flare.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao ruído de leitura.', 0);

    -- Q253 (lote13.txt, questao original 53, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q253', N'A função de um filtro óptico passa-baixas, historicamente utilizado diante de alguns sensores digitais, está associada principalmente a:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar deliberadamente a frequência espacial registrada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a ocorrência de aliasing e moiré mediante ligeira suavização das frequências espaciais mais altas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar o ruído causado por ISO elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'bloquear exclusivamente radiação infravermelha.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a resolução nominal do sensor.', 0);

    -- Q254 (lote13.txt, questao original 54, tema Edição de Imagens)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q254', N'Comparando dois arquivos da mesma imagem, um com 8 bits e outro com 16 bits por canal, é correto afirmar que a maior profundidade de bits:', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumenta necessariamente a resolução espacial da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permite representar maior quantidade de níveis tonais, favorecendo operações intensas de processamento com menor risco de posterização.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumenta necessariamente a distância focal equivalente da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'determina diretamente a faixa dinâmica óptica da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'torna impossível qualquer compressão do arquivo.', 0);

    -- Q255 (lote13.txt, questao original 55, tema Impressão)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q255', N'Uma imagem possui 3600 × 2400 pixels e será impressa, sem interpolação, com 300 pixels por polegada. O tamanho aproximado da impressão será:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'6 × 4 polegadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'8 × 5,3 polegadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'10 × 8 polegadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'12 × 8 polegadas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'18 × 12 polegadas.', 0);

    -- Q256 (lote13.txt, questao original 56, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q256', N'Em relação aos metadados IPTC, é correto afirmar que são particularmente associados:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'exclusivamente aos parâmetros eletrônicos de exposição gravados automaticamente pela câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'à inclusão de informações descritivas e editoriais, como autoria, legenda, palavras-chave e direitos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusivamente à calibração cromática do monitor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'à determinação do número-guia do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'à reconstrução dos componentes RGB durante o demosaicing.', 0);

    -- Q257 (lote13.txt, questao original 57, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q257', N'O padrão XMP, desenvolvido para gerenciamento de metadados, diferencia-se por:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ser obrigatoriamente armazenado apenas dentro de arquivos JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permitir estrutura extensível de metadados e, em determinados fluxos de trabalho, armazenamento das instruções de edição em arquivos auxiliares sidecar.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'substituir fisicamente os dados brutos do sensor durante a captura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'conter exclusivamente informações de geolocalização.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'impedir a utilização simultânea de informações EXIF e IPTC.', 0);

    -- Q258 (lote13.txt, questao original 58, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q258', N'Em fotografia com flash, o fotógrafo mantém ISO, abertura, distância flash-assunto e potência do flash constantes, mas altera o obturador de 1/60 s para 1/125 s, permanecendo abaixo da velocidade de sincronismo. Em uma situação na qual há também iluminação ambiente significativa:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'tanto a contribuição do flash quanto a ambiente diminuirão aproximadamente um ponto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a contribuição da luz ambiente diminuirá aproximadamente um ponto, enquanto a contribuição do flash permanecerá aproximadamente inalterada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apenas a contribuição do flash diminuirá um ponto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a contribuição ambiente permanecerá invariável porque luz contínua não depende do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a potência física do flash será automaticamente duplicada.', 0);

    -- Q259 (lote13.txt, questao original 59, tema Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q259', N'Um fotógrafo aproxima a câmera do objeto mantendo distância focal e abertura constantes. Ao refazer o foco em distância significativamente menor, a profundidade de campo tende, em condições comparáveis, a:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminuir.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'permanecer invariável.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'depender exclusivamente do ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'tornar-se infinita quando o objeto ultrapassa a distância hiperfocal.', 0);

    -- Q260 (lote13.txt, questao original 60, tema Histograma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q260', N'Ao registrar uma cena em RAW, o histograma apresentado no visor da câmera deve ser interpretado com cautela porque, em muitos sistemas:', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'é calculado exclusivamente a partir dos dados RAW lineares de cada fotodiodo, sem influência de qualquer processamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'deriva da pré-visualização processada incorporada ao arquivo, podendo ser influenciado por parâmetros como contraste, balanço de branco e estilo de imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'representa apenas o canal verde bruto do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ignora completamente a exposição realizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'representa diretamente a capacidade de carga elétrica individual de cada fotodiodo.', 0);

    -- Q261 (lote14.txt, questao original 61, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q261', N'Uma fotografia apresenta exposição adequada em ISO 400, f/8 e 1/250 s. O fotógrafo altera simultaneamente o ISO para 100 e a abertura para f/5,6. Para conservar a mesma exposição, deverá utilizar:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/1000 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/500 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/250 s', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/125 s', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/60 s', 0);

    -- Q262 (lote14.txt, questao original 62, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q262', N'Em relação à medição pontual (spot) presente em muitas câmeras, é correto afirmar que ela:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'mede exclusivamente o ponto de maior luminância do quadro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'considera uma área relativamente pequena do enquadramento e fornece exposição baseada na luminância refletida por essa região.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'mede diretamente a iluminação incidente sobre o objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'identifica automaticamente se a região medida deve ser reproduzida como branca, preta ou cinza.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'é necessariamente vinculada ao ponto central, independentemente do modelo da câmera.', 0);

    -- Q263 (lote14.txt, questao original 63, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q263', N'Um fotógrafo realiza medição spot sobre uma superfície branca e deseja que ela permaneça visualmente clara, preservando textura. Se simplesmente seguir a indicação de exposição do fotômetro refletido, a tendência será:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'registrar a superfície mais escura do que sua aparência esperada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'provocar necessariamente clipping da superfície.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reproduzi-la corretamente como branca porque o fotômetro reconhece sua cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar automaticamente a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'produzir resultado equivalente ao de uma medição incidente.', 0);

    -- Q264 (lote14.txt, questao original 64, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q264', N'Uma câmera registra uma cena em 1/500 s, f/4 e ISO 200. Para utilizar 1/125 s, mantendo ISO constante e preservando a mesma exposição por alteração exclusiva da abertura, deverá ser utilizada aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/2.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/2,8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/8.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/11.', 0);

    -- Q265 (lote14.txt, questao original 65, tema Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q265', N'Em um sistema óptico idealizado, fechar o diafragma de f/5,6 para f/16, mantendo distância focal, distância de foco e critério de círculo de confusão constantes, tende a:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diminuir a profundidade de campo e eliminar a difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a profundidade de campo, embora aberturas muito pequenas possam aumentar os efeitos da difração.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a profundidade de campo sem qualquer possibilidade de perda de resolução por difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar apenas a exposição, sem interferência sobre a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'diminuir simultaneamente a profundidade de campo e a distância hiperfocal.', 0);

    -- Q266 (lote14.txt, questao original 66, tema Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q266', N'Ao fechar progressivamente o diafragma de uma objetiva, a resolução percebida pode inicialmente melhorar devido à redução de determinadas aberrações e posteriormente diminuir devido à difração. Isso significa que:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a maior nitidez possível ocorre obrigatoriamente na menor abertura disponível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a abertura de melhor desempenho pode resultar de um equilíbrio entre aberrações ópticas e difração.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a difração desaparece quando as aberrações são corrigidas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a abertura máxima sempre apresenta a maior resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a resolução óptica independe da abertura utilizada.', 0);

    -- Q267 (lote14.txt, questao original 67, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q267', N'Uma objetiva apresenta distância focal de 50 mm. Quando instalada em uma câmera com sensor APS-C de fator de corte 1,5×, ela fornece campo de visão aproximadamente equivalente ao de qual distância focal em uma câmera full frame?', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'33 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'50 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'65 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'75 mm.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'100 mm.', 0);

    -- Q268 (lote14.txt, questao original 68, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q268', N'Na situação descrita na questão anterior, é tecnicamente correto afirmar que a instalação da objetiva de 50 mm na câmera APS-C:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'transforma fisicamente sua distância focal em 75 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumenta sua distância focal óptica para 75 mm, mas preserva a abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'mantém sua distância focal real em 50 mm, embora o campo de visão seja equivalente aproximadamente ao de 75 mm em full frame.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'altera simultaneamente a distância focal física e o diâmetro da abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'transforma a objetiva em teleobjetiva de 75 mm independentemente do formato utilizado como referência.', 0);

    -- Q269 (lote14.txt, questao original 69, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q269', N'Ao utilizar uma objetiva macro capaz de reprodução 1:1, essa indicação significa que:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o objeto será necessariamente impresso em tamanho real.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a imagem projetada do objeto sobre o sensor apresenta dimensão linear igual à dimensão correspondente do próprio objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a distância entre a objetiva e o objeto é igual à distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o objeto ocupa obrigatoriamente todo o sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a profundidade de campo será igual à distância focal da objetiva.', 0);

    -- Q270 (lote14.txt, questao original 70, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q270', N'Uma objetiva close-up de +4 dioptrias, considerada isoladamente e com a objetiva principal focalizada no infinito, corresponde aproximadamente a uma distância focal de:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'10 cm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'20 cm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'25 cm.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'40 cm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'4 m.', 0);

    -- Q271 (lote14.txt, questao original 71, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q271', N'Dois filtros close-up de +2 e +4 dioptrias são combinados. Desconsiderando efeitos ópticos secundários, a potência resultante será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'+2 dioptrias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'+4 dioptrias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'+6 dioptrias.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'+8 dioptrias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'+16 dioptrias.', 0);

    -- Q272 (lote14.txt, questao original 72, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q272', N'Um fotógrafo utiliza flash rebatido no teto em vez de direcioná-lo diretamente para o assunto. Mantidas as demais condições, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a distância relevante para a exposição continua sendo exclusivamente a distância linear câmera-assunto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o percurso óptico da luz aumenta e há perdas por reflexão, podendo ser necessária maior potência ou abertura em relação ao flash direto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o número-guia do flash aumenta devido à reflexão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a luz rebatida será necessariamente mais dura que a luz direta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a refletância e a cor do teto não interferem no resultado.', 0);

    -- Q273 (lote14.txt, questao original 73, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q273', N'Um flash é rebatido em uma parede intensamente colorida. Mesmo que a exposição luminosa seja suficiente, pode ocorrer:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'alteração cromática da luz refletida pela parede.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'eliminação automática de qualquer dominante cromática pelo flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução da distância focal efetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'transformação da luz refletida em luz de temperatura de cor invariavelmente igual à luz do dia.', 0);

    -- Q274 (lote14.txt, questao original 74, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q274', N'Em relação à lei do inverso do quadrado aplicada à iluminação, se uma pequena fonte luminosa é deslocada de 2 metros para 4 metros do assunto, mantendo-se constante sua emissão, a iluminância sobre o assunto será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'duas vezes maior.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'metade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'um quarto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'um oitavo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'um dezesseis avos.', 0);

    -- Q275 (lote14.txt, questao original 75, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q275', N'Considerando novamente uma fonte aproximadamente pontual, para compensar exclusivamente pela abertura uma redução da iluminância para 1/4 do valor original, seria necessário, por exemplo, alterar:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/4 para f/2.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/4 para f/2,8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/4 para f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/4 para f/8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/4 para f/11.', 0);

    -- Q276 (lote14.txt, questao original 76, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q276', N'Durante uma fotografia sob iluminação fluorescente ou LED, determinadas fontes podem apresentar distribuição espectral descontínua. Nesse contexto, um ajuste correto de balanço de branco:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'garante necessariamente reprodução perfeita de todas as cores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'pode neutralizar determinada dominante global, mas não consegue necessariamente corrigir deficiências espectrais da própria fonte.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'recompõe comprimentos de onda que não foram emitidos pela fonte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'torna irrelevante o índice de reprodução de cor da iluminação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumenta fisicamente a quantidade de cores captadas pelo sensor.', 0);

    -- Q277 (lote14.txt, questao original 77, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q277', N'O índice de reprodução de cor, tradicionalmente indicado por CRI ou IRC, busca expressar:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a intensidade luminosa total da fonte em lúmens.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a capacidade da fonte de reproduzir cores de objetos em comparação com uma fonte de referência apropriada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusivamente a temperatura de cor correlata da fonte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a potência elétrica consumida pela iluminação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a faixa dinâmica máxima da câmera sob aquela iluminação.', 0);

    -- Q278 (lote14.txt, questao original 78, tema RGB)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q278', N'Em relação aos espaços de cor sRGB e Adobe RGB, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Adobe RGB possui, em determinadas regiões cromáticas, gamut mais amplo que sRGB.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sRGB possui sempre gamut maior que Adobe RGB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Adobe RGB aumenta fisicamente a quantidade de fótons capturada pelo sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sRGB somente pode ser utilizado em JPEG e Adobe RGB somente em RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ambos possuem exatamente o mesmo gamut, diferenciando-se apenas pelos metadados EXIF.', 0);

    -- Q279 (lote14.txt, questao original 79, tema RGB)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q279', N'Uma imagem em espaço Adobe RGB é interpretada incorretamente como se seus valores RGB pertencessem ao espaço sRGB, sem conversão apropriada. A consequência pode ser:', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'alteração da aparência das cores devido à interpretação dos mesmos valores numéricos segundo outro espaço de cor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento da resolução espacial da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'perda automática dos dados EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alteração da distância focal registrada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'transformação dos dados de 8 bits em 16 bits.', 0);

    -- Q280 (lote14.txt, questao original 80, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q280', N'Durante a conversão analógico-digital em uma câmera, o conversor A/D tem como função fundamental:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'transformar a carga ou sinal elétrico analógico proveniente do sistema sensor em valores digitais discretos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'converter diretamente arquivos RAW em JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reconstruir exclusivamente os canais ausentes da matriz Bayer.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'determinar mecanicamente a abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'converter valores RGB em coordenadas GPS.', 0);

    -- Q281 (lote15.txt, questao original 81, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q281', N'Uma fotografia é realizada sob iluminação de tungstênio com temperatura de cor próxima de 3200 K. A câmera, entretanto, está configurada manualmente para balanço de branco de 7000 K. Mantidas as demais condições, a imagem tenderá a apresentar:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'dominante azul intensa, pois a câmera reduzirá a compensação dos tons frios.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'dominante quente, pois a câmera aplicará compensação destinada a uma iluminação considerada muito mais fria.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'neutralidade cromática, porque temperaturas de cor diferentes afetam apenas a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'dominante verde, porque temperaturas acima de 6500 K correspondem necessariamente ao eixo verde-magenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'redução da saturação sem alteração significativa da tonalidade.', 0);

    -- Q282 (lote15.txt, questao original 82, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q282', N'Em relação à escala Kelvin aplicada à fotografia, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'valores Kelvin mais elevados correspondem fisicamente a fontes de aparência necessariamente mais avermelhada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a luz de uma lâmpada de tungstênio possui normalmente temperatura de cor superior à luz do céu azul.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a luz do dia/flash situa-se tipicamente em torno de 5200–5600 K, enquanto uma fonte de tungstênio fotográfico pode situar-se aproximadamente em 3200 K.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sombra aberta apresenta necessariamente temperatura de cor inferior a 3200 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a escala Kelvin mede diretamente a intensidade luminosa incidente.', 0);

    -- Q283 (lote15.txt, questao original 83, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q283', N'Ao fotografar uma pessoa na sombra em ambiente externo, a iluminação pode apresentar temperatura de cor relativamente elevada, por exemplo, 7000 K ou mais. Para neutralizar a aparência azulada dessa iluminação, o balanço de branco da câmera tende a:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'adicionar compensação cromática mais quente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'adicionar ainda mais azul.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir exclusivamente a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar o ISO sem modificar os canais de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'atuar apenas sobre o eixo verde-magenta.', 0);

    -- Q284 (lote15.txt, questao original 84, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q284', N'Um fotógrafo configura manualmente o balanço de branco em 3000 K ao fotografar uma cena iluminada por luz do dia de aproximadamente 5500 K. A tendência será produzir uma fotografia:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'mais amarelada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'mais avermelhada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'mais azulada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'necessariamente esverdeada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'cromaticamente idêntica à obtida em 5500 K.', 0);

    -- Q285 (lote15.txt, questao original 85, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q285', N'Sobre temperatura de cor e balanço de branco, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A temperatura de cor de uma fonte e a configuração Kelvin da câmera produzem efeitos cromáticos sempre no mesmo sentido visual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Configurar na câmera um valor Kelvin maior tende a produzir compensação mais quente na imagem, enquanto selecionar um valor menor tende a produzir compensação mais fria.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A configuração Kelvin modifica fisicamente a temperatura de cor da fonte luminosa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O ajuste Kelvin controla apenas a luminosidade da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Valores Kelvin altos na câmera sempre deixam a imagem azul porque representam fontes fisicamente azuladas.', 0);

    -- Q286 (lote15.txt, questao original 86, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q286', N'Uma exposição sem filtro é corretamente realizada em 1/125 s, f/8 e ISO 100. Instala-se um filtro ND8, mantendo-se abertura e ISO. O novo tempo deverá ser aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/60 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/30 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/15 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/8 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/4 s.', 0);

    -- Q287 (lote15.txt, questao original 87, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q287', N'Um filtro ND reduz a quantidade de luz que chega ao sensor sem ter, idealmente, como finalidade alterar significativamente a reprodução cromática. Sua utilização é especialmente adequada quando o fotógrafo pretende:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir reflexos em superfícies não metálicas por polarização seletiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar tempos de exposição maiores ou aberturas maiores em condições de iluminação intensa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a temperatura de cor da iluminação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ampliar opticamente a distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar aberração cromática longitudinal.', 0);

    -- Q288 (lote15.txt, questao original 88, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q288', N'Em relação ao filtro polarizador, seu efeito de intensificação aparente do azul do céu tende a ser mais pronunciado quando a direção de tomada forma aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'0° em relação ao Sol.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'30° em relação ao Sol.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'45° em relação ao Sol.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'90° em relação ao Sol.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'180° em relação ao Sol.', 0);

    -- Q289 (lote15.txt, questao original 89, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q289', N'Ao utilizar um polarizador em uma objetiva ultra grande-angular para fotografar um céu amplo, pode ocorrer uma distribuição visualmente desigual do escurecimento do céu principalmente porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o polarizador altera sua densidade óptica conforme a distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a grande extensão angular enquadrada inclui regiões do céu situadas em diferentes ângulos em relação ao Sol, nas quais a polarização atmosférica possui intensidades diferentes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'grande-angulares impedem fisicamente a polarização da luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sensores digitais não conseguem registrar luz polarizada nas extremidades.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o fator de corte modifica a temperatura de cor do filtro.', 0);

    -- Q290 (lote15.txt, questao original 90, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q290', N'Uma cena requer 1/1000 s em f/2,8, mas o fotógrafo deseja utilizar 1/125 s em f/2,8, mantendo ISO constante, para obter determinado efeito de movimento. Para preservar a exposição, deverá utilizar um filtro ND de aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
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
    VALUES (@idQuestao, 'E', N'8 stops.', 0);

    -- Q291 (lote15.txt, questao original 91, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q291', N'Um flash possui número-guia 36 em ISO 100. Utilizado diretamente, em potência total, para fotografar um objeto situado a 4,5 m, a abertura teórica correspondente será:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/8.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/16.', 0);

    -- Q292 (lote15.txt, questao original 92, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q292', N'Um flash apresenta NG 32 em ISO 100. Mantidas potência, posição do flash e distância flash-assunto, o fotógrafo aumenta o ISO para 400. O número-guia equivalente passa teoricamente para:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'40.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'45.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'56.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'64.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'128.', 0);

    -- Q293 (lote15.txt, questao original 93, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q293', N'Em fotografia com flash manual, mantendo ISO, abertura e potência constantes, o flash é deslocado de 2 m para 4 m do assunto. Desconsiderando outras perdas, a iluminância proveniente do flash que atinge o assunto passa a ser aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'metade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'um quarto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'um oitavo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'um dezesseis avos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a mesma, pois o número-guia permanece constante.', 0);

    -- Q294 (lote15.txt, questao original 94, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q294', N'Durante uma fotografia noturna, o assunto principal é iluminado predominantemente por um flash de curta duração, enquanto o fundo recebe iluminação ambiente contínua. Mantendo ISO, abertura e potência do flash constantes, aumentar o tempo de exposição de 1/125 s para 1/30 s, dentro das condições normais de sincronismo, tende a:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar em aproximadamente dois pontos tanto a exposição do flash quanto a do ambiente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar principalmente a exposição da luz ambiente, com pouca ou nenhuma alteração na contribuição do flash sobre o assunto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar exclusivamente a potência física emitida pelo flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir a exposição do assunto iluminado pelo flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'não alterar a aparência do fundo.', 0);

    -- Q295 (lote15.txt, questao original 95, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q295', N'Um fotógrafo utiliza um fotômetro de luz refletida sobre uma superfície que reflete muito menos luz que um tom médio. Se seguir diretamente a indicação do instrumento, sem compensação, a tendência é:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'registrar essa superfície mais clara do que sua aparência natural esperada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'registrar essa superfície ainda mais escura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'obter necessariamente clipping das altas luzes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'produzir o mesmo resultado de uma medição incidente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar apenas o balanço de branco.', 0);

    -- Q296 (lote15.txt, questao original 96, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q296', N'Em uma cena contendo um objeto branco e outro preto submetidos à mesma iluminação, um fotômetro incidente corretamente posicionado junto aos objetos tende a fornecer:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'exposições radicalmente diferentes para cada objeto porque suas refletâncias são diferentes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'uma indicação baseada principalmente na quantidade de luz que chega à cena, e não na refletância individual dos objetos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'uma indicação determinada exclusivamente pelo objeto branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'uma indicação determinada exclusivamente pelo objeto preto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'uma leitura da diferença de temperatura de cor entre os objetos.', 0);

    -- Q297 (lote15.txt, questao original 97, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q297', N'Uma objetiva de 24 mm é utilizada em uma câmera APS-C com fator de corte 1,5×. Em termos de campo de visão, o conjunto corresponde aproximadamente a qual distância focal utilizada em full frame?', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'16 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'24 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'32 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'36 mm.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'48 mm.', 0);

    -- Q298 (lote15.txt, questao original 98, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q298', N'Uma objetiva de 200 mm f/2,8 é instalada em uma câmera com fator de corte 1,5×. Considerando apenas as propriedades físicas da objetiva, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ela se transforma fisicamente em uma 300 mm f/4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ela se transforma em uma 300 mm f/2,8, inclusive quanto à distância focal física.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'continua sendo uma 200 mm f/2,8, mas fornece campo de visão semelhante ao de uma 300 mm em full frame.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'torna-se uma 133 mm f/2,8 porque o sensor registra apenas a região central da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sua abertura física passa automaticamente para f/4,2.', 0);

    -- Q299 (lote15.txt, questao original 99, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q299', N'Dois fotógrafos utilizam câmeras posicionadas no mesmo ponto, uma full frame e outra APS-C 1,5×. Ambos utilizam a mesma objetiva de 50 mm e mantêm a mesma distância até o assunto. Desconsiderando diferenças de resolução, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a câmera APS-C altera a perspectiva geométrica porque seu fator de corte aumenta a distância focal física.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a perspectiva geométrica permanece essencialmente a mesma, embora o APS-C registre um campo de visão mais estreito.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o APS-C produz necessariamente maior compressão de perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o full frame produz necessariamente maior compressão porque registra área maior.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'as duas câmeras registram exatamente o mesmo enquadramento.', 0);

    -- Q300 (lote15.txt, questao original 100, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q300', N'Um fotógrafo deseja obter, em uma câmera APS-C 1,5×, aproximadamente o mesmo campo de visão fornecido por uma objetiva de 50 mm em full frame. A distância focal mais próxima a ser utilizada no APS-C será:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'24 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'28 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'33 mm.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'50 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'75 mm.', 0);

    -- Q301 (lote16.txt, questao original 101, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q301', N'Durante a análise de um arquivo fotográfico digital, encontram-se dados referentes a modelo da câmera, distância focal, ISO, abertura e tempo de exposição. Tais informações são tipicamente armazenadas como metadados:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'IPTC.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ICC.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'EXIF.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'XMP exclusivamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'SHA-256.', 0);

    -- Q302 (lote16.txt, questao original 102, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q302', N'Em um fluxo de fotografia jornalística, deseja-se acrescentar ao arquivo informações como autoria, legenda, palavras-chave, crédito e direitos autorais. O padrão tradicionalmente associado a esse tipo de informação editorial é:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'IPTC.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'FAT32.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'DNG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Bayer.', 0);

    -- Q303 (lote16.txt, questao original 103, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q303', N'Sobre o padrão XMP utilizado no gerenciamento de metadados, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Destina-se exclusivamente ao armazenamento dos parâmetros originais de exposição registrados pela câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Pode armazenar metadados de maneira extensível e, em determinados fluxos de edição não destrutiva, as instruções podem ser mantidas em arquivo sidecar associado ao original.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'É um algoritmo criptográfico utilizado para verificar a integridade do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Substitui obrigatoriamente todos os metadados EXIF no momento da importação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Só pode existir incorporado a arquivos JPEG.', 0);

    -- Q304 (lote16.txt, questao original 104, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q304', N'Um arquivo RAW permanece fisicamente inalterado, mas um software registra em um arquivo XMP sidecar alterações de exposição, contraste e balanço de branco. Nesse fluxo:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'os valores originais dos fotodiodos foram necessariamente sobrescritos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'as instruções de edição podem ser aplicadas pelo software sem modificar diretamente os dados brutos originais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o XMP gera obrigatoriamente um novo sensor virtual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o arquivo RAW perde seus dados EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a edição passa necessariamente a ser destrutiva após o fechamento do programa.', 0);

    -- Q305 (lote16.txt, questao original 105, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q305', N'Em um procedimento de preservação de evidência fotográfica digital, calcula-se o hash SHA-256 de determinado arquivo. Posteriormente, o hash é novamente calculado e apresenta valor diferente do originalmente registrado. Considerando o procedimento corretamente realizado, isso constitui forte indicação de que:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o arquivo foi necessariamente visualizado em outro monitor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a sequência de dados do arquivo sofreu alguma alteração.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'os metadados EXIF foram apenas lidos pelo sistema operacional.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o espaço de cor do monitor foi alterado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a resolução física do monitor foi modificada.', 0);

    -- Q306 (lote16.txt, questao original 106, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q306', N'Sobre o uso de funções hash na verificação de integridade de arquivos digitais, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'dois arquivos de tamanhos diferentes sempre geram hashes de tamanhos diferentes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o hash permite, por si só, reconstruir integralmente o arquivo original.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'uma função hash criptográfica produz um resumo de tamanho definido, sendo alterações nos dados do arquivo normalmente refletidas em um resultado diferente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o hash substitui integralmente qualquer procedimento de cadeia de custódia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'calcular o hash modifica necessariamente os dados do arquivo analisado.', 0);

    -- Q307 (lote16.txt, questao original 107, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q307', N'Uma fotografia é copiada de um cartão de memória para uma unidade de armazenamento. O hash do arquivo de origem e o da cópia são calculados com o mesmo algoritmo e apresentam exatamente o mesmo valor. A conclusão tecnicamente adequada é que:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a fotografia não poderá ser alterada no futuro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'os dois arquivos possuem, com altíssima confiança para uma função criptográfica apropriada, o mesmo conteúdo binário no momento da verificação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ambos foram necessariamente produzidos pela mesma câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'seus nomes, caminhos e datas do sistema de arquivos são obrigatoriamente iguais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a fotografia jamais sofreu qualquer edição antes da geração do primeiro hash.', 0);

    -- Q308 (lote16.txt, questao original 108, tema RGB)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q308', N'No modelo aditivo RGB empregado na formação de imagens em dispositivos emissores de luz, a combinação de vermelho e verde, em intensidades apropriadas e na ausência do azul, produz:', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ciano.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'magenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'amarelo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'preto.', 0);

    -- Q309 (lote16.txt, questao original 109, tema RGB)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q309', N'Considerando o modelo aditivo RGB, assinale a associação correta entre cores complementares.', 1,
        (SELECT id FROM temas WHERE nome = N'RGB'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'vermelho – amarelo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'verde – magenta.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'azul – ciano.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'vermelho – magenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'verde – amarelo.', 0);

    -- Q310 (lote16.txt, questao original 110, tema Edição de Imagens)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q310', N'Uma imagem destinada à visualização na web é convertida de Adobe RGB para sRGB mediante gerenciamento de cor apropriado. Essa operação:', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumenta obrigatoriamente o número de pixels da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'busca preservar, dentro das limitações dos gamuts envolvidos, a aparência das cores ao transformar os valores numéricos para o espaço de destino.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'equivale simplesmente a atribuir o perfil sRGB sem alterar os valores RGB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'altera obrigatoriamente a profundidade de bits para 16 bits.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'elimina os metadados EXIF do arquivo.', 0);

    -- Q311 (lote16.txt, questao original 111, tema Edição de Imagens)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q311', N'A respeito da diferença entre atribuir um perfil e converter para um perfil de cor, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ambas as operações são necessariamente idênticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'atribuir um perfil modifica a interpretação dos valores RGB existentes, enquanto converter busca recalcular os valores para preservar a aparência das cores no novo espaço.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'converter um perfil modifica exclusivamente a resolução espacial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'atribuir um perfil sempre preserva a aparência visual original.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'nenhuma dessas operações interfere na interpretação cromática da imagem.', 0);

    -- Q312 (lote16.txt, questao original 112, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q312', N'Nos sensores digitais que utilizam matriz de filtros de cor Bayer, cada fotossítio convencionalmente registra diretamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'os valores completos de vermelho, verde e azul simultaneamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'principalmente a intensidade luminosa correspondente à faixa transmitida pelo filtro de cor associado àquele fotossítio.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusivamente a luminância final já processada em JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'os três canais RGB após o demosaicing.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apenas dados de temperatura de cor.', 0);

    -- Q313 (lote16.txt, questao original 113, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q313', N'Em um sensor BSI (back-side illuminated), a arquitetura busca melhorar a eficiência de captação principalmente por:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'posicionar estruturas e fiação de modo a reduzir obstáculos no caminho da luz até a região fotossensível.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'eliminar completamente a necessidade de conversão analógico-digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar obrigatoriamente as dimensões físicas do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir todos os filtros de cor por filtros ND.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar a geração de ruído eletrônico em qualquer ISO.', 0);

    -- Q314 (lote16.txt, questao original 114, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q314', N'Comparando genericamente tecnologias CCD e CMOS, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sensores CMOS não utilizam fotodiodos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sensores CCD são incapazes de produzir imagens coloridas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'sensores CMOS permitem maior integração de circuitos de leitura e processamento no próprio chip e tornaram-se predominantes nas câmeras digitais modernas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sensores CMOS não apresentam ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente sensores CCD podem utilizar matriz Bayer.', 0);

    -- Q315 (lote16.txt, questao original 115, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q315', N'Após a conversão do sinal analógico do sensor em dados digitais, o processador de imagem da câmera pode executar operações como:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'demosaicing, redução de ruído, aplicação de balanço de branco, nitidez e geração de JPEG.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'alteração física da distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento físico da área fotossensível do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'transformação de um sensor APS-C em full frame.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'modificação física do diâmetro dos fotodiodos após a captura.', 0);

    -- Q316 (lote16.txt, questao original 116, tema Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q316', N'Em uma câmera configurada simultaneamente para RAW + JPEG, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ambos os arquivos possuem necessariamente exatamente o mesmo nível de processamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o JPEG normalmente recebe processamento mais definido pela câmera, enquanto o RAW preserva dados com maior possibilidade de interpretação posterior.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o RAW é produzido pela descompressão posterior do JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o JPEG contém obrigatoriamente maior profundidade de bits que o RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o RAW não pode possuir pré-visualização incorporada.', 0);

    -- Q317 (lote16.txt, questao original 117, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q317', N'Um cartão de memória apresenta a inscrição V30. Essa classificação está relacionada à garantia de uma velocidade mínima de gravação sequencial de aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'3 MB/s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'10 MB/s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'30 MB/s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'60 MB/s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'300 MB/s.', 0);

    -- Q318 (lote16.txt, questao original 118, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q318', N'Uma câmera possui dois slots para cartões e está configurada para gravar simultaneamente cada fotografia nos dois cartões. Do ponto de vista da segurança dos dados durante a captura, essa configuração:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'constitui necessariamente um sistema completo de backup segundo a regra 3-2-1.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'oferece redundância imediata contra a falha de um dos cartões, mas não substitui uma estratégia completa de backup independente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'impede a corrupção simultânea dos arquivos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'elimina a necessidade de copiar posteriormente as imagens para outro meio.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'protege os arquivos contra qualquer exclusão acidental realizada pela própria câmera.', 0);

    -- Q319 (lote16.txt, questao original 119, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q319', N'De acordo com a conhecida estratégia de backup 3-2-1, uma organização adequada dos arquivos fotográficos pressupõe:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'três arquivos no mesmo disco, dois diretórios diferentes e uma cópia compactada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'três cópias dos dados, armazenadas em pelo menos dois tipos/meios de armazenamento, mantendo uma cópia fora do local principal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'três cartões SD obrigatoriamente idênticos, dois computadores e uma câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'três arquivos RAW, duas versões JPEG e um arquivo TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'três cópias obrigatoriamente em nuvem, distribuídas entre dois provedores.', 0);

    -- Q320 (lote16.txt, questao original 120, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q320', N'Após um ensaio, o fotógrafo copia as imagens do cartão para um computador e imediatamente formata o cartão, mantendo como única cópia o disco interno desse computador. Sob a perspectiva de preservação dos dados, o procedimento é inadequado principalmente porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'discos internos não conseguem armazenar arquivos RAW corretamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'após a formatação do cartão, resta apenas uma cópia efetiva, de modo que uma falha do disco pode causar perda dos dados.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'cartões de memória nunca devem ser formatados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'arquivos fotográficos somente são seguros quando armazenados em cartões SD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a formatação modifica automaticamente os arquivos já copiados para o computador.', 0);

    -- Q321 (lote17.txt, questao original 121, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q321', N'Dois fotógrafos registram o mesmo edifício com uma câmera full frame. O primeiro utiliza uma objetiva de 24 mm e o segundo uma de 85 mm. Para obter aproximadamente o mesmo enquadramento do edifício, o segundo fotógrafo afasta-se consideravelmente. As diferenças de perspectiva observadas entre as fotografias decorrem principalmente:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'da distância focal, independentemente da posição da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'da alteração da distância entre a câmera e a cena necessária para conservar o enquadramento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusivamente da maior profundidade de campo da objetiva de 85 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do maior círculo de imagem produzido obrigatoriamente pela teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'da abertura máxima das duas objetivas.', 0);

    -- Q322 (lote17.txt, questao original 122, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q322', N'Uma objetiva de 50 mm é utilizada em uma câmera full frame. Sem alterar a posição da câmera, ela é substituída por uma objetiva de 100 mm. Considerando apenas geometria e enquadramento, a segunda objetiva:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'modifica a perspectiva entre os elementos da cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'registra campo de visão mais estreito, mas preserva a perspectiva determinada pela posição da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'comprime fisicamente a distância entre os objetos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'duplica a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'altera a perspectiva porque toda teleobjetiva produz compressão óptica.', 0);

    -- Q323 (lote17.txt, questao original 123, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q323', N'Uma objetiva de 35 mm instalada em uma câmera APS-C com fator de corte 1,5× fornece campo de visão aproximadamente equivalente, em full frame, a:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'23 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'35 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'42 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'52,5 mm.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'70 mm.', 0);

    -- Q324 (lote17.txt, questao original 124, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q324', N'Uma objetiva 70–200 mm f/2,8 é instalada em uma câmera APS-C 1,5×. É correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'transforma-se fisicamente em uma 105–300 mm f/4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'transforma-se fisicamente em uma 105–300 mm f/2,8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'permanece uma 70–200 mm f/2,8, mas apresenta campo de visão equivalente aproximadamente ao de uma 105–300 mm em full frame.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'torna-se uma 47–133 mm f/2,8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sua abertura máxima passa necessariamente a f/4,2.', 0);

    -- Q325 (lote17.txt, questao original 125, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q325', N'Sobre uma objetiva zoom 24–70 mm f/2,8, a indicação f/2,8 significa, em condições normais de especificação, que:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o diâmetro físico da pupila de entrada permanece invariavelmente igual durante todo o zoom.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a abertura relativa máxima f/2,8 está disponível ao longo da faixa focal especificada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a distância focal permanece constante e apenas o campo de visão é alterado eletronicamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a abertura física possui obrigatoriamente 2,8 mm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/2,8 representa a distância mínima de foco.', 0);

    -- Q326 (lote17.txt, questao original 126, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q326', N'Uma objetiva zoom é especificada como 18–55 mm f/3,5–5,6. Essa indicação significa que:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a abertura máxima é f/3,5 em toda a faixa e a mínima é f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a abertura máxima disponível varia com a distância focal, sendo tipicamente f/3,5 na extremidade de 18 mm e f/5,6 na de 55 mm.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a objetiva somente pode utilizar valores entre f/3,5 e f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/3,5 corresponde ao ângulo de visão e f/5,6 à ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a objetiva perde necessariamente foco ao alterar a distância focal.', 0);

    -- Q327 (lote17.txt, questao original 127, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q327', N'Considerando uma objetiva simples idealizada, o número f é definido pela relação entre:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'distância focal e diâmetro da pupila de entrada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'distância focal e diâmetro físico do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'distância focal e distância do objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diâmetro do sensor e distância mínima de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ampliação e círculo de confusão.', 0);

    -- Q328 (lote17.txt, questao original 128, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q328', N'Duas objetivas possuem, respectivamente, distâncias focais de 50 mm e 100 mm, ambas ajustadas em f/4. Em termos de número f, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a abertura física relevante deve possuir exatamente o mesmo diâmetro nas duas objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a objetiva de 100 mm necessita de pupila de entrada aproximadamente duas vezes maior em diâmetro para apresentar o mesmo f/4.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a objetiva de 50 mm possui necessariamente pupila de entrada maior.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/4 significa diâmetro físico de 4 mm em ambas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a distância focal não participa da definição do número f.', 0);

    -- Q329 (lote17.txt, questao original 129, tema Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q329', N'Em relação à profundidade de campo, mantendo-se distância focal, distância de foco, formato do sensor e critério de nitidez constantes, fechar o diafragma de f/4 para f/11 tende a:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'manter a profundidade de campo inalterada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar apenas o ângulo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a distância focal real.', 0);

    -- Q330 (lote17.txt, questao original 130, tema Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q330', N'A distância hiperfocal pode ser definida, de maneira prática, como a distância de foco que:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'produz a menor profundidade de campo possível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'mantém o infinito dentro do limite aceitável de profundidade de campo enquanto maximiza a extensão de nitidez aceitável em direção à câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'corresponde sempre ao dobro da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'coincide necessariamente com a distância mínima de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'torna todos os planos entre a objetiva e o infinito perfeitamente focalizados.', 0);

    -- Q331 (lote17.txt, questao original 131, tema Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q331', N'Quando uma objetiva é focalizada aproximadamente na distância hiperfocal, o limite próximo da profundidade de campo situase, em uma aproximação frequentemente utilizada:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'na própria distância hiperfocal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aproximadamente na metade da distância hiperfocal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'no dobro da distância hiperfocal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'na distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'necessariamente a um metro da câmera.', 0);

    -- Q332 (lote17.txt, questao original 132, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q332', N'Uma objetiva macro especificada como 1:1 é capaz de produzir, na distância de reprodução correspondente:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'uma imagem do objeto no sensor com metade de seu tamanho linear real.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'uma imagem do objeto no sensor com tamanho linear igual ao do objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'uma imagem duas vezes maior que o objeto no sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'uma imagem cujo tamanho depende exclusivamente do fator de corte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'uma imagem que obrigatoriamente ocupa 100% da área do sensor.', 0);

    -- Q333 (lote17.txt, questao original 133, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q333', N'Duas objetivas macro, uma de 60 mm e outra de 180 mm, são capazes de atingir ampliação 1:1. Em termos gerais, uma vantagem prática da macro de maior distância focal pode ser:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'produzir ampliação superior a 1:1 apenas por possuir maior distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permitir atingir a mesma ampliação com maior distância de trabalho em muitos projetos ópticos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar a necessidade de focalização.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'produzir profundidade de campo infinitamente maior em 1:1.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar a perda de luz associada à focalização próxima.', 0);

    -- Q334 (lote17.txt, questao original 134, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q334', N'A adição de um tubo extensor entre a câmera e uma objetiva convencional:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'adiciona elementos ópticos convergentes e aumenta necessariamente a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumenta a distância entre a objetiva e o plano do sensor, favorecendo foco em distâncias menores e maior ampliação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'transforma obrigatoriamente qualquer objetiva em macro 1:1.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumenta a distância de foco mínima, impedindo aproximação do objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'preserva necessariamente a capacidade de focalização no infinito.', 0);

    -- Q335 (lote17.txt, questao original 135, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q335', N'Uma consequência comum do uso de tubos extensores é:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da capacidade de focalização no infinito.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'perda ou limitação da focalização em grandes distâncias, inclusive no infinito.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'redução obrigatória da ampliação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'transformação da objetiva em olho-de-peixe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminação da necessidade de compensação de exposição em macrofotografia.', 0);

    -- Q336 (lote17.txt, questao original 136, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q336', N'As objetivas catadióptricas caracterizam-se por utilizar:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'exclusivamente elementos refrativos convencionais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'combinação de elementos refrativos e reflexivos, incluindo espelhos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusivamente filtros de difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'somente elementos eletrônicos, sem componentes ópticos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'dois sensores posicionados no interior da objetiva.', 0);

    -- Q337 (lote17.txt, questao original 137, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q337', N'Um efeito visual frequentemente associado a determinadas objetivas catadióptricas é:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'bokeh com destaques luminosos em formato aproximadamente anular.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'eliminação total de reflexos especulares.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'transformação automática de círculos de desfoque em hexágonos sólidos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'impossibilidade de desfocar o fundo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'produção obrigatória de distorção olho-de-peixe.', 0);

    -- Q338 (lote17.txt, questao original 138, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q338', N'Uma objetiva apresenta distorção de almofada (pincushion). Ao fotografar uma grade plana e corretamente alinhada, as linhas próximas às bordas tendem a:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'curvar-se para fora, produzindo aspecto abaulado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'curvar-se para dentro, em direção ao centro do quadro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apresentar apenas franjas cromáticas, sem deformação geométrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'permanecer retas, mas perder saturação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'convergir devido exclusivamente à perspectiva.', 0);

    -- Q339 (lote17.txt, questao original 139, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q339', N'Uma objetiva apresenta pontos luminosos próximos às extremidades do quadro com aparência assimétrica semelhante a pequenas “caudas”, especialmente em grandes aberturas. A aberração mais compatível com essa descrição é:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'distorção de barril.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aberração cromática lateral.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'coma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'vinhetagem.', 0);

    -- Q340 (lote17.txt, questao original 140, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q340', N'Ao comparar uma objetiva prime de 50 mm com uma zoom ajustada exatamente em 50 mm, ambas instaladas na mesma câmera e posicionadas no mesmo ponto, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a prime produzirá necessariamente perspectiva diferente por possuir distância focal fixa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a zoom produzirá necessariamente maior compressão de perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'se as distâncias focais efetivas e a posição da câmera forem equivalentes, o campo de visão e a perspectiva geométrica podem ser essencialmente equivalentes, embora outras características ópticas possam diferir.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a prime sempre produzirá maior profundidade de campo na mesma abertura e distância de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'uma objetiva zoom não pode reproduzir o mesmo ângulo de visão de uma prime.', 0);

    -- Q341 (lote18.txt, questao original 141, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q341', N'Duas fotografias são realizadas do mesmo ponto, com uma câmera full frame, utilizando objetivas de 50 mm e 100 mm. Posteriormente, a imagem obtida com 50 mm é recortada até apresentar o mesmo enquadramento da obtida com 100 mm. Desconsiderando resolução e diferenças ópticas, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a imagem de 100 mm apresenta perspectiva mais comprimida exclusivamente pela distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'as perspectivas geométricas são essencialmente iguais, pois a posição da câmera permaneceu a mesma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a imagem recortada apresenta perspectiva típica de grande-angular.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a perspectiva depende da abertura utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o recorte modifica geometricamente as relações de perspectiva.', 0);

    -- Q342 (lote18.txt, questao original 142, tema Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q342', N'Uma objetiva possui distância mínima de foco especificada em 0,30 m. Essa distância é normalmente considerada:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'entre a extremidade frontal da objetiva e o objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'entre o plano focal/sensor e o objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'entre o centro óptico exato da objetiva e o objeto, obrigatoriamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'entre o diafragma e o objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'entre o para-sol e o objeto.', 0);

    -- Q343 (lote18.txt, questao original 143, tema Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q343', N'Uma objetiva macro apresenta distância mínima de foco de 30 cm, mas sua distância de trabalho na ampliação máxima é consideravelmente menor. Isso ocorre porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'distância mínima de foco e distância de trabalho são necessariamente medidas a partir do mesmo ponto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a distância mínima de foco é normalmente considerada a partir do plano do sensor, enquanto a distância de trabalho corresponde aproximadamente ao espaço entre a parte frontal da objetiva e o assunto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a distância de trabalho é medida exclusivamente entre o sensor e o diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a distância mínima de foco não inclui o comprimento da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a distância de trabalho corresponde sempre à distância focal nominal.', 0);

    -- Q344 (lote18.txt, questao original 144, tema Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q344', N'Em uma objetiva com sistema de focalização interna (internal focusing):', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o foco somente pode ser alterado movimentando toda a objetiva para frente e para trás.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a focalização ocorre por movimentação de grupos ópticos internos, podendo evitar ou reduzir a extensão física externa da objetiva durante o foco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a distância focal permanece matematicamente invariável em qualquer distância de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a objetiva torna-se obrigatoriamente parfocal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a distância mínima de foco passa necessariamente a ser igual à distância focal.', 0);

    -- Q345 (lote18.txt, questao original 145, tema Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q345', N'Algumas objetivas com focalização interna apresentam redução do ângulo de ampliação efetivo em distâncias muito curtas, fenômeno relacionado às alterações da distância focal efetiva durante a focalização. Essa característica está relacionada:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'exclusivamente à difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao focus breathing.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à distorção de barril.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'à aberração cromática lateral.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao número-guia.', 0);

    -- Q346 (lote18.txt, questao original 146, tema Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q346', N'Uma objetiva zoom é considerada parfocal quando:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'mantém aproximadamente o foco no mesmo plano enquanto sua distância focal é alterada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'mantém necessariamente a mesma abertura física durante todo o zoom.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apresenta apenas uma distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'altera propositalmente o foco sempre que a distância focal é modificada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'possui distância mínima de foco igual em milímetros à sua maior distância focal.', 0);

    -- Q347 (lote18.txt, questao original 147, tema Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q347', N'Em uma objetiva zoom varifocal, ao modificar significativamente a distância focal:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o foco permanece necessariamente inalterado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'pode ser necessário reajustar o foco para conservar o assunto nitidamente focalizado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a abertura passa obrigatoriamente para f/1.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a perspectiva muda mesmo que a posição da câmera permaneça rigorosamente igual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a objetiva passa a funcionar como catadióptrica.', 0);

    -- Q348 (lote18.txt, questao original 148, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q348', N'A respeito da abertura f/2,8 e da transmissão luminosa real de uma objetiva, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'duas objetivas ajustadas em f/2,8 necessariamente transmitem exatamente a mesma quantidade de luz ao sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o número f descreve uma relação geométrica, enquanto perdas por absorção e reflexão podem fazer a transmissão efetiva diferir entre objetivas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o número f já incorpora integralmente todas as perdas de transmissão dos elementos ópticos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/2,8 e T/2,8 são necessariamente conceitos idênticos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o número T é utilizado para indicar a distância mínima de foco.', 0);

    -- Q349 (lote18.txt, questao original 149, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q349', N'O número T (T-stop) empregado especialmente em objetivas cinematográficas procura expressar:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas a distância focal equivalente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a abertura considerando a transmissão luminosa efetiva do sistema óptico.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a quantidade de elementos existentes na objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o fator de corte do sensor recomendado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'exclusivamente a profundidade de campo.', 0);

    -- Q350 (lote18.txt, questao original 150, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q350', N'Ao fotografar com uma objetiva em sua abertura máxima, observa-se escurecimento gradual dos cantos do quadro, que diminui ao fechar o diafragma. O fenômeno descrito é:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'coma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aliasing.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'vinhetagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aberração cromática longitudinal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'focus breathing.', 0);

    -- Q351 (lote18.txt, questao original 151, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q351', N'Uma vinhetagem acentuada aparece após a instalação de filtros muito espessos ou filtros empilhados diante de uma objetiva ultra grande-angular. Nesse caso, uma causa possível é:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'obstrução física parcial do amplo cone de raios que forma a imagem nas extremidades do quadro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento da distância focal provocado pelo vidro plano.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'redução da profundidade de bits do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alteração do círculo de confusão causada pelo ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento da difração no centro da imagem.', 0);

    -- Q352 (lote18.txt, questao original 152, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q352', N'Durante uma fotografia contra uma fonte luminosa intensa, surgem reflexos internos, manchas e redução do contraste global da imagem. O fenômeno é denominado:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'moiré.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'flare.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'blooming óptico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'pincushion.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'rolling shutter.', 0);

    -- Q353 (lote18.txt, questao original 153, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q353', N'O revestimento antirreflexo aplicado aos elementos de uma objetiva tem, entre suas funções principais:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar deliberadamente os reflexos entre as superfícies ópticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir reflexões indesejadas e melhorar a transmissão e o contraste.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar fisicamente qualquer possibilidade de aberração geométrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar automaticamente a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar o fator de corte da objetiva.', 0);

    -- Q354 (lote18.txt, questao original 154, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q354', N'Uma objetiva apresenta franjas coloridas que podem surgir à frente e atrás do plano de foco, frequentemente com cores diferentes, especialmente em grandes aberturas. O fenômeno é mais compatível com:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aberração cromática longitudinal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aberração cromática lateral.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'distorção de barril.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'coma exclusivamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'vinhetagem mecânica.', 0);

    -- Q355 (lote18.txt, questao original 155, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q355', N'A aberração cromática lateral, diferentemente da longitudinal, tende a:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'manifestar-se como diferenças de ampliação entre comprimentos de onda, sendo frequentemente mais perceptível em regiões afastadas do centro da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ocorrer exclusivamente no centro da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'desaparecer obrigatoriamente ao utilizar a abertura máxima.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'produzir apenas desfoque uniforme sem franjas cromáticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ocorrer somente em objetivas catadióptricas.', 0);

    -- Q356 (lote18.txt, questao original 156, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q356', N'Em relação à aberração esférica, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Decorre exclusivamente do fator de corte do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Pode ocorrer quando raios que atravessam diferentes regiões de uma superfície óptica esférica não convergem exatamente no mesmo ponto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'corresponde à curvatura das linhas retas próxima às bordas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'é sinônimo de aberração cromática lateral.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente existe em objetivas zoom.', 0);

    -- Q357 (lote18.txt, questao original 157, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q357', N'Uma objetiva projetada para um sensor APS-C é instalada, quando mecanicamente possível, em uma câmera full frame sem modo de recorte. Uma possível consequência é:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento automático da distância focal real.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o círculo de imagem ser insuficiente para cobrir todo o sensor, provocando forte escurecimento ou ausência de imagem nas regiões periféricas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'duplicação automática da resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'transformação do full frame em médio formato.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento obrigatório da abertura máxima.', 0);

    -- Q358 (lote18.txt, questao original 158, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q358', N'O círculo de imagem produzido por uma objetiva corresponde:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'à região circular de imagem projetada pela objetiva no plano focal, dentro da qual o sensor ou filme deve ser adequadamente coberto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'exclusivamente ao formato circular do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao círculo de confusão utilizado para calcular a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao diâmetro do elemento frontal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'à região central do sensor utilizada pelo autofoco.', 0);

    -- Q359 (lote18.txt, questao original 159, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q359', N'Um fotógrafo utiliza um teleconversor 2× em uma objetiva 300 mm f/2,8. Desconsiderando particularidades específicas do equipamento, o conjunto passa a apresentar aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'150 mm f/1,4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'300 mm f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'450 mm f/4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'600 mm f/4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'600 mm f/5,6.', 1);

    -- Q360 (lote18.txt, questao original 160, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q360', N'Uma objetiva 200 mm f/4 recebe um teleconversor 1,4×. O conjunto resultante será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'140 mm f/2,8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'200 mm f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'280 mm f/4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'280 mm f/5,6.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'400 mm f/8.', 0);

    -- Q361 (lote19.txt, questao original 161, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q361', N'Em uma câmera cujo visor óptico possui eixo de observação fisicamente separado do eixo óptico da objetiva, o erro de paralaxe ocorre porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o visor utiliza necessariamente distância focal diferente da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'visor e objetiva observam a cena a partir de posições ligeiramente diferentes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a objetiva apresenta distorção geométrica nas bordas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o sensor está desalinhado com o plano focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o espelho reflex modifica a perspectiva registrada.', 0);

    -- Q362 (lote19.txt, questao original 162, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q362', N'Em sistemas sujeitos ao erro de paralaxe, sua influência sobre o enquadramento tende a tornar-se mais perceptível:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'à medida que aumenta a distância câmera-assunto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'quando o assunto está relativamente próximo da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusivamente quando a objetiva é focalizada no infinito.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas em velocidades baixas do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'exclusivamente quando se utiliza abertura máxima.', 0);

    -- Q363 (lote19.txt, questao original 163, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q363', N'Um fotógrafo enquadra um objeto muito próximo por meio de um visor óptico localizado acima e lateralmente à objetiva. Embora o objeto pareça centralizado no visor, a fotografia registra enquadramento deslocado. A causa mais provável é:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aberração esférica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'distorção de perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'erro de paralaxe.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aberração cromática lateral.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'difração.', 0);

    -- Q364 (lote19.txt, questao original 164, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q364', N'Em relação ao erro de paralaxe, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'É provocado fundamentalmente pela diferença entre a posição do ponto de observação do visor e a posição da objetiva responsável pela captura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'É uma aberração óptica causada pela refração desigual dos diferentes comprimentos de onda.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'É produzido exclusivamente pela curvatura do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ocorre em qualquer câmera sempre que se utiliza uma teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'depende fundamentalmente da velocidade do obturador.', 0);

    -- Q365 (lote19.txt, questao original 165, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q365', N'Em uma câmera reflex de objetiva única (SLR/DSLR), durante o enquadramento pelo visor óptico através da própria objetiva, o erro de paralaxe de enquadramento característico dos visores ópticos separados é essencialmente eliminado porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'visor e objetiva possuem exatamente a mesma distância focal física.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o fotógrafo observa, por meio do sistema reflex, a imagem formada pelo mesmo caminho óptico principal utilizado pela objetiva de tomada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o sensor corrige eletronicamente a posição do visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o pentaprisma elimina todas as aberrações da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o espelho aumenta artificialmente a distância do assunto.', 0);

    -- Q366 (lote19.txt, questao original 166, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q366', N'Uma câmera mirrorless utiliza visor eletrônico que apresenta a imagem proveniente do próprio sensor de captura. Em relação à paralaxe de enquadramento:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o problema típico dos visores ópticos separados é evitado, pois a visualização deriva da imagem captada através da própria objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o erro é necessariamente maior que em uma rangefinder.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o visor eletrônico possui sempre eixo óptico próprio independente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o erro depende exclusivamente da resolução do EVF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o sensor cria paralaxe sempre que a objetiva focaliza abaixo de um metro.', 0);

    -- Q367 (lote19.txt, questao original 167, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q367', N'O erro de paralaxe pode ser especialmente relevante em fotografia de objetos pequenos e próximos porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a pequena distância faz com que a diferença angular entre as linhas de visão do visor e da objetiva tenha maior efeito sobre o enquadramento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a distância focal da objetiva aumenta automaticamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a profundidade de campo elimina a diferença entre os pontos de vista.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o sensor aumenta fisicamente de tamanho em foco próximo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o visor passa automaticamente a apresentar maior ampliação óptica.', 0);

    -- Q368 (lote19.txt, questao original 168, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q368', N'Em uma câmera com visor óptico separado, o fotógrafo afasta-se progressivamente do assunto sem alterar a separação física entre visor e objetiva. A discrepância angular decorrente da paralaxe tende, em termos gerais, a:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar continuamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminuir.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'permanecer rigorosamente constante em qualquer distância.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'inverter obrigatoriamente a imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'depender apenas da abertura utilizada.', 0);

    -- Q369 (lote19.txt, questao original 169, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q369', N'Uma câmera compacta possui visor óptico separado localizado alguns centímetros acima da objetiva. Ao fotografar uma pequena placa a curtíssima distância, o enquadramento registrado tende a diferir do observado principalmente:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'na posição relativa dos limites da cena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'na temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'na profundidade de bits.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'na sensibilidade ISO real.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'na duração física da exposição.', 0);

    -- Q370 (lote19.txt, questao original 170, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q370', N'Algumas câmeras com visor separado apresentam marcas internas destinadas a indicar aproximadamente a região efetivamente registrada em foco próximo. Essas marcas têm como objetivo:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'corrigir a aberração cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'compensar ou auxiliar o fotógrafo a prever o erro de paralaxe.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'indicar exclusivamente a distância hiperfocal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'corrigir a exposição do fotômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'determinar a temperatura de cor.', 0);

    -- Q371 (lote19.txt, questao original 171, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q371', N'Em determinados sistemas rangefinder, mecanismos de correção automática de paralaxe podem:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'deslocar ou ajustar as linhas de enquadramento conforme a distância de foco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'mover fisicamente o sensor até coincidir com o visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar a diferença física entre visor e objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'corrigir exclusivamente a distorção de barril.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a distância focal da objetiva em foco próximo.', 0);

    -- Q372 (lote19.txt, questao original 172, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q372', N'Mesmo em uma câmera rangefinder com correção de paralaxe no visor, é tecnicamente mais adequado afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'qualquer diferença de ponto de vista entre visor e objetiva deixa fisicamente de existir.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o sistema pode compensar o enquadramento previsto, embora visor e objetiva continuem ocupando posições físicas diferentes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a correção transforma o visor em um sistema TTL.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o mecanismo corrige automaticamente todas as aberrações ópticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a paralaxe é convertida em difração.', 0);

    -- Q373 (lote19.txt, questao original 173, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q373', N'Sobre paralaxe e perspectiva, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'São rigorosamente o mesmo fenômeno.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Paralaxe está relacionada à diferença de ponto de observação entre duas linhas de visão; perspectiva refere-se às relações geométricas resultantes do ponto de vista da câmera em relação à cena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Perspectiva é uma aberração óptica, enquanto paralaxe é um problema de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Paralaxe ocorre somente em teleobjetivas, enquanto perspectiva ocorre apenas em grande-angulares.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ambas dependem exclusivamente da distância focal.', 0);

    -- Q374 (lote19.txt, questao original 174, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q374', N'Um fotógrafo utiliza uma câmera com visor separado para reproduzir um documento ocupando quase todo o quadro. O documento está muito próximo da câmera. Para minimizar problemas de enquadramento decorrentes da paralaxe, uma solução tecnicamente adequada, se disponível, seria:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar visualização através da própria objetiva ou pelo sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fechar o diafragma até a abertura mínima.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar velocidade de obturação mais alta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar o balanço de branco.', 0);

    -- Q375 (lote19.txt, questao original 175, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q375', N'Em uma DSLR operando em Live View, a composição é realizada a partir da imagem captada pelo sensor. Nesse caso:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'permanece necessariamente o mesmo erro de paralaxe de um visor óptico separado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a composição através do sensor evita o erro de paralaxe de enquadramento causado por uma linha de visão independente da objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o erro de paralaxe aumenta com o fechamento do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o problema somente desaparece quando a objetiva está no infinito.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o sensor precisa aplicar correção geométrica baseada no ISO.', 0);

    -- Q376 (lote19.txt, questao original 176, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q376', N'Um fotógrafo percebe que, ao aproximar sucessivamente a câmera de um objeto, a diferença entre o enquadramento observado no visor separado e aquele efetivamente registrado torna-se progressivamente relevante. Esse comportamento ocorre porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a separação física entre os dois pontos de observação passa a representar diferença angular relativamente maior para um objeto próximo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a distância focal aumenta à medida que a câmera se aproxima.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a objetiva desenvolve necessariamente distorção de almofada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o sensor reduz sua área ativa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o número f é alterado automaticamente.', 0);

    -- Q377 (lote19.txt, questao original 177, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q377', N'O erro de paralaxe provocado por visor e objetiva ocuparem posições diferentes deve ser distinguido da distorção de barril porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a paralaxe resulta de diferentes pontos de vista, enquanto a distorção de barril é uma deformação geométrica associada à projeção óptica da objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ambos são necessariamente produzidos pelo visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a distorção de barril ocorre exclusivamente por diferença entre visor e sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'paralaxe curva linhas retas, enquanto barril desloca uniformemente todo o quadro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ambos desaparecem apenas aumentando o ISO.', 0);

    -- Q378 (lote19.txt, questao original 178, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q378', N'Considere duas linhas de visão paralelas separadas fisicamente por determinada distância: uma correspondente ao visor e outra à objetiva. Para objetos muito distantes, a diferença relativa de enquadramento tende a ser pequena porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a separação entre visor e objetiva deixa fisicamente de existir.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a separação entre os pontos de observação representa uma diferença angular progressivamente menos significativa à medida que aumenta a distância do objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a objetiva passa a utilizar o eixo óptico do visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o visor transforma-se em TTL no infinito.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a distância focal da objetiva torna-se igual à distância entre visor e sensor.', 0);

    -- Q379 (lote19.txt, questao original 179, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q379', N'Em fotografia macro realizada com uma câmera cujo visor é completamente independente da objetiva de tomada, confiar exclusivamente na imagem apresentada pelo visor pode ser problemático principalmente porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pequenas diferenças entre os pontos de vista podem provocar discrepâncias relevantes no enquadramento em distâncias muito curtas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o visor necessariamente apresenta profundidade de campo menor que a objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a objetiva macro não consegue focalizar quando existe visor separado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o erro de paralaxe modifica o ISO efetivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o visor reduz a ampliação óptica produzida pela objetiva.', 0);

    -- Q380 (lote19.txt, questao original 180, tema Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q380', N'Assinale a situação em que NÃO se espera o erro de paralaxe de enquadramento característico da existência de linhas de visão separadas entre visor e objetiva:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'câmera compacta com visor óptico independente da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'câmera rangefinder com visor óptico separado e assunto próximo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'câmera de visor direto com janela de enquadramento acima da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'câmera mirrorless compondo a fotografia pelo visor eletrônico alimentado pelo sensor de imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'câmera com visor óptico externo montado acima da objetiva e sem correção de paralaxe.', 0);

    -- Q381 (lote20.txt, questao original 181, tema Histograma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q381', N'Ao analisar o histograma de luminância de uma fotografia, observa-se forte concentração de dados no lado esquerdo, sem que estes encostem necessariamente no limite extremo. Essa configuração permite concluir, de maneira tecnicamente correta, que:', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'houve obrigatoriamente subexposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'predominam valores tonais escuros, mas isso, isoladamente, não permite concluir que a exposição esteja incorreta.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ocorreu necessariamente clipping nas sombras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a imagem possui obrigatoriamente baixo contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o sensor atingiu seu limite de saturação.', 0);

    -- Q382 (lote20.txt, questao original 182, tema Histograma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q382', N'Duas fotografias apresentam histogramas muito semelhantes. Sobre a aparência visual dessas imagens, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'devem necessariamente representar a mesma cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'devem possuir exatamente a mesma distribuição espacial de claros e escuros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'podem representar imagens visualmente muito diferentes, pois o histograma informa a distribuição dos valores tonais, mas não sua posição espacial na imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'obrigatoriamente possuem o mesmo balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'foram necessariamente realizadas com a mesma exposição.', 0);

    -- Q383 (lote20.txt, questao original 183, tema Histograma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q383', N'Em um histograma, uma quantidade significativa de dados encontra-se acumulada contra a extremidade direita do gráfico. Esse comportamento pode indicar:', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'perda de detalhes por clipping nas altas luzes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'exclusivamente predominância de sombras profundas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'erro de focalização.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aberração cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilização obrigatória de ISO elevado.', 0);

    -- Q384 (lote20.txt, questao original 184, tema Histograma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q384', N'Sobre os histogramas RGB, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A ausência de clipping no histograma de luminância garante que nenhum canal RGB esteja saturado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Um dos canais de cor pode atingir seu limite máximo mesmo quando um histograma combinado ou de luminância não torna essa saturação tão evidente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Os histogramas RGB representam exclusivamente a temperatura de cor em Kelvin.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'cada canal indica a quantidade de pixels existente fisicamente em cada fotodiodo do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'clipping de um canal jamais interfere na reprodução das cores.', 0);

    -- Q385 (lote20.txt, questao original 185, tema Histograma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q385', N'Uma fotografia de uma cena predominantemente clara, como neve sob iluminação intensa, apresenta histograma naturalmente deslocado para a direita, sem clipping relevante. Nesse caso:', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o deslocamento para a direita comprova superexposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a distribuição pode ser coerente com a própria cena, não representando por si só erro de exposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o histograma deveria obrigatoriamente estar centralizado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a imagem precisa ser subexposta até que o pico principal alcance o centro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a leitura comprova erro do fotômetro.', 0);

    -- Q386 (lote20.txt, questao original 186, tema Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q386', N'A principal característica da luz permanente ou contínua, em comparação com a luz instantânea de flash, é que:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sua contribuição para a exposição independe do tempo de obturação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permanece iluminando a cena durante um intervalo relativamente contínuo, permitindo avaliar previamente sua incidência e seus efeitos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'possui obrigatoriamente temperatura de cor de 5500 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apresenta sempre intensidade superior à de um flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'não pode ser utilizada com fotômetro.', 0);

    -- Q387 (lote20.txt, questao original 187, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q387', N'Em uma cena iluminada exclusivamente por luz contínua constante, alterar o tempo de exposição de 1/250 s para 1/60 s, mantendo ISO e abertura, provoca aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'redução de dois pontos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento de um ponto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento de dois pontos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento de três pontos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'nenhuma alteração.', 0);

    -- Q388 (lote20.txt, questao original 188, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q388', N'Em uma fotografia realizada com flash, dentro da faixa normal de sincronismo, a duração do clarão é muito menor que o tempo em que o obturador permanece aberto. Mantendo potência do flash, ISO, abertura e distância flash-assunto constantes, reduzir o tempo de 1/60 s para 1/125 s tende a:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir proporcionalmente a contribuição do flash em aproximadamente um ponto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'manter aproximadamente a exposição produzida pelo flash, embora possa reduzir a contribuição da luz ambiente contínua.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'dobrar automaticamente a potência do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a exposição do flash em um ponto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'modificar obrigatoriamente o número-guia do equipamento.', 0);

    -- Q389 (lote20.txt, questao original 189, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q389', N'Em um ambiente no qual luz contínua e flash participam simultaneamente da exposição, o fotógrafo deseja escurecer o fundo iluminado predominantemente pela luz ambiente sem alterar significativamente o assunto iluminado pelo flash. Mantendo-se abaixo da velocidade máxima de sincronismo, uma estratégia possível é:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar velocidade de obturação mais alta, mantendo ISO, abertura e potência do flash.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar o tempo de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aproximar o flash do fundo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'abrir o diafragma sem realizar qualquer outra compensação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar simultaneamente o ISO e o tempo de exposição.', 0);

    -- Q390 (lote20.txt, questao original 190, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q390', N'A capacidade de um flash de “congelar” determinado movimento pode decorrer do fato de:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a duração efetiva do clarão poder ser muito curta, fazendo com que a principal exposição do assunto ocorra durante esse breve intervalo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'todo flash possuir velocidade de sincronismo superior a 1/8000 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o flash interromper mecanicamente o movimento do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a luz instantânea eliminar a inércia do objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a duração do flash ser sempre igual ao tempo selecionado no obturador.', 0);

    -- Q391 (lote20.txt, questao original 191, tema Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q391', N'Em fotografia, o poder de resolução de uma objetiva está relacionado principalmente à sua capacidade de:', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'transmitir maior quantidade de luz independentemente da abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'distinguir e reproduzir detalhes finos próximos entre si como elementos separáveis.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ampliar fisicamente o sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a profundidade de bits do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'modificar a temperatura de cor da cena.', 0);

    -- Q392 (lote20.txt, questao original 192, tema Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q392', N'Em testes ópticos tradicionais, o poder de resolução pode ser expresso em termos de:', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'linhas ou pares de linhas distinguíveis por determinada unidade de medida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'graus Kelvin por milímetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'número de cores por segundo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'megabytes por centímetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'números-guia por polegada.', 0);

    -- Q393 (lote20.txt, questao original 193, tema Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q393', N'Uma objetiva possui excelente poder de resolução teórico, mas é utilizada em um sistema cujo sensor apresenta capacidade de amostragem insuficiente para registrar integralmente os detalhes fornecidos pela óptica. Nesse caso:', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a resolução final do sistema será determinada exclusivamente pela objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o desempenho final pode ser limitado pelo sensor, pois a resolução da imagem depende do conjunto óptica-sensor e de outros fatores.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o sensor aumentará automaticamente sua quantidade física de pixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o poder de resolução da objetiva transformará pixels existentes em fotodiodos menores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'não haverá qualquer limitação porque resolução óptica e digital são independentes no resultado final.', 0);

    -- Q394 (lote20.txt, questao original 194, tema Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q394', N'Uma objetiva apresenta maior contraste na reprodução de estruturas relativamente grossas, mas menor capacidade de preservar contraste em detalhes espaciais extremamente finos. Uma análise mais completa desse comportamento pode ser realizada por meio:', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'da curva MTF.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'exclusivamente do número-guia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'do histograma RGB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'do EXIF.', 0);

    -- Q395 (lote20.txt, questao original 195, tema Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q395', N'Sobre poder de resolução e contraste, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'são conceitos absolutamente idênticos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a percepção e a avaliação da qualidade óptica envolvem não apenas a separação de detalhes, mas também o contraste com que diferentes frequências espaciais são reproduzidas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'uma objetiva que resolve muitas linhas obrigatoriamente apresenta contraste máximo em todas as frequências espaciais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o contraste não participa da percepção de nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'resolução depende exclusivamente da distância focal.', 0);

    -- Q396 (lote20.txt, questao original 196, tema Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q396', N'Em materiais fotográficos tradicionais, a camada de cobertura aplicada sobre a emulsão fotossensível possui, entre suas finalidades:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'proteger mecanicamente a emulsão contra abrasões e pequenos danos durante o manuseio.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'substituir os cristais de haletos de prata responsáveis pela formação da imagem latente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar diretamente a distância focal da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'atuar como principal camada fotossensível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'funcionar exclusivamente como filtro de densidade neutra.', 0);

    -- Q397 (lote20.txt, questao original 197, tema Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q397', N'A camada de cobertura de um material fotográfico deve ser distinguida da camada de emulsão porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a cobertura possui principalmente função protetora, enquanto a emulsão contém os componentes fotossensíveis responsáveis pela formação da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ambas são necessariamente compostas apenas por haletos de prata e exercem exatamente a mesma função.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a camada de cobertura registra a imagem, enquanto a emulsão apenas protege o suporte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a cobertura existe apenas em sensores CMOS.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a emulsão não participa do processo fotográfico.', 0);

    -- Q398 (lote20.txt, questao original 198, tema Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q398', N'Em uma estrutura simplificada de filme fotográfico, a camada anti-halo tem função diferente da camada de cobertura porque a primeira busca principalmente:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'evitar ou reduzir reflexões internas da luz que poderiam retornar à emulsão e produzir halos ao redor de regiões muito luminosas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'proteger a superfície contra riscos provocados pelo manuseio.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'determinar exclusivamente a sensibilidade ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar o tamanho dos cristais de haleto de prata.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substituir a base do filme.', 0);

    -- Q399 (lote20.txt, questao original 199, tema Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q399', N'Considerando uma estrutura simplificada de filme fotográfico, a sequência funcionalmente coerente é composta por elementos que incluem:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'camada de cobertura protetora, emulsão fotossensível, suporte/base e, conforme a construção, camada anti-halo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'camada Bayer, fotodiodos, microlentes e obturador eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'emulsão exclusivamente, sem necessidade de suporte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sensor CMOS, gelatina, obturador e revelador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'cobertura, diafragma, suporte e conversor A/D.', 0);

    -- Q400 (lote20.txt, questao original 200, tema Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q400', N'Durante a manipulação de um filme fotográfico, ocorre um pequeno risco superficial que afeta predominantemente a camada protetora sem alcançar significativamente a emulsão. A situação ilustra justamente uma das funções da camada de cobertura, que é:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'receber a exposição e formar diretamente a imagem latente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fornecer proteção física adicional à camada fotossensível situada abaixo dela.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'impedir a entrada de toda luz na emulsão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'atuar como revelador químico incorporado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'controlar a abertura efetiva da objetiva.', 0);

    COMMIT TRANSACTION;
    PRINT 'Lote de 200 novas questões hard (Q201-Q400) inserido com sucesso.';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO
