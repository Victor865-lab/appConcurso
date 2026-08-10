-- Insercao de 200 questoes autorais de altissima dificuldade
-- ("hard"), a partir dos arquivos QuestoesFto/questões hard.pdf (lote 1,
-- Q1-20) e QuestoesFto/questhard2.pdf a questhard10.pdf (lotes 2-10,
-- Q21-200).
--
-- Fonte SEM gabarito no lote 1 (Q1-20): as 20 respostas foram calculadas
-- de forma independente (fisica/matematica de exposicao: reciprocidade
-- ISO/abertura/obturador, fator de extensao em macro FE=(1+m)^2, formula
-- de numero-guia de flash NG=distancia*abertura, conversao PPI etc.),
-- conferidas por mais de um metodo de calculo.
--
-- Os demais lotes (2-10) tinham gabarito no proprio documento (marcacao
-- "N-Letra" ao final de cada lote). Todas as questoes numericas foram
-- reconferidas de forma independente; 5 apresentavam erro de calculo na
-- propria fonte e foram corrigidas (Q42, Q43, Q51, Q52, Q58 -- ver
-- comentarios inline em cada uma).
--
-- referencia = "QNNN", banca = "Ineditas - Padrao Vunesp", ano = NULL.

USE ConcursosDB;
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'EV')
    INSERT INTO temas (nome) VALUES (N'EV');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Flash')
    INSERT INTO temas (nome) VALUES (N'Flash');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Triângulo de Exposição')
    INSERT INTO temas (nome) VALUES (N'Triângulo de Exposição');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Impressão')
    INSERT INTO temas (nome) VALUES (N'Impressão');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Sensor e Fator de Corte')
    INSERT INTO temas (nome) VALUES (N'Sensor e Fator de Corte');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Fotometria')
    INSERT INTO temas (nome) VALUES (N'Fotometria');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Balanço de Branco')
    INSERT INTO temas (nome) VALUES (N'Balanço de Branco');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Filtros')
    INSERT INTO temas (nome) VALUES (N'Filtros');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Tipos de Arquivos')
    INSERT INTO temas (nome) VALUES (N'Tipos de Arquivos');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Objetivas')
    INSERT INTO temas (nome) VALUES (N'Objetivas');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Histograma')
    INSERT INTO temas (nome) VALUES (N'Histograma');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Composição e Enquadramento')
    INSERT INTO temas (nome) VALUES (N'Composição e Enquadramento');
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

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Protocolo e Cartão de Memória')
    INSERT INTO temas (nome) VALUES (N'Protocolo e Cartão de Memória');
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Edição de Imagens')
    INSERT INTO temas (nome) VALUES (N'Edição de Imagens');
GO

BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Q001 (lote01.txt, tema EV) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q001', N'Um fotógrafo realiza uma macrofotografia com reprodução 1:1, utilizando um sistema no qual a compensação da perda luminosa decorrente da extensão não é realizada automaticamente. O fotômetro, desconsiderando o fator de extensão, indica exposição de 1/125 s em f/11. Mantidos ISO e abertura, a velocidade aproximadamente necessária para compensar exclusivamente o fator de exposição da macrofotografia será:', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/30 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/60 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/250 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/500 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/15 s.', 0);

    -- Q002 (lote01.txt, tema Flash) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q002', N'Uma objetiva apresenta número-guia 56, especificado para ISO 100. Em determinada fotografia, o objeto principal encontra-se a 10 metros do flash. Posteriormente, mantendo- se a mesma distância e potência do flash, o fotógrafo altera a sensibilidade de ISO 100 para ISO 400. Para manter exposição equivalente exclusivamente em relação à iluminação produzida pelo flash, a abertura deverá passar aproximadamente de:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/5,6 para f/8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/5,6 para f/11.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/5,6 para f/16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/5,6 para f/4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/5,6 para f/2,8.', 0);

    -- Q003 (lote01.txt, tema Triângulo de Exposição) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q003', N'Uma câmera registra uma cena corretamente exposta em: ISO 200 — f/8 — 1/125 s. O fotógrafo deseja utilizar f/16, mantendo ISO 200 e a mesma exposição fotográfica. Desconsiderando alterações na iluminação, deverá utilizar:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/30 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/60 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/250 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/500 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/15 s.', 0);

    -- Q004 (lote01.txt, tema Impressão) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q004', N'Um arquivo digital possui 6000 × 4000 pixels. Pretende-se produzir uma impressão sem interpolação a 300 PPI, mantendo integralmente as dimensões do arquivo. A dimensão aproximada máxima da impressão será:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'20,0 × 13,3 cm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'30,0 × 20,0 cm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'50,8 × 33,9 cm.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'60,0 × 40,0 cm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'76,2 × 50,8 cm.', 0);

    -- Q005 (lote01.txt, tema Sensor e Fator de Corte) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q005', N'Considere duas câmeras, uma full frame e outra com sensor APS-C de fator de corte 1,5×, utilizando, sucessivamente, a mesma objetiva de 50 mm, ambas posicionadas exatamente no mesmo ponto em relação ao objeto. É correto afirmar que, na câmera APS-C:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a distância focal física passa a ser 75 mm e a perspectiva é comprimida.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a distância focal permanece 50 mm, mas o campo de visão registrado torna-se semelhante ao de uma objetiva de aproximadamente 75 mm em full frame.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a distância focal permanece 50 mm e o ângulo de visão permanece necessariamente igual, pois este depende exclusivamente da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a distância focal passa a 75 mm, mas a profundidade de campo permanece necessariamente idêntica à da full frame.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ocorre aumento óptico real de 1,5× antes que a imagem alcance o sensor.', 0);

    -- Q006 (lote01.txt, tema Fotometria) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q006', N'Ao fotografar uma superfície de tonalidade muito escura que ocupa praticamente todo o enquadramento, utilizando fotometria refletida e seguindo diretamente a indicação do fotômetro da câmera, sem compensação, é provável que o sistema:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumente a exposição, tendendo a representar a superfície escura mais clara do que ela realmente é.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduza a exposição, pois objetos escuros refletem maior quantidade de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'preserve necessariamente a tonalidade original, pois o fotômetro mede a luminância absoluta da superfície.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumente a exposição apenas quando estiver sendo utilizada medição de luz incidente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduza a exposição por interpretar a baixa refletância como excesso de iluminação.', 0);

    -- Q007 (lote01.txt, tema Balanço de Branco) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q007', N'Em uma fotografia realizada sob iluminação de tungstênio, aproximadamente 3200 K, a câmera encontra-se configurada equivocadamente para balanço de branco correspondente à luz do dia, aproximadamente 5500 K. Sem correção posterior, a tendência predominante da imagem será apresentar:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'dominante azulada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'dominante esverdeada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'dominante amarelada/alaranjada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução exclusiva da saturação, sem alteração cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'neutralização automática, independentemente da configuração selecionada.', 0);

    -- Q008 (lote01.txt, tema Filtros) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q008', N'Um fotógrafo precisa utilizar 1/15 s, mas a exposição correta, nas mesmas condições de ISO e abertura, seria obtida em 1/125 s. Ele pretende manter 1/15 s e compensar exclusivamente mediante filtro de densidade neutra. Considerando valores ideais de stops completos, o filtro mais adequado é:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ND2.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ND4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ND8.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ND16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ND32.', 0);

    -- Q009 (lote01.txt, tema Flash) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q009', N'Durante uma fotografia com flash eletrônico convencional, realizada em ambiente relativamente escuro, o fotógrafo mantém abertura, ISO, distância e potência do flash constantes, mas altera o obturador de 1/60 s para 1/125 s, permanecendo abaixo da velocidade máxima de sincronismo. Considerando separadamente a iluminação do flash e a luz ambiente, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'tanto o flash quanto o ambiente sofrerão necessariamente redução de aproximadamente 1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a contribuição do flash permanecerá aproximadamente inalterada, enquanto a contribuição da luz ambiente diminuirá aproximadamente 1 EV.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a contribuição do flash diminuirá aproximadamente 1 EV, enquanto a luz ambiente permanecerá inalterada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a velocidade do obturador não produzirá qualquer alteração, nem sobre o ambiente nem sobre o flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a contribuição do flash aumentará aproximadamente 1 EV devido à menor duração da exposição.', 0);

    -- Q010 (lote01.txt, tema Sensor e Fator de Corte) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q010', N'Em determinada câmera, o fotógrafo observa um ponto que aparece sempre na mesma posição da imagem e permanentemente luminoso, independentemente da cena fotografada, apresentando resposta praticamente constante. Essa descrição é mais compatível com:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pixel morto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'pixel preso, ou stuck pixel.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'banding.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aberração cromática lateral.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'vinhetagem eletrônica.', 0);

    -- Q011 (lote01.txt, tema Tipos de Arquivos) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q011', N'Um fotógrafo registra simultaneamente a mesma cena em RAW e JPEG. Posteriormente precisa recuperar detalhes de uma região de altas luzes e realizar correção relativamente intensa do balanço de branco. Em condições normais, o RAW oferece maior margem para essas operações principalmente porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'contém obrigatoriamente três canais RGB completos para cada fotodiodo antes da demosaicação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'armazena dados do sensor com processamento menos definitivo e, normalmente, maior profundidade de bits do que o JPEG final.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'não utiliza qualquer forma de compressão e, por isso, não apresenta limite de faixa dinâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'preserva todos os valores captados pelo sensor, inclusive aqueles fisicamente saturados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'não passa por conversão analógico-digital, permitindo que os valores analógicos sejam recuperados posteriormente.', 0);

    -- Q012 (lote01.txt, tema Objetivas) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q012', N'Durante a utilização de uma objetiva grande-angular, linhas retas localizadas próximas às bordas do enquadramento apresentam curvatura aparente para fora, produzindo aspecto de “barril”. O fenômeno descrito corresponde a:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aberração cromática longitudinal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'distorção pincushion ou almofada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'distorção barrel ou barril.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'coma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'astigmatismo provocado exclusivamente por movimento da câmera.', 0);

    -- Q013 (lote01.txt, tema Objetivas) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q013', N'Um fotógrafo utiliza uma lente close-up de +2 dioptrias juntamente com outra de +3 dioptrias, admitindo lentes finas em contato e desprezando efeitos decorrentes da separação entre elas. A potência aproximada do conjunto e sua distância focal equivalente serão, respectivamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'+5 D e 20 cm.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'+5 D e 50 cm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'+6 D e 16,7 cm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'+1,5 D e 66,7 cm.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'+2,5 D e 40 cm.', 0);

    -- Q014 (lote01.txt, tema Objetivas) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q014', N'Em macrofotografia, mantendo-se enquadramento, abertura nominal e condições gerais comparáveis, o aumento significativo da ampliação tende a provocar:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da profundidade de campo e redução do fator de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução da profundidade de campo e aumento da importância da compensação de exposição decorrente da extensão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'manutenção da profundidade de campo, pois ela depende exclusivamente da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento simultâneo da profundidade de campo e da distância hiperfocal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminação da influência da abertura sobre a profundidade de campo.', 0);

    -- Q015 (lote01.txt, tema Flash) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q015', N'Um fotógrafo utiliza flash com NG 40 em ISO 100. Mantendo potência e ISO, pretende fotografar corretamente um objeto situado a 5 metros, considerando apenas a iluminação direta do flash e a relação clássica do número-guia. A abertura teórica correspondente é:', 1,
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

    -- Q016 (lote01.txt, tema Tipos de Arquivos) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q016', N'Uma câmera produz arquivos RAW de 14 bits por canal de informação amostrada, enquanto outra condição de processamento resulta em dados de 12 bits. Considerando apenas a quantidade teórica de níveis tonais representáveis por uma amostra, a passagem de 12 para 14 bits significa:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'duplicar o número de níveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'quadruplicar o número de níveis.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar o número de níveis em aproximadamente 14%.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar o número de níveis oito vezes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'manter o número de níveis e apenas aumentar a resolução espacial.', 0);

    -- Q017 (lote01.txt, tema Histograma) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q017', N'Ao analisar uma fotografia digital, verifica-se o histograma fortemente concentrado junto ao extremo direito, com quantidade significativa de valores encostados no limite máximo. Essa informação permite concluir, com maior segurança, que:', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'necessariamente toda a fotografia está superexposta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'existem pixels em valores muito elevados e pode haver clipping de altas luzes, mas o histograma isoladamente não determina se a exposição global da cena está tecnicamente errada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ocorreu obrigatoriamente erro no balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a imagem possui baixa resolução espacial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ocorreu clipping das sombras, pois o extremo direito representa os tons escuros.', 0);

    -- Q018 (lote01.txt, tema Sensor e Fator de Corte) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q018', N'Em uma câmera digital com matriz de filtros de cor do tipo Bayer convencional, a informação RGB completa de cada pixel da imagem final é normalmente obtida por um processo computacional que estima componentes cromáticos não diretamente amostrados naquele fotossítio. Esse processo é denominado:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'quantização.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'interpolação bicúbica de resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'demosaicing.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'compressão entrópica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'subamostragem cromática 4:2:0.', 0);

    -- Q019 (lote01.txt, tema Composição e Enquadramento) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q019', N'Durante o registro fotográfico de um vestígio plano, a câmera é posicionada obliquamente em relação à superfície. Como consequência, uma região do objeto aparece proporcionalmente maior que outra, dificultando a reprodução métrica. Para minimizar esse problema já no momento da captura, a providência tecnicamente mais adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a distância focal até que desapareça qualquer efeito de perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'posicionar, sempre que possível, o plano do sensor paralelo ao plano do vestígio e manter a câmera adequadamente alinhada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar abertura máxima, reduzindo a influência da perspectiva pela menor profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar o ISO, pois a maior sensibilidade reduz a distorção geométrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar obrigatoriamente uma objetiva macro 1:1, pois a reprodução 1:1 elimina a deformação causada pelo posicionamento oblíquo.', 0);

    -- Q020 (lote01.txt, tema Triângulo de Exposição) -- gabarito calculado (fonte nao trazia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q020', N'Um fotógrafo realiza a primeira exposição em: ISO 100 — f/8 — 1/250 s. Na segunda exposição, pretende utilizar simultaneamente: ISO 400 e f/16, mantendo a mesma quantidade final de exposição e admitindo alterações em stops completos. Qual velocidade deverá ser utilizada?', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
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

    -- Q021 (lote02.txt, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q021', N'Durante uma documentação fotográfica, a exposição considerada correta foi obtida com ISO 100, f/8 e 1/60 s. Para aumentar a profundidade de campo, o fotógrafo decide utilizar f/16 e, simultaneamente, aumentar a sensibilidade para ISO 200. Mantida a mesma exposição final, a velocidade deverá ser ajustada para:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/15 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/30 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/60 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/125 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/250 s.', 0);

    -- Q022 (lote02.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q022', N'Um flash possui número-guia 32 para ISO 100. Em determinada situação, será utilizado a 8 metros do objeto. Sem alterar a potência ou a distância, o fotógrafo aumenta a sensibilidade para ISO 400. Considerando exclusivamente a iluminação fornecida pelo flash, a abertura teoricamente adequada será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/2,8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/8.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/11.', 0);

    -- Q023 (lote02.txt, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q023', N'Um fotógrafo utiliza uma objetiva de 100 mm focalizada para determinada distância e posteriormente substitui o conjunto por uma objetiva de 50 mm, aproximando fisicamente a câmera até recuperar aproximadamente o mesmo enquadramento do objeto principal. Comparadas as duas fotografias, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a perspectiva permanecerá necessariamente idêntica, pois depende exclusivamente do enquadramento final.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a perspectiva poderá mudar porque a recuperação do enquadramento exigiu alteração da posição da câmera em relação aos elementos da cena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a perspectiva será determinada exclusivamente pela distância focal, independentemente da posição da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a objetiva de 50 mm produzirá necessariamente maior compressão aparente entre os planos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'objetivas de diferentes distâncias focais produzem perspectivas distintas mesmo quando as imagens são obtidas exatamente da mesma posição e posteriormente recortadas para igualar o enquadramento.', 0);

    -- Q024 (lote02.txt, tema Impressão)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q024', N'Uma fotografia digital possui 4500 × 3000 pixels e deverá ser impressa, sem interpolação, com 15 polegadas de largura por 10 polegadas de altura. A resolução efetiva de impressão será:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'150 PPI.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'200 PPI.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'240 PPI.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'300 PPI.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'450 PPI.', 0);

    -- Q025 (lote02.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q025', N'Durante a fotografia de um vestígio com superfície parcialmente reflexiva, o fotógrafo utiliza um filtro polarizador na objetiva. A iluminação, entretanto, também apresenta reflexos especulares intensos. Considerando os princípios de polarização aplicados à fotografia técnica, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o polarizador elimina necessariamente qualquer reflexão, independentemente da natureza da superfície e do ângulo de incidência.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o polarizador atua igualmente sobre reflexos provenientes de qualquer material, inclusive superfícies metálicas, eliminando-os integralmente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a eficácia do polarizador depende, entre outros fatores, da natureza da superfície e da geometria da iluminação, não sendo garantida a eliminação completa dos reflexos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a utilização do polarizador aumenta necessariamente em 2 EV a quantidade de luz que atinge o sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a função primária do polarizador é alterar a temperatura de cor da fonte luminosa sem modificar reflexos.', 0);

    -- Q026 (lote02.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q026', N'Uma câmera encontra-se ajustada para 5500 K durante o registro de uma cena predominantemente iluminada por uma fonte de aproximadamente 7000 K. Não havendo outras correções, a fotografia tenderá a apresentar dominante:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'azulada, pois a iluminação possui temperatura de cor superior à configuração adotada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'amarelada, pois toda fonte acima de 5500 K é fisicamente mais quente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'magenta, devido à diferença entre temperatura de cor e índice de reprodução cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'esverdeada, independentemente do espectro da fonte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'neutra, porque diferenças inferiores a 2000 K são automaticamente ignoradas pelo balanço de branco.', 0);

    -- Q027 (lote02.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q027', N'Em uma fotografia realizada com flash, a exposição do objeto iluminado predominantemente pelo flash está adequada em f/8, ISO 100 e 1/125 s. O fotógrafo deseja tornar o fundo, iluminado principalmente pela luz ambiente, 2 EV mais claro, sem alterar significativamente a exposição do objeto produzida pelo flash. Mantendo abertura, ISO, potência e distância do flash constantes e supondo ausência de problemas de sincronismo, a solução mais adequada é alterar a velocidade para:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/30 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/60 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/250 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/500 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/1000 s.', 0);

    -- Q028 (lote02.txt, tema Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q028', N'Um arquivo RAW produzido por determinada câmera utiliza conversão A/D de 14 bits, enquanto seu JPEG final utiliza 8 bits por canal. A respeito dessa diferença, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Um arquivo de 14 bits possui exatamente 14 vezes mais níveis tonais que um de 8 bits.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'14 bits permitem teoricamente 16.384 níveis por amostra, enquanto 8 bits permitem 256, embora isso não signifique que todos esses níveis representem necessariamente informação útil ou faixa dinâmica efetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A profundidade de bits determina diretamente a quantidade de megapixels do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A conversão para 8 bits aumenta a faixa dinâmica porque reduz o número de níveis necessários para representar cada tonalidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A profundidade de 14 bits significa que cada pixel final possui obrigatoriamente 14 bits de vermelho, 14 de verde e 14 de azul diretamente captados por um único fotodiodo Bayer.', 0);

    -- Q029 (lote02.txt, tema Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q029', N'Em macrofotografia de alta ampliação, o fotógrafo fecha progressivamente o diafragma buscando aumentar a profundidade de campo. A partir de determinado ponto, observa redução da nitidez global, apesar do aumento da região aparentemente aceitável de foco. O fenômeno óptico que melhor explica essa perda progressiva de resolução em aberturas muito pequenas é:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aberração esférica causada exclusivamente pelo aumento do diâmetro da abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'difração.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'distorção em almofada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aberração cromática lateral causada pelo obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'paralaxe do sistema de medição.', 0);

    -- Q030 (lote02.txt, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q030', N'Uma lente close-up possui potência de +4 dioptrias. Admitindo uma lente delgada e considerando um objeto muito distante antes da colocação do acessório, a distância focal correspondente à lente close-up é aproximadamente:', 1,
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
    VALUES (@idQuestao, 'E', N'50 cm.', 0);

    -- Q031 (lote02.txt, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q031', N'Em um sensor convencional com matriz Bayer, cada fotossítio encontra-se associado predominantemente à medição de uma determinada faixa cromática. Após a captura, o processador reconstrói uma imagem RGB. Assinale a alternativa tecnicamente correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Cada fotossítio Bayer registra diretamente valores completos de vermelho, verde e azul, tornando desnecessária qualquer estimativa cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O demosaicing estima componentes cromáticos ausentes a partir das informações dos fotossítios vizinhos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A matriz Bayer contém iguais quantidades de filtros vermelhos, verdes e azuis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O demosaicing corresponde à conversão da carga elétrica do fotodiodo diretamente em número binário pelo conversor A/D.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A presença da matriz Bayer impede a produção de arquivos RAW.', 0);

    -- Q032 (lote02.txt, tema Composição e Enquadramento)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q032', N'Ao fotografar um objeto tridimensional com uma régua métrica posicionada vários centímetros à frente dele, o fotógrafo pretende posteriormente utilizar a régua para inferir dimensões precisas do objeto na imagem. Mesmo que régua e objeto apareçam perfeitamente nítidos, o procedimento pode produzir erro principalmente porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a profundidade de campo altera fisicamente as dimensões do objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'objetos situados em planos diferentes podem apresentar escalas de reprodução distintas em razão da geometria de projeção.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'réguas métricas somente podem ser utilizadas com objetivas macro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a distância focal impressa no EXIF modifica a dimensão real registrada pela régua.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o sensor converte automaticamente centímetros em pixels apenas quando régua e objeto estão no mesmo plano focal.', 0);

    -- Q033 (lote02.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q033', N'Considere uma fotografia corretamente exposta em ISO 100, f/11 e 1/125 s. O fotógrafo instala um filtro ND16 e deseja manter ISO e velocidade inalterados. Desconsiderando limitações da objetiva, para compensar integralmente a perda de luz provocada pelo filtro, deverá utilizar aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/2,8.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/16.', 0);

    -- Q034 (lote02.txt, tema Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q034', N'Ao analisar duas fotografias de uma mesma cena estática, obtidas da mesma posição da câmera, uma com 50 mm e outra com 100 mm, o fotógrafo recorta posteriormente a fotografia feita com 50 mm até que o enquadramento dos objetos coincida com o da fotografia realizada com 100 mm. Desconsiderando diferenças de resolução, profundidade de campo e características ópticas das objetivas, a relação aparente entre os tamanhos dos objetos situados em diferentes planos será:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diferente, porque a perspectiva é determinada pela distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'essencialmente a mesma, porque a posição da câmera em relação à cena não mudou.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'necessariamente mais comprimida na imagem obtida com 100 mm, ainda que a câmera permaneça exatamente no mesmo local.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'imprevisível, porque perspectiva depende exclusivamente da abertura utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'diferente somente se ambas as objetivas forem utilizadas em sensores do mesmo tamanho.', 0);

    -- Q035 (lote02.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q035', N'Uma fonte luminosa possui alto valor de IRC/CRI, enquanto outra apresenta temperatura de cor exatamente igual, mas CRI significativamente inferior. A conclusão tecnicamente mais adequada é que:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fontes com a mesma temperatura de cor necessariamente reproduzem as cores dos objetos de maneira idêntica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'temperatura de cor e CRI descrevem exatamente a mesma propriedade da fonte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'as duas fontes podem apresentar aparência cromática global semelhante, mas diferir significativamente na fidelidade com que reproduzem determinadas cores.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o CRI determina exclusivamente a quantidade total de luz emitida pela fonte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'uma fonte de baixo CRI sempre apresenta temperatura de cor inferior a 3200 K.', 0);

    -- Q036 (lote02.txt, tema Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q036', N'Durante a captura de uma cena com grande amplitude luminosa, determinadas regiões atingem o valor máximo registrável pelo sensor e ficam efetivamente saturadas. A respeito da tentativa de recuperação dessas regiões em um arquivo RAW, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o RAW sempre permite recuperar integralmente qualquer região saturada, independentemente do nível de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a maior latitude do RAW pode permitir recuperação quando ainda existem dados úteis registrados, mas não recria informação efetivamente perdida pela saturação dos canais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a recuperação é garantida porque arquivos RAW não possuem limite máximo de sinal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a saturação afeta somente arquivos JPEG, pois o RAW armazena valores analógicos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a profundidade de bits após a captura recria os detalhes que foram saturados no sensor.', 0);

    -- Q037 (lote02.txt, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q037', N'Em uma fotografia, um padrão repetitivo muito fino presente em um tecido produz desenhos ondulados e cores que não existiam no objeto original. Esse artefato é mais compatível com:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'moiré decorrente da interação entre a frequência espacial do padrão e a amostragem do sistema de captura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'vinhetagem provocada pela redução da iluminação periférica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'banding causado exclusivamente por subexposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'blooming causado pela abertura excessivamente pequena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aberração esférica decorrente da matriz Bayer.', 0);

    -- Q038 (lote02.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q038', N'Um fotógrafo necessita registrar simultaneamente detalhes presentes em uma superfície altamente reflexiva e reduzir reflexos produzidos pela própria iluminação. Para isso, utiliza filtros polarizadores nas fontes luminosas e um polarizador na objetiva, orientados adequadamente entre si. Essa técnica é conhecida como:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'compensação TTL.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sincronização de alta velocidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'polarização cruzada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'iluminação coaxial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'bracketing cromático.', 0);

    -- Q039 (lote02.txt, tema EV)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q039', N'Uma fotografia é realizada com objetiva macro em ampliação 2:1. Utilizando a expressão clássica do fator de exposição: FE = (1 + m)² e desconsiderando compensações internas da objetiva, o fator de exposição correspondente e a compensação aproximada são:', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'FE = 4; +2 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'FE = 6; aproximadamente +2,5 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'FE = 8; +3 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'FE = 9; aproximadamente +3,17 EV.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'FE = 16; +4 EV.', 0);

    -- Q040 (lote02.txt, tema Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q040', N'Durante a documentação de um vestígio, o fotógrafo precisa maximizar a informação registrada e preservar possibilidades de processamento posterior, mas também necessita produzir imediatamente uma imagem de fácil visualização e compartilhamento. Considerando as características usuais dos formatos digitais, a estratégia tecnicamente mais adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'registrar exclusivamente JPEG em qualidade mínima, pois a compressão aumenta a quantidade de informação recuperável.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'registrar exclusivamente RAW, pois esse formato possui compatibilidade universal e dispensa processamento para visualização.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'registrar RAW + JPEG, preservando um arquivo com maior flexibilidade de processamento e simultaneamente uma versão prontamente utilizável.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'converter o RAW para BMP antes da captura para evitar demosaicing.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'registrar PNG no lugar do RAW, pois PNG preserva necessariamente os dados brutos originais produzidos pelo sensor.', 0);

    -- Q041 (lote03.txt, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q041', N'Uma cena é corretamente registrada em: ISO 100 — f/8 — 1/250 s O fotógrafo decide alterar simultaneamente para ISO 400 e f/16. Mantidas as condições de iluminação e buscando exposição equivalente, a velocidade deverá ser:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
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

    -- Q042 (lote03.txt, tema Triângulo de Exposição) -- gabarito corrigido: fonte indicava A, correto e B
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q042', N'A exposição inicial é: ISO 200 — f/5,6 — 1/500 s O fotógrafo reduz a sensibilidade para ISO 100 e fecha o diafragma para f/11. Para conservar a exposição, deverá utilizar:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/30 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/60 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/125 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/250 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/15 s.', 0);

    -- Q043 (lote03.txt, tema Triângulo de Exposição) -- gabarito corrigido: fonte indicava A, correto e C
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q043', N'Uma fotografia corretamente exposta foi obtida em: ISO 400 — f/11 — 1/125 s Por necessidade de profundidade de campo, o fotógrafo passa para f/22. Simultaneamente, reduz o ISO para 100. Sem alterar a iluminação, qual velocidade produz exposição equivalente?', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/2 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/4 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/8 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/15 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/30 s.', 0);

    -- Q044 (lote03.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q044', N'A exposição correta sem filtro é: ISO 100 — f/8 — 1/125 s Um filtro ND8 é instalado. O fotógrafo também aumenta o ISO para 400, mantendo a abertura em f/8. Para obter exposição equivalente, deverá utilizar aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/30 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/60 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/125 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/250 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/500 s.', 0);

    -- Q045 (lote03.txt, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q045', N'Uma cena é corretamente exposta em: ISO 100 — f/4 — 1/1000 s O fotógrafo pretende utilizar 1/125 s, mantendo ISO 100, mas quer conservar exatamente a exposição apenas mediante alteração da abertura. A abertura correspondente será:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/11.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/22.', 0);

    -- Q046 (lote03.txt, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q046', N'Uma exposição foi determinada em: ISO 800 — f/8 — 1/250 s O fotógrafo deseja reduzir a sensibilidade para ISO 200 e utilizar velocidade de 1/60 s. Para manter aproximadamente a mesma exposição, deverá utilizar:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
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

    -- Q047 (lote03.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q047', N'Sem filtro, determinada cena exige: ISO 100 — f/11 — 1/30 s O fotógrafo precisa utilizar 1 segundo, mantendo ISO e abertura. Qual filtro ND produziria a compensação mais próxima em stops completos?', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ND4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ND8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ND16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ND32.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ND64.', 0);

    -- Q048 (lote03.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q048', N'Uma cena foi corretamente registrada em: ISO 100 — f/16 — 1/15 s O fotógrafo instala um filtro ND16 e, simultaneamente, altera para ISO 400 e f/8. Mantida a exposição equivalente, a velocidade deverá ser:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/15 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/30 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/60 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/125 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/250 s.', 0);

    -- Q049 (lote03.txt, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q049', N'Uma fotografia apresenta exposição adequada em: ISO 200 — f/8 — 1/60 s O fotógrafo altera a câmera para: ISO 800 — f/11 — 1/125 s Comparada à exposição inicial, e considerando apenas essas três variáveis, a segunda configuração produzirá:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'exposição equivalente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'subexposição de 1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'superexposição de 1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'subexposição de 2 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'superexposição de 2 EV.', 0);

    -- Q050 (lote03.txt, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q050', N'Uma exposição inicial é: ISO 100 — f/5,6 — 1/250 s O fotógrafo altera a abertura para f/16 e a velocidade para 1/60 s. Qual ISO aproximadamente restabelece a exposição inicial?', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 100.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 200.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 400.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 800.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 1600.', 0);

    -- Q051 (lote03.txt, tema Filtros) -- gabarito corrigido: fonte indicava A, correto e B
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q051', N'Uma cena exige originalmente: ISO 100 — f/8 — 1/125 s Por razões técnicas, o fotógrafo precisa utilizar: ISO 50 — f/16 e instala ainda um ND4. Para manter exposição equivalente, qual deverá ser aproximadamente a velocidade?', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/2 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/4 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/8 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/15 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/30 s.', 0);

    -- Q052 (lote03.txt, tema Filtros) -- gabarito corrigido: fonte indicava B, correto e C
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q052', N'Uma fotografia corretamente exposta utiliza: ISO 400 — f/4 — 1/500 s O fotógrafo instala um ND8, reduz o ISO para 100 e pretende utilizar f/2,8. Qual velocidade aproximadamente conserva a exposição?', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/8 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/15 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/30 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/60 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/125 s.', 0);

    -- Q053 (lote03.txt, tema EV)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q053', N'Em macrofotografia, determinado sistema fornece, antes da compensação da extensão: ISO 100 — f/16 — 1/125 s A ampliação utilizada é 1:1, admitindo-se: FE = (1 + m)² O fotógrafo também instala um filtro ND4. Mantendo ISO e abertura, qual velocidade aproximadamente compensará conjuntamente a extensão e o filtro?', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/4 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/8 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/15 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/30 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/60 s.', 0);

    -- Q054 (lote03.txt, tema EV)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q054', N'Uma macrofotografia é realizada em ampliação 2:1. Desconsiderando compensação automática, considere: FE = (1 + m)² Se a exposição indicada antes da correção pela extensão é 1/250 s em f/11, mantidos abertura e ISO, qual velocidade mais se aproxima da compensação teoricamente necessária?', 1,
        (SELECT id FROM temas WHERE nome = N'EV'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/15 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/30 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/60 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/8 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/4 s.', 0);

    -- Q055 (lote03.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q055', N'Uma fotografia com flash e luz ambiente apresenta equilíbrio adequado em: ISO 100 — f/8 — 1/125 s Mantendo-se ISO, potência do flash e distância flash-objeto, o fotógrafo abre o diafragma para f/5,6 e deseja manter aproximadamente inalterada a exposição do objeto iluminado pelo flash. Considerando apenas os controles mencionados, qual procedimento é tecnicamente adequado?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Alterar o obturador para 1/250 s, pois isso compensa integralmente a abertura também para o flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Alterar o obturador para 1/60 s, reduzindo em 1 EV a exposição do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Reduzir a potência do flash em aproximadamente 1 EV; o obturador pode então ser ajustado separadamente conforme a contribuição desejada da luz ambiente, dentro dos limites de sincronismo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Aumentar a potência do flash em 1 EV e utilizar 1/250 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Manter a potência do flash, pois a abertura não interfere na exposição produzida pelo flash.', 0);

    -- Q056 (lote03.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q056', N'Um flash possui NG 56 em ISO 100 e está posicionado a 10 m do objeto, resultando teoricamente em aproximadamente f/5,6. Sem alterar potência ou distância, o fotógrafo passa para ISO 400, mas deseja continuar utilizando f/5,6 e manter a mesma exposição do objeto produzida pelo flash. Qual alteração é necessária na energia efetiva do flash?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar 1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir 1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar 2 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduzir 2 EV.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'nenhuma alteração, pois ISO não interfere na exposição do flash.', 0);

    -- Q057 (lote03.txt, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q057', N'Uma cena está corretamente exposta em: ISO 100 — f/11 — 1/60 s O fotógrafo realiza três alterações: ISO 100 → ISO 800 f/11 → f/22 1/60 s → 1/125 s Comparada à exposição original, a nova configuração resulta aproximadamente em:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'exposição equivalente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'+1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'−1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'+2 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'−2 EV.', 0);

    -- Q058 (lote03.txt, tema Filtros) -- gabarito corrigido: fonte indicava B, correto e E
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q058', N'Uma cena exige: ISO 200 — f/8 — 1/250 s O fotógrafo instala um ND32 e deseja utilizar 1/30 s. Mantendo a mesma exposição final, qual combinação de ISO e abertura é equivalente à configuração original considerando também o filtro?', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 200 e f/8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 400 e f/8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 200 e f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 400 e f/11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 800 e f/8.', 1);

    -- Q059 (lote03.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q059', N'Uma exposição inicial é: ISO 100 — f/2,8 — 1/2000 s O fotógrafo pretende fotografar em: ISO 400 — f/8 e instala um ND4. Qual velocidade aproximadamente produz exposição equivalente à inicial?', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/125 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/250 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/500 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/1000 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/2000 s.', 0);

    -- Q060 (lote03.txt, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q060', N'Uma cena apresenta exposição correta em: ISO 100 — f/8 — 1/250 s O fotógrafo realiza sucessivamente as seguintes alterações: 1. instala ND8; 2. passa de ISO 100 para ISO 800; 3. fecha de f/8 para f/16; 4. altera a velocidade para 1/60 s. Em relação à exposição inicial, o resultado final será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'equivalente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1 EV mais claro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1 EV mais escuro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'2 EV mais claro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'2 EV mais escuro.', 0);

    -- Q061 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q061', N'Uma cena é iluminada exclusivamente por uma fonte de tungstênio de aproximadamente 3200 K, mas a câmera está configurada manualmente para balanço de branco de 5600 K. Sem correção posterior, a imagem tenderá predominantemente a:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apresentar dominante azulada, pois a câmera espera uma fonte mais quente que a existente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apresentar dominante amarelada/alaranjada, pois a câmera aplica correção insuficiente para neutralizar a fonte de menor temperatura de cor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apresentar dominante esverdeada, pois a diferença entre 3200 K e 5600 K situa-se no eixo verde-magenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'permanecer neutra, pois o ajuste Kelvin somente afeta arquivos JPEG abaixo de 3000 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apresentar dominante magenta, independentemente da distribuição espectral da fonte.', 0);

    -- Q062 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q062', N'Uma superfície branca é fotografada sob luz de aproximadamente 7500 K. A câmera permanece configurada para 5500 K. Considerando apenas a diferença de temperatura de cor e desconsiderando desvios verde- magenta da fonte, a superfície tenderá a aparecer:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'mais azulada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'mais amarelada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'mais avermelhada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'mais magenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'neutra.', 0);

    -- Q063 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q063', N'Um fotógrafo observa que determinada cena registrada com WB em 4000 K apresenta-se excessivamente azulada. Para neutralizar essa dominante utilizando apenas o ajuste Kelvin da câmera, deverá, em princípio:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diminuir o valor Kelvin selecionado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar o valor Kelvin selecionado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar o valor de matiz em direção ao verde.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'diminuir a exposição sem alterar o WB.', 0);

    -- Q064 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q064', N'Uma fotografia realizada sob iluminação de 3200 K ficou corretamente neutralizada quando a câmera também foi configurada para aproximadamente 3200 K. Mantendo a mesma fonte, o fotógrafo altera o WB manual para 2500 K. A tendência será:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'imagem mais azulada que a anterior.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'imagem mais alaranjada que a anterior.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'imagem necessariamente esverdeada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ausência de alteração, pois a fonte permaneceu constante.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento apenas da saturação, sem mudança no equilíbrio cromático.', 0);

    -- Q065 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q065', N'Considere duas fontes: Fonte I — 3200 K Fonte II — 6500 K É correto afirmar, no contexto fotográfico, que:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a Fonte II é visualmente mais amarelada porque possui maior temperatura absoluta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a Fonte I tende a apresentar aparência mais quente/amarelada, embora possua menor temperatura de cor em Kelvin.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a Fonte I é denominada “fria” e a Fonte II “quente” porque a nomenclatura visual acompanha numericamente a escala Kelvin.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ambas necessariamente apresentam reprodução cromática idêntica se possuírem o mesmo CRI.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a diferença entre elas corresponde necessariamente apenas ao eixo verde-magenta.', 0);

    -- Q066 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q066', N'Um fotógrafo trabalha em ambiente iluminado simultaneamente por uma lâmpada de tungstênio de aproximadamente 3200 K e pela luz proveniente de uma janela, aproximadamente 5600 K. A respeito do balanço de branco, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Ajustar a câmera para 4400 K garante neutralização perfeita de ambas as fontes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Um único ajuste global de Kelvin pode não neutralizar simultaneamente áreas predominantemente iluminadas por fontes de temperaturas de cor distintas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Configurar 3200 K neutraliza tanto o tungstênio quanto a luz do dia, desde que o ISO permaneça constante.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Configurar 5600 K converte fisicamente a luz do tungstênio em luz do dia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A mistura de fontes afeta apenas a exposição, não a reprodução cromática.', 0);

    -- Q067 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q067', N'Um fotógrafo deseja combinar flash eletrônico de aproximadamente 5500 K com iluminação ambiente de tungstênio de aproximadamente 3200 K, procurando obter aparência cromática mais uniforme entre objeto e ambiente. Uma estratégia tecnicamente adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aplicar ao flash um filtro corretivo que aproxime sua temperatura de cor da iluminação ambiente e ajustar o WB da câmera para essa condição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar filtro ND no flash até que sua temperatura de cor se torne 3200 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a potência do flash, pois o número-guia determina diretamente sua temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'configurar a câmera para 4350 K, o que necessariamente transforma ambas as fontes em 4350 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir o ISO, pois a sensibilidade controla a diferença Kelvin entre as fontes.', 0);

    -- Q068 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q068', N'Durante uma captura em RAW, o fotógrafo utiliza por engano WB de 3200 K em uma cena iluminada por luz do dia de aproximadamente 5500 K. Em comparação com uma captura exclusivamente JPEG, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o RAW permite, em condições normais, reajustar posteriormente o balanço de branco com maior flexibilidade, pois o WB não é aplicado aos dados brutos da mesma maneira definitiva que ao JPEG processado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o erro destrói fisicamente os valores dos fotodiodos azuis no momento da captura RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'RAW e JPEG possuem exatamente a mesma flexibilidade de WB porque ambos armazenam exclusivamente valores RGB finais de 8 bits.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o WB não pode ser modificado posteriormente em RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o arquivo RAW será necessariamente neutro ao ser aberto, independentemente dos metadados de WB registrados pela câmera.', 0);

    -- Q069 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q069', N'Um fotógrafo configura manualmente a câmera para 8000 K e fotografa uma cena iluminada por uma fonte próxima de 5500 K. Desconsiderando outros desvios cromáticos, a tendência será produzir imagem:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'mais quente/amarelada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'mais fria/azulada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'mais verde.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'menos exposta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'monocromática.', 0);

    -- Q070 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q070', N'Considere as seguintes condições aproximadas: I. luz de vela: 1800 K; II. tungstênio: 3200 K; III. luz do dia/flash: 5500 K; IV. sombra sob céu azul: 8000 K. Assinale a alternativa que apresenta corretamente a progressão visual típica das fontes, da menor para a maior temperatura de cor:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'azulada → neutra → amarelada → avermelhada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'avermelhada/alaranjada → amarelada → relativamente neutra → azulada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'esverdeada → magenta → amarelada → branca.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'azulada → amarelada → avermelhada → neutra.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'magenta → azulada → verde → alaranjada.', 0);

    -- Q071 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q071', N'Ao configurar manualmente o WB, o fotógrafo aumenta o valor de 3000 K para 7000 K, sem alterar a iluminação da cena. Considerando o efeito da compensação aplicada pela câmera, a imagem resultante tende a:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'tornar-se progressivamente mais quente/amarelada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'tornar-se progressivamente mais fria/azulada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'sofrer apenas aumento de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'tornar-se progressivamente mais verde.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'não sofrer alteração enquanto a fonte luminosa permanecer constante.', 0);

    -- Q072 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q072', N'A aparente contradição entre uma fonte de 3000 K ser denominada visualmente “quente” e uma de 8000 K ser denominada “fria” decorre do fato de que:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a escala Kelvin fotográfica está invertida matematicamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'“quente” e “frio”, na descrição visual das cores, são convenções perceptivas que não correspondem diretamente ao maior ou menor valor numérico da temperatura de cor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'temperaturas superiores a 6500 K são medidas em escala Celsius, e não Kelvin.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fontes de menor Kelvin emitem necessariamente mais energia térmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a temperatura de cor deixa de possuir significado acima de 5600 K.', 0);

    -- Q073 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q073', N'Uma câmera encontra-se corretamente ajustada para uma fonte de 4000 K. Sem alterar a fonte, o fotógrafo deseja intencionalmente produzir uma aparência mais fria na fotografia por meio exclusivamente do WB manual. Deverá selecionar um valor:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'superior a 4000 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'inferior a 4000 K.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exatamente igual a 4000 K e aumentar o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'exatamente igual a 4000 K e fechar o diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'superior a 4000 K e reduzir a velocidade do obturador.', 0);

    -- Q074 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q074', N'Uma fonte LED é anunciada como 5600 K, assim como determinado flash eletrônico. Apesar disso, fotografias de um mesmo objeto apresentam diferenças perceptíveis na reprodução de algumas cores. A explicação tecnicamente mais adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'duas fontes com a mesma temperatura de cor correlata necessariamente possuem distribuição espectral idêntica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'temperatura de cor, isoladamente, não descreve integralmente a distribuição espectral nem a capacidade de reprodução cromática de uma fonte.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o fenômeno prova que uma das fontes necessariamente possui temperatura inferior a 3200 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fontes LED não possuem temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a temperatura Kelvin determina simultaneamente e de forma exclusiva CRI, intensidade luminosa e espectro.', 0);

    -- Q075 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q075', N'Uma cena apresenta simultaneamente uma região iluminada por 3200 K e outra por 6500 K. O fotógrafo registra em RAW e utiliza um único ajuste global de balanço de branco durante o processamento. É correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o RAW permite atribuir automaticamente dois valores Kelvin independentes a cada pixel sem qualquer seleção ou processamento localizado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'um ajuste global que neutralize uma das regiões poderá deixar dominante cromática na outra, devido à diferença entre as fontes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'escolher exatamente a média aritmética, 4850 K, garante neutralidade perfeita nas duas regiões.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o RAW transforma automaticamente todas as fontes presentes na cena em uma única temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a diferença somente será perceptível se as regiões possuírem exposições diferentes.', 0);

    -- Q076 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q076', N'Uma imagem produzida sob determinada iluminação apresenta dominante excessivamente amarelada/alaranjada. Admitindo que o problema decorra exclusivamente de um valor Kelvin de WB excessivamente alto, a correção deverá ser feita:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentando ainda mais o Kelvin.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminuindo o Kelvin selecionado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentando o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'corrigindo exclusivamente o eixo verde-magenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentando a exposição em 1 EV.', 0);

    -- Q077 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q077', N'Ao utilizar uma referência neutra para realizar balanço de branco personalizado sob determinada iluminação, o objetivo principal é permitir que a câmera:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'determine a abertura correspondente a 18% de refletância.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'identifique a dominante produzida pela iluminação e aplique compensação cromática para que uma referência neutra seja reproduzida como neutra.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'determine automaticamente o CRI exato da fonte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'converta qualquer fonte descontínua em espectro contínuo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'determine exclusivamente a exposição correta, sem interferência sobre os canais cromáticos.', 0);

    -- Q078 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q078', N'Em uma fotografia realizada sob luz do dia de aproximadamente 5500 K, o fotógrafo deseja deliberadamente simular uma aparência cromática mais quente sem utilizar filtros físicos. Qual ajuste manual de WB tende a produzir esse resultado?', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'3000 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'4000 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'5500 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'7000 K.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir o valor Kelvin para o menor disponível.', 0);

    -- Q079 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q079', N'Um fotógrafo mede uma fonte como aproximadamente 5000 K, mas observa dominante esverdeada mesmo após configurar a câmera exatamente para 5000 K. A melhor explicação é:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'temperatura de cor e eixo verde-magenta representam dimensões cromáticas distintas; acertar o Kelvin não necessariamente corrige uma dominante verde causada pelo espectro da fonte.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'qualquer fonte de 5000 K é necessariamente neutra, portanto a dominante verde só pode ser causada por subexposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o valor Kelvin controla simultaneamente e de forma completa os eixos azul-amarelo e verde-magenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a dominante verde demonstra necessariamente que a fonte possui temperatura superior a 10.000 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar o ISO é a correção cromática apropriada.', 0);

    -- Q080 (lote04.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q080', N'Durante uma documentação técnica, duas fontes apresentam: Fonte A: 3200 K, CRI 98 Fonte B: 5600 K, CRI 70 Considerando apenas essas informações, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A Fonte B necessariamente reproduzirá as cores com maior fidelidade porque possui temperatura Kelvin superior.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A Fonte A apresenta aparência cromática tipicamente mais quente e, pelo CRI informado, tende a possuir maior fidelidade de reprodução cromática que a Fonte B, embora temperatura de cor e CRI sejam propriedades distintas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A Fonte A é necessariamente azulada e a Fonte B necessariamente alaranjada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O CRI 98 significa que a Fonte A possui temperatura de cor de 9800 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Como possuem valores Kelvin diferentes, seus índices CRI não podem ser comparados.', 0);

    -- Q081 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q081', N'Um flash eletrônico possui NG 48 para ISO 100. Utilizado em potência total e incidência direta, encontra-se a 6 metros do objeto. Desconsiderando perdas adicionais, a abertura teoricamente adequada será:', 1,
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

    -- Q082 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q082', N'Um flash possui NG 36 em ISO 100. A exposição correta de determinado objeto situado a 4,5 m é obtida em potência total. Sem alterar potência ou distância, o fotógrafo passa de ISO 100 para ISO 400. Para manter a exposição produzida pelo flash, a abertura deverá passar aproximadamente de:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/8 para f/11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/8 para f/16.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/8 para f/22.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/8 para f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/8 para f/4.', 0);

    -- Q083 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q083', N'Um flash apresenta NG 56 em ISO 100. O fotógrafo pretende utilizar f/8, em incidência direta e potência total. A distância máxima teórica entre flash e objeto para exposição correspondente ao NG será:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'3,5 m.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'5 m.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'7 m.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'8 m.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'11,2 m.', 0);

    -- Q084 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q084', N'Um flash de NG 40 em ISO 100 é utilizado a 5 metros, produzindo exposição adequada em f/8. Mantendo distância e potência, o fotógrafo deseja utilizar f/16. Qual ISO, teoricamente, permitirá conservar a exposição?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 200.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 400.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 800.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 1600.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 3200.', 0);

    -- Q085 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q085', N'Um flash possui NG 60 em potência total. Considerando que a redução da potência para 1/4 corresponde a uma diminuição de 2 EV na energia luminosa, o número-guia resultante será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'15.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'21.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'30.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'42.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'45.', 0);

    -- Q086 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q086', N'Um flash possui NG 48 em potência total. O fotógrafo reduz a potência para 1/2. Considerando que uma redução de 1 EV na potência reduz o NG pelo fator √2, o novo número-guia será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'24.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'28.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'34.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'40.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'42.', 0);

    -- Q087 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q087', N'Um flash apresenta NG 64 em potência total. O fotógrafo passa sucessivamente para: 1/2 → 1/4 → 1/8 → 1/16 da potência total. Considerando a relação entre energia e número-guia, o NG aproximado em 1/16 será:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'16.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'22,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'32.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'40.', 0);

    -- Q088 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q088', N'Um flash de NG 32 em ISO 100 ilumina adequadamente um objeto situado a 4 m, utilizando f/8. O fotógrafo desloca o flash para 8 m, mantendo ISO e potência. Qual abertura aproximadamente compensará a nova distância?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/2,8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/4.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/16.', 0);

    -- Q089 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q089', N'Um flash de NG 40 em ISO 100 é utilizado a 5 m em f/8. Sem alterar abertura ou potência, o fotógrafo duplica a distância para 10 m. Para compensar exclusivamente mediante alteração da sensibilidade, deverá utilizar aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 200.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 400.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 800.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 1600.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 3200.', 0);

    -- Q090 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q090', N'Dois flashes são especificados nas mesmas condições: Flash A: NG 30 Flash B: NG 60 Considerando mesma abertura e ISO, é correto afirmar que, teoricamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'B alcança aproximadamente o dobro da distância de A.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'B alcança quatro vezes a distância de A.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'B produz apenas 1/2 EV a mais que A.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'B possui obrigatoriamente o dobro da energia elétrica armazenada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A diferença de NG não permite qualquer comparação de alcance.', 0);

    -- Q091 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q091', N'Um flash possui NG 56 em ISO 100. Para determinado enquadramento, o objeto encontra- se a 7 m e o fotógrafo utiliza f/8. Posteriormente, sem alterar distância nem potência do flash, passa para ISO 200. Qual abertura aproximadamente mantém a mesma exposição do objeto?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/9,5.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/11.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/16.', 0);

    -- Q092 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q092', N'Um flash possui NG 40 em ISO 100. O fotógrafo deseja trabalhar a 10 m utilizando f/8, sem alterar a potência do equipamento. Qual sensibilidade teórica é necessária?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 200.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 400.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 800.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 1600.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 3200.', 0);

    -- Q093 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q093', N'Um flash possui NG 80 em ISO 100 e potência total. Em determinada situação, o fotógrafo precisa utilizar f/8 a 5 metros, mas não deseja alterar ISO nem distância. Considerando exclusivamente a relação teórica do número-guia, qual redução aproximada de potência é necessária?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1 EV, correspondendo aproximadamente a 1/2 da potência.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'2 EV, correspondendo aproximadamente a 1/4 da potência.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'3 EV, correspondendo aproximadamente a 1/8 da potência.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'4 EV, correspondendo aproximadamente a 1/16 da potência.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'5 EV, correspondendo aproximadamente a 1/32 da potência.', 0);

    -- Q094 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q094', N'Um flash possui NG 32 em ISO 100. Em potência total, determinada fotografia é corretamente realizada em f/8 a 4 m. O fotógrafo mantém ISO e distância, mas reduz a potência para 1/4. A nova abertura correspondente será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/2,8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/4.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/16.', 0);

    -- Q095 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q095', N'Um flash apresenta NG 50 em ISO 100. Ao aumentar a sensibilidade para ISO 800, o novo NG teórico será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'71.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'87.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'100.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'141.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'200.', 0);

    -- Q096 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q096', N'Um fotógrafo utiliza flash direto e obtém exposição adequada do objeto com: NG 48 — ISO 100 — f/8 — distância 6 m — 1/60 s. Mantendo ISO, abertura, potência e distância constantes, altera o obturador para 1/125 s, ainda dentro da faixa normal de sincronização. Em relação à exposição proveniente predominantemente do flash sobre o objeto, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'cairá aproximadamente 1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentará aproximadamente 1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'permanecerá aproximadamente inalterada, enquanto a contribuição da luz ambiente diminuirá.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'permanecerá inalterada somente se o NG for recalculado para 24.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'cairá aproximadamente 2 EV porque a duração da exposição foi reduzida pela metade.', 0);

    -- Q097 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q097', N'Um flash de NG 40 em ISO 100 é utilizado diretamente a 5 m, resultando teoricamente em f/8. O fotógrafo passa a rebater o flash em um teto, de modo que o percurso óptico e as perdas por reflexão tornam-se relevantes. A respeito do uso direto da fórmula NG = distância × abertura nessa nova situação, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'deve continuar sendo aplicada utilizando obrigatoriamente apenas a distância linear câmera-objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o cálculo simples baseado no NG nominal do flash direto pode deixar de prever corretamente a exposição devido ao maior percurso e às perdas na superfície de reflexão.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o rebatimento sempre duplica o NG porque aumenta a área iluminada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'basta utilizar a distância flash-teto, desconsiderando o restante do percurso.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a refletância do teto interfere apenas na temperatura de cor, nunca na intensidade luminosa.', 0);

    -- Q098 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q098', N'Um flash possui NG 56 em ISO 100. Em determinado cenário, o fotógrafo necessita fotografar a 14 m, mas sua objetiva permite no máximo f/4. Em potência total e incidência direta, qual é a menor sensibilidade entre as alternativas que teoricamente permite atingir a exposição indicada pela relação de NG?', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 100.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 200.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 400.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 800.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 1600.', 0);

    -- Q099 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q099', N'Um flash de NG 64 em ISO 100 é utilizado a 8 m, em f/8 e potência total. O fotógrafo passa para ISO 400, reduz a potência do flash para 1/4 e mantém distância e abertura. Considerando exclusivamente essas alterações, a exposição produzida pelo flash sobre o objeto será:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'2 EV menor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1 EV menor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'equivalente à inicial.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1 EV maior.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'2 EV maior.', 0);

    -- Q100 (lote05.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q100', N'Um fotógrafo utiliza inicialmente: NG 48 em ISO 100 — potência total — distância de 6 m — f/8. Em uma segunda fotografia, deseja manter f/8, mas passa para ISO 400 e posiciona o flash a 12 m, mantendo potência total. Considerando a relação teórica entre NG, ISO e distância, a segunda fotografia apresentará, em relação à primeira:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'subexposição de aproximadamente 2 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'subexposição de aproximadamente 1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exposição aproximadamente equivalente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'superexposição de aproximadamente 1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'superexposição de aproximadamente 2 EV.', 0);

    -- Q101 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q101', N'Uma câmera está configurada para WB manual de 3200 K, mas a cena é iluminada predominantemente por luz do dia de aproximadamente 5600 K. O fotógrafo registra simultaneamente RAW + JPEG. Considerando o JPEG produzido pela câmera e desconsiderando outros desvios cromáticos, espera-se predominantemente:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'dominante amarelada, porque o WB selecionado possui temperatura inferior à fonte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'dominante azulada, porque a câmera aplica uma compensação adequada a uma fonte mais amarelada do que aquela que efetivamente ilumina a cena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'neutralidade cromática, pois qualquer configuração manual de WB é substituída pelo AWB no processamento JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'dominante verde, pois toda diferença superior a 2000 K desloca a imagem para o eixo verde-magenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ausência de dominante, porque a temperatura de cor influencia somente arquivos RAW.', 0);

    -- Q102 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q102', N'Uma fotografia apresenta forte dominante azulada porque o fotógrafo selecionou manualmente um valor Kelvin inadequado. A iluminação da cena permanece inalterada. Para corrigir o problema utilizando exclusivamente o ajuste Kelvin do WB, deverá, em princípio:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o valor Kelvin configurado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminuir o valor Kelvin configurado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar o ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'deslocar obrigatoriamente o tint para verde.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir a exposição.', 0);

    -- Q103 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q103', N'Durante uma documentação técnica, o fotógrafo utiliza uma referência declaradamente neutra sob a mesma iluminação que incide sobre o objeto para estabelecer um WB personalizado. A principal finalidade desse procedimento é:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'obrigar todos os canais RGB a atingirem o valor máximo, estabelecendo simultaneamente a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permitir que o sistema estime a compensação cromática necessária para que uma referência neutra seja reproduzida sem dominante relevante.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'determinar automaticamente a temperatura física da superfície fotografada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'medir exclusivamente a intensidade luminosa incidente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'estabelecer o ponto preto da imagem, sem interferir no equilíbrio entre os canais.', 0);

    -- Q104 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q104', N'Uma sala é iluminada simultaneamente por tungstênio de aproximadamente 3200 K e luz natural de aproximadamente 5600 K. Uma pessoa recebe predominantemente tungstênio de um lado do rosto e luz natural do outro. O fotógrafo realiza um único WB personalizado utilizando uma referência neutra posicionada junto ao lado iluminado pelo tungstênio. O resultado mais provável é:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'as duas iluminações serão necessariamente neutralizadas, pois o WB personalizado identifica todas as fontes presentes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a região iluminada pelo tungstênio poderá ser neutralizada adequadamente, enquanto a região predominantemente iluminada pela luz natural poderá adquirir dominante cromática.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a luz natural será fisicamente convertida em 3200 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas a exposição será alterada; o equilíbrio cromático permanecerá igual nos dois lados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o WB personalizado será ignorado porque existem duas fontes.', 0);

    -- Q105 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q105', N'Uma fonte LED apresenta temperatura de cor correlata de aproximadamente 5000 K, mas produz uma dominante esverdeada perceptível. A câmera é configurada manualmente exatamente para 5000 K, porém a dominante verde permanece. Isso ocorre porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o ajuste Kelvin atua principalmente no eixo azul–âmbar e não necessariamente corrige integralmente desvios no eixo verde–magenta.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'uma fonte de 5000 K não pode apresentar dominante verde.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o WB somente funciona abaixo de 4500 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o verde é corrigido aumentando-se obrigatoriamente o valor Kelvin.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a temperatura de cor correlata determina completamente a distribuição espectral da fonte.', 0);

    -- Q106 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q106', N'Uma fotografia RAW foi registrada com WB incorreto. Nenhum dos canais relevantes foi saturado em razão da exposição, e o arquivo possui informação suficiente para processamento. Comparada ao JPEG produzido simultaneamente, a correção posterior do WB no RAW tende a ser mais flexível principalmente porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o RAW preserva dados do sensor em estado menos processado, enquanto no JPEG o balanço e outras transformações já foram incorporados ao processamento da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o RAW não possui nenhuma informação de balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o JPEG registra somente luminância e não possui informação cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o RAW permite reconstruir qualquer informação cromática que tenha sido fisicamente perdida por saturação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o JPEG não permite qualquer alteração cromática posterior.', 0);

    -- Q107 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q107', N'Uma cena iluminada por uma fonte de aproximadamente 3000 K é fotografada inicialmente com WB em 3000 K e apresenta aparência neutra. Sem alterar a iluminação, o fotógrafo muda o WB para 6000 K. A segunda imagem tenderá a ficar:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'mais azulada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'mais quente/amarelada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'mais esverdeada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'menos saturada, sem alteração de dominante.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'idêntica, porque a temperatura da fonte não mudou.', 0);

    -- Q108 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q108', N'O fotógrafo pretende realizar um WB personalizado para documentar com maior consistência cromática determinado objeto. Ele fotografa a referência neutra sob uma iluminação e, em seguida, desloca o objeto para outra área na qual predomina uma fonte luminosa diferente. A principal limitação desse procedimento é que:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o WB calculado para a primeira condição pode não ser adequado à distribuição espectral/temperatura de cor da segunda iluminação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'referências neutras somente funcionam com flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'mudar a iluminação altera apenas a exposição, nunca o balanço cromático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o WB personalizado permanece universalmente válido até que a objetiva seja substituída.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o WB depende exclusivamente do ISO utilizado na fotografia da referência.', 0);

    -- Q109 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q109', N'Um fotógrafo registra uma cena em JPEG utilizando AWB. Dentro do enquadramento há uma grande superfície intensamente avermelhada que ocupa quase toda a imagem, embora a iluminação seja relativamente neutra. Em determinadas câmeras e situações, o AWB pode produzir resultado indesejado porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'algoritmos automáticos podem interpretar características cromáticas predominantes da própria cena como uma dominante da iluminação e tentar compensá-las.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o AWB mede diretamente a temperatura física dos objetos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'qualquer superfície vermelha obriga o AWB a selecionar exatamente 3200 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o AWB não analisa informação cromática da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o AWB somente funciona quando existe uma superfície branca ocupando exatamente 18% do quadro.', 0);

    -- Q110 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q110', N'Uma cena é fotografada duas vezes sob iluminação constante. Na primeira captura, o WB está em 4000 K; na segunda, em 7000 K. Considerando exclusivamente o ajuste do WB, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a segunda captura tende a receber compensação mais quente que a primeira.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a segunda captura tende a receber compensação mais azulada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar Kelvin no WB equivale a aumentar a temperatura física da fonte luminosa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'as duas imagens serão idênticas se o ISO permanecer constante.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a segunda imagem necessariamente apresentará dominante verde.', 0);

    -- Q111 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q111', N'Um fotógrafo utiliza flash de aproximadamente 5600 K como iluminação principal em ambiente com lâmpadas de aproximadamente 3200 K. O objeto é predominantemente iluminado pelo flash, enquanto o fundo recebe principalmente a iluminação ambiente. A câmera é configurada para WB de aproximadamente 5600 K. O resultado esperado é:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'objeto aproximadamente neutro e fundo tendendo ao amarelo/alaranjado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'objeto azulado e fundo perfeitamente neutro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'objeto e fundo necessariamente neutros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'objeto esverdeado e fundo magenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'objeto alaranjado e fundo azulado.', 0);

    -- Q112 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q112', N'Na situação da questão anterior, o fotógrafo coloca sobre o flash um filtro corretivo adequado para aproximar sua saída da iluminação de 3200 K e então configura o WB da câmera aproximadamente para essa temperatura. A finalidade principal é:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aproximar cromaticamente as fontes antes da compensação global, facilitando a obtenção de aparência mais uniforme entre objeto e ambiente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar o número-guia do flash sem alterar sua potência.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'transformar o espectro das duas fontes em espectros fisicamente idênticos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'eliminar a necessidade de qualquer avaliação da reprodução cromática das fontes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'permitir utilizar ISO mais baixo sem alterar a exposição.', 0);

    -- Q113 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q113', N'Durante uma documentação, uma referência cinza é utilizada para fotometria e posteriormente considerada automaticamente adequada para WB. Sobre essa conduta, é correto afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'qualquer superfície com refletância próxima de 18% é necessariamente espectralmente neutra e ideal para WB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'uma referência destinada à exposição não é necessariamente suficientemente neutra para calibração cromática; sua adequação ao WB depende de suas características espectrais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o WB exige obrigatoriamente uma superfície com exatamente 18% de refletância.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'somente superfícies pretas podem fornecer referência cromática neutra.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'refletância e neutralidade espectral são exatamente a mesma propriedade.', 0);

    -- Q114 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q114', N'Uma câmera oferece controles independentes de temperatura de cor (Kelvin) e Tint/Matiz verde–magenta. Essa separação é útil porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'nem toda dominante cromática pode ser descrita ou corrigida apenas pelo eixo associado à temperatura de cor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Kelvin controla somente exposição e Tint controla somente foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'verde e magenta correspondem necessariamente a temperaturas inferiores a 2000 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Tint modifica fisicamente o espectro emitido pela fonte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'os dois controles realizam exatamente a mesma correção.', 0);

    -- Q115 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q115', N'Uma fotografia realizada sob luz fluorescente apresenta tonalidade desagradável mesmo depois de um ajuste aproximado de Kelvin. A melhor explicação é:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'algumas fontes podem apresentar distribuição espectral descontínua e desvios cromáticos que não são integralmente descritos por um único valor Kelvin.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fontes fluorescentes não produzem luz visível contínua e, portanto, não podem ser fotografadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o Kelvin somente é aplicável à luz solar.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar o ISO neutraliza automaticamente picos espectrais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o WB não pode ser utilizado com iluminação artificial.', 0);

    -- Q116 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q116', N'Uma fotografia em RAW foi capturada com WB de câmera em 7000 K. Ao abrir o arquivo no software de processamento, o programa inicialmente apresenta aparência semelhante à visualizada na câmera. Isso não significa necessariamente que a transformação de WB tenha sido irreversivelmente aplicada aos dados brutos porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o software pode interpretar os metadados de WB registrados pela câmera e utilizá-los como ponto inicial de renderização.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'arquivos RAW são obrigatoriamente convertidos para JPEG dentro da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a matriz Bayer muda fisicamente de cor conforme o WB escolhido.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o conversor A/D altera permanentemente sua profundidade de bits conforme o Kelvin.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'RAW não armazena qualquer metadado relacionado às configurações da captura.', 0);

    -- Q117 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q117', N'Em uma cena tecnicamente iluminada por uma única fonte estável, o fotógrafo necessita produzir uma sequência de imagens com máxima consistência cromática entre os arquivos. Comparado ao AWB, um WB manual/personalizado adequado pode ser vantajoso porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'evita que o algoritmo automático realize pequenas mudanças de interpretação cromática entre enquadramentos diferentes da mesma sequência.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumenta automaticamente a faixa dinâmica do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'elimina qualquer possibilidade de metamerismo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'garante reprodução absolutamente exata das cores independentemente do espectro da fonte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumenta a profundidade de bits do arquivo.', 0);

    -- Q118 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q118', N'Um objeto possui áreas brancas, porém nenhuma delas é conhecida como referência espectralmente neutra. O fotógrafo deseja estabelecer um WB tecnicamente controlado. A conduta mais adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'presumir que qualquer região visualmente branca seja uma referência perfeita.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar, quando disponível, uma referência neutra apropriada e conhecida sob a iluminação efetiva da cena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'superexpor qualquer superfície branca até ocorrer clipping e utilizá-la como referência.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar a região mais clara da imagem independentemente de sua cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'selecionar obrigatoriamente 5500 K, pois branco corresponde à luz do dia.', 0);

    -- Q119 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q119', N'Uma referência neutra utilizada para WB foi fotografada com um dos canais cromáticos severamente saturado (clipping). Por que isso pode prejudicar a determinação do balanço?', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a saturação pode eliminar informação necessária para estimar corretamente a relação entre os canais na referência.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'clipping aumenta a precisão do WB porque força o canal a um valor conhecido.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o WB depende exclusivamente da luminância total e ignora relações entre canais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'somente clipping nas sombras interfere no WB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'uma referência de WB deve obrigatoriamente ser registrada com todos os canais saturados.', 0);

    -- Q120 (lote06.txt, tema Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q120', N'Um fotógrafo realiza uma reprodução técnica sob uma fonte cuja temperatura de cor correlata é conhecida e configura corretamente o Kelvin. Apesar disso, determinadas cores do objeto continuam significativamente diferentes da aparência obtida sob uma fonte de referência de alta qualidade. A conclusão mais tecnicamente adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'acertar o WB garante correspondência cromática perfeita entre quaisquer fontes com o mesmo Kelvin.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o WB pode neutralizar a dominante global, mas não corrige necessariamente deficiências da distribuição espectral da fonte nem garante reprodução idêntica de todas as cores.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o fenômeno somente pode ocorrer se a velocidade do obturador estiver incorreta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a diferença demonstra necessariamente erro do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'basta alterar o Kelvin até todas as cores individuais coincidirem, independentemente do espectro da fonte.', 0);

    -- Q121 (lote07.txt, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q121', N'Em uma câmera digital dotada de sensor com matriz Bayer convencional, a formação da imagem digital envolve diversas etapas. A respeito desse processo, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Cada fotodiodo produz diretamente um pixel RGB completo antes da conversão analógico-digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O sinal produzido pelos fotodiodos é convertido em valores digitais e, posteriormente, informações cromáticas ausentes em cada posição podem ser estimadas pelo processo de demosaicing.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O demosaicing ocorre antes da incidência da luz sobre o sensor e determina quais comprimentos de onda alcançarão cada fotodiodo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O conversor A/D é responsável por interpolar os canais RGB ausentes, não participando da quantização do sinal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A matriz Bayer elimina a necessidade de processamento cromático posterior.', 0);

    -- Q122 (lote07.txt, tema Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q122', N'Uma câmera registra arquivos RAW em 14 bits, enquanto o JPEG produzido pelo equipamento é armazenado em 8 bits por canal. Considerando exclusivamente a capacidade teórica de representação tonal, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'14 bits representam 14 vezes mais níveis que 8 bits.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'14 bits permitem 16.384 níveis por amostra, enquanto 8 bits permitem 256, sem que isso implique automaticamente 16.384 níveis visualmente distinguíveis ou úteis.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a profundidade de bits aumenta proporcionalmente a quantidade de pixels do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'8 bits permitem 8² níveis e 14 bits permitem 14² níveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'profundidade de bits está relacionada exclusivamente à resolução espacial.', 0);

    -- Q123 (lote07.txt, tema Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q123', N'Um fotógrafo altera a abertura de f/4 para f/8, mantendo ISO e velocidade constantes. Desconsiderando outras variáveis, essa alteração:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduz a luz em 1 EV e necessariamente aumenta a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduz a luz em 2 EV e, nas mesmas condições de enquadramento e foco, tende a aumentar a profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumenta a luz em 2 EV porque o número f aumentou.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reduz a luz em 4 EV porque o número f dobrou.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'não altera a exposição, pois abertura influencia somente profundidade de campo.', 0);

    -- Q124 (lote07.txt, tema Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q124', N'A respeito do número f, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/2 possui abertura fisicamente menor que f/8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O número f corresponde, idealmente, à relação entre distância focal e diâmetro efetivo da pupila de entrada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Dobrar o número f sempre reduz a exposição em apenas 1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O número f determina exclusivamente a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/16 transmite quatro vezes mais luz que f/8.', 0);

    -- Q125 (lote07.txt, tema Obturador)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q125', N'Uma fotografia apresenta movimento do objeto borrado, embora elementos imóveis da cena estejam suficientemente nítidos. O fotógrafo pretende reduzir esse borramento sem alterar o movimento do objeto. Entre as medidas abaixo, a mais diretamente relacionada ao problema é:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar velocidade de obturação mais rápida e compensar a perda de exposição por outra variável, se necessário.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fechar o diafragma mantendo todas as demais variáveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o ISO sem alterar abertura ou velocidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a profundidade de bits do RAW.', 0);

    -- Q126 (lote07.txt, tema ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q126', N'Em relação ao ISO em uma câmera digital, é tecnicamente mais adequado afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o ISO torna fisicamente cada fotodiodo maior e capaz de capturar mais fótons.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o ajuste ISO está relacionado ao ganho/sensibilidade efetiva do sistema de captura e processamento; elevá-lo não aumenta a quantidade de luz que efetivamente atingiu o sensor durante a exposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar o ISO amplia a abertura física do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO elevado aumenta necessariamente a faixa dinâmica disponível em qualquer sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO altera a duração física da exposição realizada pelo obturador.', 0);

    -- Q127 (lote07.txt, tema ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q127', N'Duas fotografias são realizadas com a mesma câmera, enquadramento, abertura e velocidade. Uma utiliza ISO 100 e a outra ISO 3200, sendo a iluminação mantida constante. Se não houver qualquer outra compensação, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a captura em ISO 3200 recebeu fisicamente 32 vezes mais fótons durante a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a quantidade de luz incidente no sensor durante a exposição não aumenta apenas por causa do ISO, embora a resposta final do sistema ao sinal seja diferente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 3200 aumenta o diâmetro da abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 3200 prolonga automaticamente o tempo durante o qual o obturador permanece aberto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'as duas imagens terão obrigatoriamente relação sinal-ruído idêntica.', 0);

    -- Q128 (lote07.txt, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q128', N'Sobre EXIF, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'É um sistema destinado exclusivamente a armazenar autoria, palavras-chave e legendas editoriais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Pode armazenar informações técnicas da captura, como modelo da câmera, abertura, velocidade, ISO, data/hora e distância focal, conforme o equipamento e o arquivo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'É um formato de imagem concorrente do JPEG e do TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Armazena obrigatoriamente todo o conteúdo bruto produzido pelo sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Sua presença garante juridicamente a autenticidade e a integridade absoluta da fotografia.', 0);

    -- Q129 (lote07.txt, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q129', N'Em um fluxo profissional, um fotógrafo precisa registrar informações como autor, descrição, legenda, direitos e palavras-chave, facilitando organização e intercâmbio editorial. O padrão historicamente associado a esse tipo de informação é:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'IPTC.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Bayer.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'DNG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ICC.', 0);

    -- Q130 (lote07.txt, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q130', N'A respeito de XMP, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'corresponde ao mecanismo físico utilizado pelo sensor para converter fótons em elétrons.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'é uma estrutura extensível de metadados que pode ser utilizada para registrar informações e parâmetros de edição, inclusive em arquivos auxiliares (sidecar) em determinados fluxos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'substitui necessariamente os dados EXIF em toda fotografia digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'somente pode existir dentro de arquivos JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'modifica permanentemente os dados brutos do sensor sempre que um RAW é editado.', 0);

    -- Q131 (lote07.txt, tema Edição de Imagens)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q131', N'Um arquivo RAW é processado de maneira não destrutiva em determinado software. O fotógrafo modifica exposição, contraste, balanço de branco e outros parâmetros, mas mantém o arquivo bruto original. Nesse fluxo, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'necessariamente todos os valores originais do RAW são sobrescritos a cada edição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'as instruções de processamento podem ser armazenadas separadamente ou como metadados, preservando os dados brutos originais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'edição não destrutiva significa que nenhuma imagem processada poderá ser exportada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o RAW é transformado fisicamente em JPEG assim que o primeiro ajuste é realizado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o balanço de branco não pode ser alterado sem modificar irreversivelmente os fotodiodos registrados.', 0);

    -- Q132 (lote07.txt, tema Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q132', N'Um fotógrafo recupera um arquivo JPEG cuja informação EXIF indica ISO 400, f/8 e 1/125 s. A respeito desses metadados, a conclusão tecnicamente mais adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'os valores EXIF constituem prova absoluta e infalsificável de que a fotografia jamais foi modificada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'os dados podem fornecer informações úteis sobre a captura, mas sua existência, isoladamente, não garante autenticidade ou integridade do conteúdo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'EXIF impede qualquer alteração posterior do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'qualquer edição do JPEG obrigatoriamente elimina todos os metadados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'EXIF funciona como assinatura criptográfica obrigatória das câmeras digitais.', 0);

    -- Q133 (lote07.txt, tema ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q133', N'Ao fotografar uma cena estática com câmera em tripé, o fotógrafo reduz ISO 1600 para ISO 100 e compensa integralmente a exposição aumentando o tempo de obturação, sem ocorrência de movimento relevante. Em condições normais, essa decisão pode favorecer:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'menor contribuição de ruído associado ao uso de ISO elevado e melhor aproveitamento da qualidade do sinal, dependendo do sensor e da exposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumento obrigatório do ruído porque o sensor permanece exposto por mais tempo, independentemente da duração utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'menor quantidade de luz captada, pois ISO baixo impede a entrada de fótons.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento automático da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração obrigatória da perspectiva.', 0);

    -- Q134 (lote07.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q134', N'Uma câmera utiliza obturador de plano focal mecânico. Em velocidades superiores à velocidade normal de sincronismo, a segunda cortina pode começar a percorrer o sensor antes que a primeira tenha terminado de descobri-lo completamente. Essa característica explica por que, com flash convencional sem sincronização especial:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'velocidades excessivamente altas podem impedir que todo o sensor seja exposto simultaneamente ao pulso do flash.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o flash deixa de possuir número-guia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o ISO passa automaticamente para o valor mínimo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o diafragma permanece obrigatoriamente aberto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o sensor deixa de realizar conversão A/D.', 0);

    -- Q135 (lote07.txt, tema Obturador)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q135', N'Em uma câmera com obturador eletrônico baseado em leitura sequencial do sensor, um objeto em rápido movimento pode aparecer geometricamente deformado mesmo quando o tempo nominal de exposição de cada linha é curto. Esse fenômeno está associado principalmente:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao rolling shutter.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'à difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao moiré cromático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'à aberração esférica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao balanço de branco automático.', 0);

    -- Q136 (lote07.txt, tema ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q136', N'Uma cena contém altas luzes muito intensas e sombras profundas. O fotógrafo aumenta significativamente o ISO mantendo a mesma abertura e a mesma velocidade, e as altas luzes passam a atingir o limite de codificação do sistema. A interpretação mais adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'elevar o ISO criou novos fótons nas altas luzes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o ganho/resposta associada ao ISO pode levar valores já capturados a atingir o limite disponível mais cedo, sem que o ISO tenha aumentado a quantidade de luz incidente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o ISO aumentou a abertura efetiva da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o clipping demonstra obrigatoriamente que o sensor recebeu mais luz fisicamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar ISO sempre aumenta a faixa dinâmica de altas luzes.', 0);

    -- Q137 (lote07.txt, tema Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q137', N'Um fotógrafo fecha o diafragma progressivamente de f/5,6 para f/22, mantendo o foco e compensando a exposição pelo obturador. Embora a profundidade de campo aumente, observa perda de resolução fina em f/22. A explicação mais adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o aumento do ISO provocado automaticamente pelo fechamento do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a difração, que pode comprometer a nitidez em aberturas muito pequenas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o rolling shutter provocado pelas lâminas do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o aumento da aberração cromática causado exclusivamente pelo maior número f.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a redução da profundidade de campo.', 0);

    -- Q138 (lote07.txt, tema Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q138', N'Uma fotografia foi realizada com 1/15 s, e o fotógrafo percebe borramento causado pela própria movimentação da câmera. Ele pretende utilizar 1/125 s, mantendo a exposição equivalente e sem alterar a iluminação. Se a abertura não puder ser modificada, qual alteração de ISO compensa exatamente a diferença, partindo de ISO 100?', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 200.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 400.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 800.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 1600.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 3200.', 0);

    -- Q139 (lote07.txt, tema Obturador)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q139', N'Um fotógrafo pretende produzir uma imagem em que um objeto em movimento apresente borramento intencional, enquanto a exposição global seja mantida. A estratégia conceitualmente adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar tempo de exposição mais longo e compensar, quando necessário, por abertura, ISO ou controle da luz incidente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar exclusivamente a profundidade de bits.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a velocidade do obturador e o ISO na mesma proporção.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'alterar EXIF antes da captura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar exclusivamente abertura maior, pois borramento de movimento independe do tempo de exposição.', 0);

    -- Q140 (lote07.txt, tema Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q140', N'Durante o processamento de uma fotografia RAW proveniente de sensor Bayer, considere a sequência conceitual: I. captação da luz e geração de sinal nos fotodiodos; II. conversão do sinal para representação digital; III. reconstrução/interpretação cromática necessária à formação de uma imagem RGB; IV. aplicação de diversos parâmetros de processamento para obtenção de uma imagem final. Assinale a alternativa que associa corretamente esses processos.', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I corresponde ao EXIF; II ao IPTC; III ao ISO; IV ao obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'II envolve conversão A/D; III pode envolver demosaicing; IV pode incluir balanço de branco, curva tonal, nitidez e outros ajustes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'II corresponde exclusivamente ao demosaicing e III exclusivamente à compressão JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'III ocorre fisicamente dentro de cada fotodiodo antes da captura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'IV é inexistente quando a câmera produz JPEG, pois JPEG representa diretamente os dados crus do sensor.', 0);

    -- Q141 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q141', N'Uma cena apresenta exposição correta em ISO 100, f/8 e 1/250 s. O fotógrafo instala um filtro ND8, mantendo ISO e abertura inalterados. Para conservar a mesma exposição, deverá utilizar aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/30 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/60 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/125 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/500 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/1000 s.', 0);

    -- Q142 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q142', N'Um fotógrafo deseja registrar o movimento da água com 1 segundo, mas a exposição correta, sem filtro e mantendo ISO e abertura pretendidos, seria obtida em 1/125 s. Considerando filtros ND definidos pelo fator de transmissão e stops completos, o filtro teoricamente adequado será:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ND8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ND16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ND32.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ND64.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ND128.', 1);

    -- Q143 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q143', N'Em uma fotografia de paisagem, o fotógrafo utiliza um polarizador circular (CPL) com a intenção de aumentar a saturação aparente do céu e reduzir determinados reflexos. Sobre o funcionamento desse filtro, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Sua eficácia sobre o céu é uniforme em qualquer direção da câmera em relação ao Sol.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Seu efeito sobre determinados reflexos varia com a orientação do filtro e com a geometria entre fonte, superfície e câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O CPL elimina integralmente reflexos produzidos por qualquer superfície metálica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Seu principal efeito decorre da redução seletiva da radiação ultravioleta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O CPL atua apenas durante o processamento digital, não modificando a luz que chega ao sensor.', 0);

    -- Q144 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q144', N'Um fotógrafo utiliza um polarizador em uma objetiva ultra grande-angular para registrar um céu azul extenso. A fotografia apresenta regiões do céu com escurecimento/saturação muito diferentes entre si. A explicação mais adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o filtro obrigatoriamente apresenta densidade neutra graduada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o amplo ângulo de visão inclui regiões do céu com diferentes relações angulares em relação ao Sol, produzindo polarização desigual.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o efeito demonstra necessariamente vinhetagem mecânica causada pela espessura do filtro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'polarizadores somente funcionam com teleobjetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o fenômeno decorre exclusivamente da aberração cromática da objetiva.', 0);

    -- Q145 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q145', N'Ao fotografar um objeto atrás de um vidro, o fotógrafo gira um filtro polarizador e observa redução significativa de determinados reflexos, mas eles não desaparecem completamente. A conclusão tecnicamente correta é:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o filtro está defeituoso, pois um polarizador deve eliminar integralmente qualquer reflexão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a capacidade de redução depende, entre outros fatores, do estado de polarização da luz refletida e da geometria da cena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reflexos em vidro não podem ser afetados por polarização.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o filtro atua apenas reduzindo a exposição global, sendo a mudança dos reflexos uma ilusão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o efeito somente poderia ocorrer com filtro ND variável.', 0);

    -- Q146 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q146', N'Sobre o polarizador circular utilizado em câmeras modernas, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Ele não possui qualquer elemento de polarização linear.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Tipicamente combina um elemento polarizador linear com um elemento de quarto de onda, permitindo obter o efeito de polarização sem causar determinados problemas que polarizadores lineares podem provocar em sistemas de medição/autofoco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Sua denominação significa que o filtro precisa ser fisicamente circular.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Ele produz necessariamente imagem circular no sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Diferentemente do polarizador linear, não reduz reflexos.', 0);

    -- Q147 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q147', N'Uma cena está corretamente exposta em 1/30 s, f/11 e ISO 100. O fotógrafo instala um filtro ND64, mantendo abertura e ISO. A nova velocidade necessária será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/2 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'2 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'4 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'8 s.', 0);

    -- Q148 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q148', N'Um fotógrafo empilha um ND4 e um ND8, desconsiderando perdas adicionais e possíveis alterações ópticas. A redução total de exposição será de:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'3 stops.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'4 stops.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'5 stops.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'6 stops.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'12 stops.', 0);

    -- Q149 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q149', N'Dois filtros apresentam, respectivamente, fatores ND8 e ND32. Comparando-os, o ND32 reduz a exposição em relação à ausência de filtro em:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'2 stops, enquanto ND8 reduz 1.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'3 stops, enquanto ND8 reduz 2.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'5 stops, enquanto ND8 reduz 3.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'8 stops, enquanto ND8 reduz 3.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'32 stops, enquanto ND8 reduz 8.', 0);

    -- Q150 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q150', N'Um filtro ND apresenta densidade óptica 0,9. Utilizando a convenção em que aproximadamente 0,3 de densidade óptica corresponde a 1 stop, esse filtro reduz a exposição em:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1 stop.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'2 stops.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'3 stops.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'6 stops.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'9 stops.', 0);

    -- Q151 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q151', N'Em uma paisagem, o céu encontra-se significativamente mais luminoso que o primeiro plano. O fotógrafo deseja reduzir a exposição do céu durante a captura sem aplicar a mesma redução à região inferior da imagem. O filtro mais diretamente indicado para essa finalidade é:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'UV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'polarizador circular obrigatoriamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ND graduado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ND uniforme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'filtro close-up.', 0);

    -- Q152 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q152', N'Ao utilizar um ND graduado, a escolha entre uma transição mais dura (hard edge) ou mais suave (soft edge) deve considerar principalmente:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'somente o ISO utilizado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a geometria da transição entre as regiões claras e escuras da cena, como a definição da linha do horizonte.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusivamente a temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a profundidade de bits do arquivo RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a distância mínima de foco da objetiva.', 0);

    -- Q153 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q153', N'Um fotógrafo utiliza um ND variável em alta densidade e observa um padrão irregular de escurecimento, frequentemente descrito como efeito em “X”. Esse fenômeno pode ocorrer porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'filtros ND variáveis normalmente utilizam elementos polarizadores, e posições extremas podem produzir distribuição não uniforme da atenuação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'todo filtro ND sólido produz necessariamente esse padrão acima de três stops.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o efeito é causado exclusivamente pelo ISO elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'filtros ND variáveis alteram mecanicamente a abertura da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o padrão indica necessariamente defeito do sensor.', 0);

    -- Q154 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q154', N'Sobre filtros UV em fotografia digital moderna, assinale a alternativa tecnicamente mais adequada.', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'São indispensáveis para impedir que qualquer radiação ultravioleta alcance sensores digitais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Em muitas câmeras digitais, a filtragem espectral do próprio sistema já reduz significativamente UV/IR; um filtro UV frontal pode ser utilizado principalmente como proteção física, mas também acrescenta superfícies ópticas ao sistema.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Aumentam necessariamente a resolução da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Eliminam reflexos em vidro com a mesma eficiência de um polarizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Produzem redução fixa de exatamente 2 EV.', 0);

    -- Q155 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q155', N'Um fotógrafo instala um filtro transparente de baixa qualidade diante de uma objetiva de alto desempenho e passa a observar maior ocorrência de flare e imagens fantasmas ao fotografar fontes luminosas intensas. A explicação mais adequada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'qualquer filtro frontal aumenta necessariamente a distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'superfícies ópticas adicionais podem introduzir reflexões internas, especialmente quando revestimentos antirreflexo são inadequados.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o filtro aumenta o tamanho dos fotodiodos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'flare é produzido exclusivamente pelo obturador eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'filtros transparentes não podem interferir na formação da imagem.', 0);

    -- Q156 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q156', N'Um filtro polarizador produz aproximadamente 2 stops de perda luminosa em determinada posição. Uma cena, antes da colocação do filtro, é corretamente registrada em ISO 100, f/8 e 1/250 s. Mantendo ISO e abertura, a velocidade necessária após a colocação do polarizador será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/30 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/60 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/125 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/500 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/1000 s.', 0);

    -- Q157 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q157', N'Um fotógrafo deseja utilizar f/2,8 em ambiente externo muito iluminado para obter pequena profundidade de campo. Sem filtro, a exposição correta seria f/8 a 1/1000 s, e ele pretende manter 1/1000 s e o mesmo ISO. Qual filtro ND, considerando stops completos, permitirá aproximadamente a alteração desejada?', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ND2.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ND4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ND8.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ND16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ND32.', 0);

    -- Q158 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q158', N'Um fotógrafo pretende reduzir reflexos em uma superfície metálica não pintada utilizando apenas um polarizador na objetiva. Em comparação com reflexos provenientes de muitas superfícies dielétricas, como vidro e água, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reflexos metálicos podem responder de maneira diferente e não são necessariamente eliminados eficientemente por um único polarizador na objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reflexos metálicos são sempre 100% linearmente polarizados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o polarizador necessariamente transforma o metal em uma superfície sem brilho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a natureza do material não possui qualquer influência sobre a polarização da luz refletida.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente filtros UV conseguem reduzir reflexos metálicos.', 0);

    -- Q159 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q159', N'Em fotografia técnica de uma superfície brilhante, filtros polarizadores são colocados sobre as fontes luminosas e outro polarizador é utilizado na objetiva, com suas orientações ajustadas para reduzir fortemente reflexos especulares. A técnica descrita é denominada:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'bracketing polarimétrico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'polarização cruzada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'filtragem graduada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sincronização polarizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'compensação espectral ND.', 0);

    -- Q160 (lote08.txt, tema Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q160', N'Um fotógrafo precisa realizar uma longa exposição e combina ND8 + ND16. Sem os filtros, a exposição correta é 1/125 s, mantendo-se ISO e abertura constantes. Desconsiderando reciprocidade e outras perdas, a velocidade aproximada após a combinação será:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/2 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'2 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'4 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'8 s.', 0);

    -- Q161 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q161', N'Em uma câmera equipada com obturador mecânico de plano focal, um flash convencional é utilizado em velocidade superior à máxima de sincronismo, sem HSS. A ocorrência de uma faixa escura em parte da fotografia é explicada principalmente porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o pulso do flash torna-se mais longo que o tempo total necessário para movimentação das duas cortinas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o sensor não se encontra integralmente descoberto em um único instante durante o pulso do flash.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o diafragma não consegue atingir a abertura selecionada antes do disparo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o flash reduz automaticamente sua potência quando detecta velocidade elevada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o sensor interrompe a leitura dos fotodiodos quando a segunda cortina começa a se mover.', 0);

    -- Q162 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q162', N'Durante uma fotografia com flash convencional, o objeto principal é iluminado predominantemente pelo flash e o fundo, predominantemente pela iluminação ambiente. Mantendo ISO, abertura, potência e distância do flash constantes, o fotógrafo altera o obturador de 1/60 s para 1/15 s. Dentro da faixa normal de sincronismo, espera-se que:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'objeto e fundo aumentem igualmente 2 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a contribuição do flash sobre o objeto permaneça aproximadamente constante, enquanto o fundo receba aproximadamente 2 EV adicionais de luz ambiente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o objeto receba 2 EV adicionais do flash e o fundo permaneça praticamente inalterado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a potência do flash seja automaticamente reduzida em 2 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apenas a profundidade de campo seja alterada.', 0);

    -- Q163 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q163', N'Um fotógrafo utiliza flash manual em potência total e obtém determinada exposição. Sem alterar ISO, abertura ou distância, reduz a potência para 1/8. A exposição proveniente do flash será reduzida aproximadamente em:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'2 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'3 EV.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'4 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'8 EV.', 0);

    -- Q164 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q164', N'Em determinado flash eletrônico, a redução da potência de 1/1 para 1/16 é obtida interrompendo mais cedo a descarga do tubo. Uma consequência típica dessa redução é:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da duração efetiva do pulso.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução da duração efetiva do pulso, o que pode favorecer o congelamento de movimentos rápidos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento automático da luz ambiente registrada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redução da velocidade máxima de sincronismo mecânico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumento obrigatório do número-guia.', 0);

    -- Q165 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q165', N'Em uma fotografia realizada em ambiente escuro, uma pessoa caminha durante a exposição. O fotógrafo utiliza velocidade relativamente lenta e deseja que o rastro produzido pela luz ambiente apareça atrás do movimento, com o instante congelado pelo flash próximo ao final da trajetória registrada. A configuração mais diretamente associada a esse resultado é:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sincronismo de primeira cortina.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sincronismo de segunda cortina.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'HSS.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'flash estroboscópico obrigatoriamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'compensação TTL positiva.', 0);

    -- Q166 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q166', N'A diferença visual entre sincronismo de primeira e segunda cortina torna-se especialmente perceptível quando:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'são utilizadas exposições suficientemente longas para registrar movimento/luz ambiente além do instante do pulso do flash.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a velocidade é extremamente alta e nenhuma luz ambiente é registrada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a fotografia é realizada sem qualquer movimento na cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o flash está desligado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o arquivo é obrigatoriamente RAW.', 0);

    -- Q167 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q167', N'Em um sistema TTL, imediatamente antes ou durante a sequência de exposição, a câmera pode realizar medições destinadas a determinar automaticamente a energia necessária do flash. A respeito desse sistema, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'TTL significa que a potência do flash é sempre máxima.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o sistema procura controlar automaticamente a contribuição do flash com base na medição realizada pelo conjunto câmera/flash, podendo ser influenciado pela refletância e composição da cena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'TTL elimina qualquer possibilidade de erro de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'TTL determina a potência exclusivamente pela distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a medição TTL independe completamente da cena fotografada.', 0);

    -- Q168 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q168', N'Uma pessoa vestindo predominantemente roupa branca ocupa grande parte do enquadramento em uma fotografia realizada com flash TTL. Em determinadas condições, o sistema pode interpretar a elevada quantidade de luz retornada como indicação de que já recebeu iluminação suficiente. O resultado possível é:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o sistema aumentar obrigatoriamente a potência e produzir superexposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o sistema reduzir a contribuição do flash, podendo produzir resultado mais escuro que o desejado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o flash passar automaticamente para HSS.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a velocidade do obturador aumentar obrigatoriamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o ISO ser reduzido fisicamente no sensor.', 0);

    -- Q169 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q169', N'Em uma situação semelhante, um objeto predominantemente muito escuro ocupa grande parte do quadro e o flash está em TTL. Dependendo do algoritmo de medição, pode ocorrer:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento excessivo da contribuição do flash na tentativa de elevar a resposta medida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução obrigatória da potência para zero.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'alteração automática da temperatura de cor para 3200 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'impossibilidade física de funcionamento do TTL.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'redução do número-guia nominal da unidade.', 0);

    -- Q170 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q170', N'Um fotógrafo passa do modo TTL para o modo manual do flash, mantendo câmera, objeto e flash em posições fixas. Uma vantagem importante dessa decisão em uma sequência de fotografias sob condições controladas é:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a potência passa a variar automaticamente conforme cada enquadramento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a contribuição do flash pode permanecer consistente entre as capturas, desde que potência, distância e demais parâmetros relevantes sejam mantidos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a câmera passa a ignorar abertura e ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a potência manual compensa automaticamente qualquer mudança na distância flash- objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o modo manual elimina a influência da lei do inverso do quadrado.', 0);

    -- Q171 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q171', N'Um fotógrafo utiliza flash direto a determinada distância do objeto. Em seguida, sem modificar potência, ISO ou abertura, dobra a distância entre o flash e o objeto. Desconsiderando outras reflexões, a iluminância incidente sobre o objeto será aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'metade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'um quarto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'um oitavo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o dobro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'quatro vezes maior.', 0);

    -- Q172 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q172', N'Um fotógrafo posiciona o flash a 2 m de um objeto e outro objeto encontra-se a 4 m do mesmo flash, ambos recebendo iluminação direta. Desconsiderando luz ambiente e outras reflexões, o segundo objeto receberá aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'metade da iluminância do primeiro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'um quarto da iluminância do primeiro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'um oitavo da iluminância do primeiro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'duas vezes a iluminância do primeiro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a mesma iluminância, porque ambos são iluminados pela mesma potência.', 0);

    -- Q173 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q173', N'O fotógrafo aproxima uma fonte de flash modificada do objeto, mantendo enquadramento e potência constantes. Além do aumento da iluminância incidente, uma consequência visual frequentemente observada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a fonte torna-se aparentemente maior em relação ao objeto, podendo produzir transições de sombra mais suaves.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a fonte torna-se aparentemente menor e necessariamente mais dura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a aproximação não interfere na característica das sombras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a luz torna-se mais dura exclusivamente porque a distância diminuiu.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a temperatura de cor necessariamente aumenta proporcionalmente à aproximação.', 0);

    -- Q174 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q174', N'Dois modificadores são utilizados sucessivamente no mesmo flash: primeiro o flash direto sem modificador e depois um softbox de dimensões significativas, posicionado próximo ao objeto. A principal razão para o softbox poder produzir sombras com bordas mais suaves é:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a velocidade de propagação da luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar o tamanho aparente da fonte luminosa em relação ao objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar a lei do inverso do quadrado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'transformar a luz do flash em luz polarizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar necessariamente a potência elétrica do equipamento.', 0);

    -- Q175 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q175', N'Um fotógrafo aponta o flash para um teto branco para iluminar indiretamente uma pessoa. Comparado ao flash direto, é correto afirmar que:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a distância câmera-pessoa continua sendo suficiente, isoladamente, para prever a exposição pelo NG nominal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o percurso da luz, a refletância do teto e as perdas decorrentes do rebatimento passam a influenciar significativamente a quantidade e a qualidade da luz que chega ao objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o teto funciona como amplificador e necessariamente aumenta a energia luminosa disponível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a cor do teto não pode influenciar a aparência cromática da luz rebatida.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'flash rebatido e flash direto apresentam necessariamente a mesma direção e tamanho aparente de fonte.', 0);

    -- Q176 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q176', N'Um flash originalmente próximo de 5500 K é rebatido em uma parede intensamente colorida. Mesmo com a câmera ajustada corretamente para a temperatura de cor nominal do flash, a pessoa fotografada pode apresentar dominante porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a superfície de rebatimento pode absorver e refletir seletivamente diferentes comprimentos de onda, modificando o espectro da luz que chega ao objeto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'qualquer reflexão reduz a temperatura de cor exatamente pela metade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o balanço de branco funciona somente com flash direto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a potência do flash determina exclusivamente sua cor final.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'superfícies coloridas modificam somente a intensidade, jamais a composição espectral da luz.', 0);

    -- Q177 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q177', N'Sobre o High-Speed Sync (HSS), assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O HSS permite trabalhar acima da velocidade normal de sincronismo fazendo com que o flash forneça uma sequência/ emissão prolongada enquanto a fenda do obturador percorre o sensor, normalmente com redução do alcance/potência efetiva disponível.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O HSS mantém obrigatoriamente toda a potência de um único pulso instantâneo em qualquer velocidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O HSS aumenta o número-guia conforme a velocidade do obturador aumenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O HSS somente pode ser utilizado abaixo da velocidade de sincronismo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O HSS funciona aumentando mecanicamente a velocidade das cortinas até que todo o sensor fique descoberto simultaneamente.', 0);

    -- Q178 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q178', N'Em ambiente externo iluminado, um fotógrafo deseja utilizar f/2 para pequena profundidade de campo, mas a exposição ambiente exige velocidade superior à sincronização convencional do flash. Entre as soluções tecnicamente possíveis, está:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar HSS, se câmera e flash forem compatíveis, aceitando a possível redução de eficiência/alcance do flash.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar ainda mais o ISO para obrigar a velocidade a ficar abaixo do sincronismo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar obrigatoriamente sincronismo de segunda cortina, que elimina o limite de sincronismo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a potência do flash até que as cortinas permaneçam totalmente abertas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar TTL, pois TTL elimina fisicamente o limite de sincronização.', 0);

    -- Q179 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q179', N'Em uma fotografia realizada com flash e luz ambiente, o fotógrafo deseja reduzir a contribuição do ambiente em 2 EV sem modificar significativamente a exposição do objeto iluminado predominantemente pelo flash. Mantendo abertura, ISO, potência e distância do flash constantes, e havendo margem dentro da faixa de sincronismo convencional, deverá:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar velocidade de obturação quatro vezes mais rápida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar velocidade quatro vezes mais lenta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir a potência do flash para 1/4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fechar o diafragma em 2 stops.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir ISO em 2 stops.', 0);

    -- Q180 (lote09.txt, tema Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q180', N'Um fotógrafo realiza uma sequência em ambiente controlado com flash manual, câmera em modo manual e praticamente nenhuma contribuição da luz ambiente. Mantém ISO, abertura e distância flash-objeto constantes, mas altera a velocidade de 1/60 s para 1/200 s, ambas dentro da sincronização normal. Se a duração do pulso do flash for muito menor que ambas as velocidades, a exposição do objeto produzida pelo flash tenderá a:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'diminuir aproximadamente 1⅔ EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar aproximadamente 1⅔ EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'permanecer aproximadamente constante.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diminuir na mesma proporção da velocidade, independentemente da duração do pulso.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar porque o pulso ficará concentrado em menor intervalo.', 0);

    -- Q181 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q181', N'Durante a documentação de uma cena, um fotógrafo utiliza um fotômetro de luz incidente, posicionando-o junto ao objeto e orientando adequadamente sua cúpula difusora em relação à iluminação/câmera, conforme a medição pretendida. Comparada à medição refletida convencional realizada pela câmera, uma característica importante dessa técnica é:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'determinar diretamente a refletância percentual de cada superfície da cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'medir a luz que chega ao objeto, reduzindo a influência direta da tonalidade/refletância do objeto sobre a indicação de exposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'medir exclusivamente a parcela de luz refletida pelo objeto em direção à câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'produzir exposições diferentes para objetos claros e escuros mesmo quando submetidos à mesma iluminação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'dispensar a configuração da sensibilidade ISO no fotômetro.', 0);

    -- Q182 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q182', N'Sob iluminação uniforme, dois objetos são fotografados separadamente preenchendo o enquadramento: um branco e outro preto. A câmera utiliza fotometria refletida convencional e a exposição automática, sem compensação. Considerando o princípio de funcionamento desse tipo de medição, é possível que:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o objeto branco seja subexposto em relação à sua aparência esperada e o preto superexposto, pois o sistema tende a interpretar a luminância refletida segundo uma referência intermediária.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ambos sejam necessariamente reproduzidos com suas tonalidades corretas porque o fotômetro identifica a cor original dos objetos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o objeto branco seja sempre superexposto e o preto sempre subexposto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a refletância dos objetos não exerça qualquer influência sobre a leitura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente o objeto preto possa interferir no fotômetro.', 0);

    -- Q183 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q183', N'Um fotógrafo realiza uma leitura refletida sobre uma superfície branca e obtém: ISO 100 — f/8 — 1/250 s Desejando que essa superfície seja registrada aproximadamente 2 EV mais clara que a tonalidade para a qual a medição refletida tenderia a posicioná-la, mantendo ISO e f/8, deverá utilizar aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/60 s.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/125 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/500 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/1000 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/2000 s.', 0);

    -- Q184 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q184', N'Um fotômetro pontual possui ângulo de medição de aproximadamente 1°. Em comparação com uma medição refletida de campo mais amplo, sua principal vantagem operacional é:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'medir exclusivamente luz incidente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permitir selecionar uma pequena região da cena para avaliação de sua luminância refletida, sem que grandes áreas adjacentes participem diretamente da leitura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar automaticamente erros decorrentes da refletância do objeto medido.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'determinar a temperatura de cor da área selecionada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'medir simultaneamente todos os pontos da cena e fornecer sua média aritmética.', 0);

    -- Q185 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q185', N'Um fotógrafo utiliza um spot meter sobre duas regiões da mesma cena. Mantidos ISO e velocidade, a primeira região indica f/4 e a segunda f/16. A diferença de luminância indicada entre essas regiões corresponde aproximadamente a:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'2 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'3 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'4 EV.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'6 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'8 EV.', 0);

    -- Q186 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q186', N'Uma leitura incidente realizada junto ao objeto indica f/8 a 1/125 s em ISO 100. Sem alteração da iluminação, o objeto branco é substituído por outro preto, colocado exatamente na mesma posição. Considerando uma medição incidente adequada, a indicação do fotômetro tenderá a:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'exigir abertura maior para o objeto preto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'exigir abertura menor para o objeto preto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'permanecer essencialmente igual, pois a iluminação incidente não mudou.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'variar obrigatoriamente em função da refletância dos objetos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'tornar-se impossível, pois fotometria incidente exige objeto de tonalidade média.', 0);

    -- Q187 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q187', N'Ao fotografar uma pessoa fortemente iluminada por trás, o fotógrafo utiliza medição matricial da câmera. A grande área luminosa do fundo influencia o cálculo e o rosto fica excessivamente escuro. Uma solução coerente, sem alterar a iluminação da cena, seria:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizar uma medição mais seletiva sobre uma região relevante do sujeito ou aplicar compensação positiva de exposição, conforme o resultado pretendido.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aplicar obrigatoriamente compensação negativa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir o ISO mantendo abertura e velocidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'medir exclusivamente o fundo e reduzir a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a velocidade mantendo todos os demais parâmetros.', 0);

    -- Q188 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q188', N'Em relação aos modos de fotometria matricial, ponderada ao centro e pontual, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Todos utilizam necessariamente a mesma área de leitura e diferem apenas na nomenclatura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A matricial avalia múltiplas áreas do quadro segundo o algoritmo da câmera; a ponderada ao centro atribui maior importância à região central; e a pontual utiliza uma área bastante restrita.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A pontual mede luz incidente e as outras duas medem luz refletida.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A matricial não pode ser influenciada pela distribuição tonal da cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A ponderada ao centro desconsidera completamente todas as regiões periféricas.', 0);

    -- Q189 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q189', N'Uma câmera em modo automático mede uma cena predominantemente coberta por neve e produz uma fotografia em que a neve aparece acinzentada. Considerando que não ocorreu clipping e que o problema decorreu da fotometria refletida, uma correção coerente seria:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aplicar compensação positiva de exposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aplicar compensação negativa de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduzir a exposição porque superfícies brancas devem ser colocadas abaixo da leitura do fotômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'trocar obrigatoriamente o balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar exclusivamente a saturação.', 0);

    -- Q190 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q190', N'Em situação oposta, uma grande superfície preta preenche praticamente toda a área medida pelo fotômetro refletido, e o sistema automático produz uma imagem excessivamente clara. Para preservar a aparência escura pretendida, uma solução possível é:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'compensação positiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'compensação negativa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento obrigatório do ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento da exposição em aproximadamente 2 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alteração do WB para menor Kelvin.', 0);

    -- Q191 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q191', N'Um cartão cinza neutro adequado é utilizado para obter uma leitura refletida de exposição. Para que a medição seja representativa da iluminação incidente sobre o objeto, é importante que o cartão:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'seja colocado sob a mesma iluminação relevante que incide sobre o objeto e orientado de maneira adequada à medição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'seja sempre colocado junto à câmera, independentemente da iluminação recebida pelo objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'esteja obrigatoriamente dois stops subexposto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'preencha somente 1% da área de uma medição matricial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'seja iluminado por uma fonte diferente para evitar influência da cena.', 0);

    -- Q192 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q192', N'Uma cena apresenta três regiões medidas por spot meter: Região I: 1/500 s Região II: 1/125 s Região III: 1/30 s Todas as leituras foram realizadas mantendo ISO e abertura constantes. Entre as regiões I e III existe uma diferença aproximada de:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'2 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'3 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'4 EV.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'5 EV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'6 EV.', 0);

    -- Q193 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q193', N'Um fotômetro indica exposição correta em ISO 100, f/8 e 1/125 s. O fotógrafo altera o fotômetro para ISO 400, sem que a iluminação seja modificada. Mantendo f/8, a nova indicação de velocidade equivalente deverá ser aproximadamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/30 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/60 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/125 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/250 s.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/500 s.', 1);

    -- Q194 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q194', N'Um fotógrafo mede uma cena com um fotômetro refletido e, posteriormente, aproxima-se fisicamente de uma superfície escura até que ela ocupe toda a área de medição. A iluminação permanece inalterada. A leitura pode mudar porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fotômetros refletidos respondem à luminância proveniente da região medida, que depende também das características de reflexão da superfície.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aproximar o fotômetro aumenta fisicamente a iluminação incidente sobre o objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a distância entre câmera e objeto altera necessariamente a iluminância produzida pelo Sol.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fotômetros refletidos transformam-se em incidentes quando aproximados do objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'superfícies escuras emitem mais luz que superfícies claras.', 0);

    -- Q195 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q195', N'Ao utilizar um fotômetro incidente com cúpula difusora (lumisphere), sua função é, em termos gerais:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'restringir a leitura a um ângulo de 1°, como em um spot meter.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'receber luz proveniente das direções relevantes e permitir uma avaliação da iluminação incidente de acordo com a configuração e orientação do instrumento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'medir a refletância espectral do objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituir um filtro polarizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'converter automaticamente a medição incidente em temperatura Kelvin.', 0);

    -- Q196 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q196', N'Um fotógrafo mede a luz incidente junto ao rosto de uma pessoa e obtém f/11. Em seguida, sem mudar ISO, velocidade ou iluminação, mede por luz refletida uma região muito escura da roupa e obtém indicação de f/4. A diferença ocorre principalmente porque:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'as duas medições necessariamente deveriam fornecer exatamente o mesmo valor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a medição refletida é influenciada pela luminância da superfície medida, enquanto a incidente avalia a iluminação que chega ao sujeito.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o fotômetro incidente não considera ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a roupa escura recebe obrigatoriamente menos iluminação que o rosto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/4 e f/11 representam exatamente a mesma exposição.', 0);

    -- Q197 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q197', N'Durante uma medição pontual, determinada área apresenta leitura de f/5,6 a 1/125 s. O fotógrafo deseja deliberadamente registrar essa área 3 EV abaixo do valor indicado pelo fotômetro, mantendo ISO e velocidade. Qual abertura deverá utilizar?', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/2.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/2,8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/16.', 1);

    -- Q198 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q198', N'Em fotografia de estúdio com flashes manuais, um fotômetro externo capaz de medir flash é utilizado junto ao objeto. Para determinar a exposição correspondente à iluminação produzida pelo flash, o instrumento:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pode medir o pulso luminoso e indicar uma abertura compatível com ISO e parâmetros configurados.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'precisa obrigatoriamente medir apenas a luz refletida pela câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'determina a potência elétrica em watts e a converte diretamente em distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'mede exclusivamente a duração do obturador, pois abertura não interfere na exposição do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente funciona com flashes TTL.', 0);

    -- Q199 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q199', N'Em um estúdio, a luz ambiente é baixa e o flash é a principal fonte. Um fotômetro de flash indica f/8 para determinada potência e ISO. O fotógrafo aumenta a potência do flash em 2 EV, sem alterar posição ou ISO. A nova indicação aproximada de abertura será:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/4.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/16.', 1);

    -- Q200 (lote10.txt, tema Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Q200', N'Um fotógrafo realiza uma medição incidente junto ao sujeito e obtém determinada exposição. Posteriormente, sem alterar iluminação, ISO ou parâmetros do fotômetro, gira a cúpula/medidor para uma orientação substancialmente diferente em relação às fontes. A respeito do resultado, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Ineditas - Padrao Vunesp', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A leitura é obrigatoriamente idêntica, pois a orientação de um fotômetro incidente jamais interfere na medição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A leitura pode mudar, pois a orientação da superfície receptora determina quais componentes direcionais da iluminação contribuem para a medição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A leitura somente pode mudar se a refletância do sujeito for alterada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Girar a cúpula transforma automaticamente a medição em spot.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A orientação interfere apenas no balanço de branco, nunca na exposição.', 0);

    COMMIT TRANSACTION;
    PRINT 'Lote de 200 questões hard inserido com sucesso.';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO
