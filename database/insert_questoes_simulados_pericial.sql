-- Insercao de 92 questoes autorais (simulados de revisao) do perfil @sergiofotografopericial
-- Fonte: PDFs "simulado segundo bloco", "simulado4_questoes", "simulado6_questoes", "simulado_explosivo_questoes"
-- IMPORTANTE: conteudo autoral/nao-oficial (nao sao provas de bancas reais) -> banca e ano ficam NULL.
-- Gabarito determinado por analise tecnica propria (PDFs de origem nao continham gabarito).

USE ConcursosDB;
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Tipos de Luzes')
    INSERT INTO temas (nome) VALUES (N'Tipos de Luzes');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Balanço de Branco')
    INSERT INTO temas (nome) VALUES (N'Balanço de Branco');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Flash')
    INSERT INTO temas (nome) VALUES (N'Flash');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Obturador')
    INSERT INTO temas (nome) VALUES (N'Obturador');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Filtros')
    INSERT INTO temas (nome) VALUES (N'Filtros');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Fotometria')
    INSERT INTO temas (nome) VALUES (N'Fotometria');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Luz')
    INSERT INTO temas (nome) VALUES (N'Luz');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Fotografia Analógica')
    INSERT INTO temas (nome) VALUES (N'Fotografia Analógica');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Sensor e Fator de Corte')
    INSERT INTO temas (nome) VALUES (N'Sensor e Fator de Corte');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Resolução e Qualidade de Imagem')
    INSERT INTO temas (nome) VALUES (N'Resolução e Qualidade de Imagem');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Tipos de Arquivos')
    INSERT INTO temas (nome) VALUES (N'Tipos de Arquivos');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Protocolo e Cartão de Memória')
    INSERT INTO temas (nome) VALUES (N'Protocolo e Cartão de Memória');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'ISO')
    INSERT INTO temas (nome) VALUES (N'ISO');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Componentes da Câmera')
    INSERT INTO temas (nome) VALUES (N'Componentes da Câmera');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Modos da Câmera')
    INSERT INTO temas (nome) VALUES (N'Modos da Câmera');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Objetivas')
    INSERT INTO temas (nome) VALUES (N'Objetivas');

-- ============================================================
-- Simulado: Equipamentos de Iluminação
-- ============================================================
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Questao 1 (Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q01', N'Em fotografia, a qualidade da luz de uma fonte artificial é determinada, fundamentalmente, pela relação entre', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a potência em watts da lâmpada e a temperatura ambiente do estúdio, sendo que lâmpadas de maior potência sempre produzem luz de maior qualidade visual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o tamanho aparente da fonte luminosa em relação ao assunto fotografado — fontes grandes e próximas produzem luz difusa com sombras suaves; fontes pequenas ou distantes produzem luz dura com sombras definidas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusivamente a temperatura de cor da fonte, sendo que fontes com temperatura acima de 5.600 K produzem sempre luz de maior qualidade que fontes abaixo desse valor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a quantidade de lúmens emitidos pela fonte, independentemente de seu tamanho ou distância em relação ao assunto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o índice de reprodução de cores (IRC) da fonte, sendo que fontes com IRC acima de 80 produzem obrigatoriamente luz difusa e fontes com IRC inferior a 80 produzem luz dura.', 0);

    -- Questao 2 (Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q02', N'A luz solar direta e a luz do céu (abóbada celeste) são as duas fontes da luz natural disponíveis para a fotografia externa. Sobre as características de cada uma, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A luz solar direta produz sombras suaves e menor contraste; a luz do céu produz sombras definidas e maior contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Ambas produzem sombras de mesma dureza e contraste equivalente, diferindo apenas na temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A luz solar direta produz sombras definidas e maior contraste; a luz do céu (difusa) produz sombras suaves e menor contraste.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A luz do céu produz sombras mais definidas que a luz solar direta por abranger uma área de emissão maior.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A luz solar direta e a luz do céu possuem temperatura de cor idêntica, variando apenas quanto à direção de incidência sobre o assunto.', 0);

    -- Questao 3 (Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q03', N'A temperatura de cor da luz de tungstênio (lâmpadas incandescentes de uso fotográfico), do flash eletrônico e da luz do dia padrão correspondem, respectivamente, a', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'5.600 K, 3.200 K e 8.000 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'3.200 K, 5.600 K e 8.000 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'3.200 K, 5.500 K e 5.200 K.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'5.600 K, 8.000 K e 3.200 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'4.000 K, 5.600 K e 6.500 K.', 0);

    -- Questao 4 (Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q04', N'O número guia (NG) do flash eletrônico expressa a relação entre a potência luminosa do equipamento, a distância ao assunto e a abertura do diafragma, para ISO 100. A fórmula correta é', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'NG = ISO × Distância / Diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'NG = Diafragma + Distância.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'NG = Diafragma × Distância.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'NG = Distância / Diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'NG = Diafragma² × Distância.', 0);

    -- Questao 5 (Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q05', N'Um flash eletrônico possui número guia 32 (em metros, para ISO 100). Para iluminar corretamente um assunto localizado a 4 metros do flash, o diafragma a ser utilizado deve ser', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/2,8.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/5,6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/8.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'f/16.', 0);

    -- Questao 6 (Obturador)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q06', N'Nas câmeras com obturador de cortina, a velocidade máxima de sincronismo com o flash (velocidade X) existe porque', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o flash emite luz contínua e precisa de tempo mínimo para atingir a potência máxima antes do obturador abrir.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'em velocidades superiores à de sincronismo, a segunda cortina começa a fechar antes que a primeira abra completamente, fazendo o flash iluminar apenas parte do fotograma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o flash de estúdio consome muita energia e precisa de tempo de recarga mínimo entre disparos, o que impede o uso em velocidades altas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'velocidades superiores à de sincronismo fazem o flash disparar múltiplas vezes, causando sobreexposição na imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o espelho da câmera DSLR precisa retornar à posição inicial antes do flash disparar, e esse processo mecânico define a velocidade máxima de sincronismo.', 0);

    -- Questao 7 (Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q07', N'A lâmpada de HMI (Hydrargyrum Medium-arc Iodide) é amplamente utilizada em fotografia e cinema porque', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'emite luz com temperatura de cor de aproximadamente 3.200 K, idêntica à das lâmpadas de tungstênio, facilitando a mistura com refletores convencionais de estúdio.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'possui temperatura de cor próxima à da luz do dia (5.500 a 6.000 K) com rendimento luminoso muito superior ao das lâmpadas de tungstênio, gerando menos calor por watt consumido.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'emite luz ultravioleta em quantidade suficiente para eliminar a necessidade de filtros de correção de cor em qualquer situação de iluminação mista.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'pode ser operada diretamente em qualquer tensão de rede elétrica sem necessidade de balastro ou equipamento auxiliar.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'é a única fonte de luz artificial capaz de produzir sombras suaves sem o uso de difusores, softboxes ou rebatedores.', 0);

    -- Questao 8 (Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q08', N'O filtro de correção de cor CTB (Color Temperature Blue) é utilizado para', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'elevar a temperatura de cor de uma fonte de luz, convertendo, por exemplo, a luz de tungstênio (3.200 K) para a temperatura de cor da luz do dia (5.600 K), adicionando tonalidade azulada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a temperatura de cor de uma fonte de luz, convertendo a luz do dia (5.600 K) para a temperatura de cor de tungstênio (3.200 K), adicionando tonalidade alaranjada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'neutralizar a dominante verde das lâmpadas fluorescentes, adicionando tonalidade magenta à fonte de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'atenuar a intensidade luminosa da fonte sem alterar sua temperatura de cor, funcionando como filtro de densidade neutra.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'converter a luz de flash eletrônico para a temperatura de cor das lâmpadas de tungstênio, adicionando tonalidade alaranjada ao lampejo.', 0);

    -- Questao 9 (Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q09', N'O fotômetro de mão pode realizar dois tipos de medição de luz. A medição por luz incidente diferencia-se da medição por luz refletida porque', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a luz incidente mede a luz que retorna do assunto para o fotômetro, sendo portanto igual ao tipo de medição realizado pelo fotômetro embutido nas câmeras DSLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a luz incidente mede a luz que chega diretamente sobre o assunto — posicionando o fotômetro junto ao objeto, apontado para a fonte —, sendo independente da tonalidade ou cor do assunto medido.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a luz incidente é exclusivamente utilizada em estúdio, enquanto a luz refletida é a única aplicável em externas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a luz incidente mede apenas a luz do flash, enquanto a luz refletida mede apenas a luz ambiente contínua.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ambas produzem leituras idênticas, diferindo apenas no posicionamento do fotômetro em relação à câmera.', 0);

    -- Questao 10 (Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q10', N'A chamada "hora dourada" (golden hour) na fotografia externa refere-se ao período em que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o sol está no zênite, produzindo a máxima intensidade luminosa do dia e sombras com menor comprimento proporcional ao objeto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o sol está posicionado a 90° em relação ao horizonte, gerando sombras laterais longas e luz de alta temperatura de cor, próxima de 7.000 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a luz solar incide em ângulo baixo — logo após o nascer ou antes do pôr do sol —, produzindo temperatura de cor mais quente (2.000 a 4.000 K), sombras longas e suaves e iluminação de alta qualidade plástica para o registro fotográfico.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a temperatura de cor do sol atinge exatamente 5.500 K, equivalente ao padrão de luz do dia estabelecido pela ISO, por isso é a mais indicada para fotografia técnica e pericial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a cobertura de nuvens é parcial, criando alternância entre luz direta e difusa que uniformiza o contraste da cena e elimina sombras indesejadas.', 0);

    -- Questao 11 (Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q11', N'Em relação ao rendimento luminoso (quantidade de luz produzida por watt consumido), a ordem crescente de eficiência entre as fontes de luz artificial — lâmpadas incandescentes de tungstênio, tubos fluorescentes e lâmpadas HMI — é', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'HMI, fluorescente, tungstênio.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fluorescente, tungstênio, HMI.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'tungstênio, HMI, fluorescente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'tungstênio, fluorescente, HMI.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'HMI, tungstênio, fluorescente.', 0);

    -- Questao 12 (Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q12', N'O refletor de lâmpada halógena com lente Fresnel e o softlight fluorescente produzem, respectivamente, os seguintes tipos de luz:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'luz difusa com sombras suaves; luz dura com sombras definidas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'luz difusa com sombras em degradê; luz dura com sombras definidas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'luz dura com sombras definidas; luz difusa com sombras em degradê.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'luz dura com sombras em degradê; luz difusa com sombras suaves.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'luz dura sem sombras; luz difusa sem sombras.', 0);

    -- Questao 13 (Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q13', N'Um fotógrafo utiliza flash de estúdio com número guia 56 (metros, ISO 100). Desejando fotografar um assunto a 8 metros com diafragma f/7, ele deverá ajustar o ISO da câmera para', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO 50, reduzindo a sensibilidade para compensar o excesso de luz do flash potente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ISO 100, pois o número guia 56 já é suficiente para cobrir 8 metros com f/7.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ISO 200, dobrando a sensibilidade para compensar a abertura mais fechada em relação ao diafragma calculado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ISO 400, quadruplicando a sensibilidade original para atingir a exposição correta na distância e abertura desejadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ISO 800, pois a distância de 8 metros exige alto ISO independentemente do número guia do flash.', 0);

    -- Questao 14 (Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q14', N'A temperatura de cor do céu nublado (sem sol direto) e a temperatura de cor à sombra (em dia ensolarado) situam-se, respectivamente, nos valores aproximados de', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'3.200 K e 5.600 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'5.600 K e 3.200 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'6.000 K e 8.000 K.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'4.000 K e 5.500 K.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'8.000 K e 6.000 K.', 0);

    -- Questao 15 (Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q15', N'Em uma cena externa com luz do dia e uma fonte auxiliar de tungstênio (3.200 K), o fotógrafo deseja obter equilíbrio de cor sem alterar o balanço de branco da câmera, ajustado para daylight. O procedimento correto é', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'colocar filtro CTO sobre a fonte de tungstênio para elevar sua temperatura de cor e aproximá-la da luz do dia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'colocar filtro CTB sobre a fonte de tungstênio para elevar sua temperatura de cor e aproximá-la da luz do dia.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'colocar filtro CTO sobre a objetiva da câmera para converter a luz do dia para a temperatura de cor do tungstênio.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'colocar filtro de densidade neutra sobre a fonte de tungstênio para reduzir sua intensidade e equilibrar as exposições.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'colocar filtro CTB sobre a objetiva da câmera para converter globalmente toda a cena para a temperatura do tungstênio.', 0);

    -- Questao 16 (Luz)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q16', N'A reflexão especular e a reflexão difusa, conceitos fundamentais para o controle da iluminação fotográfica, caracterizam-se respectivamente por', 1,
        (SELECT id FROM temas WHERE nome = N'Luz'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'espalhamento da luz em múltiplas direções em superfícies lisas; reflexão em direção única em superfícies rugosas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reflexão em uma única direção em superfícies lisas e brilhantes (como espelhos e vidros); espalhamento da luz em múltiplas direções em superfícies rugosas e opacas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reflexão total da luz sem perda de intensidade em qualquer superfície branca; absorção total em superfícies pretas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'reflexão exclusiva das fontes de luz artificial; reflexão difusa associada exclusivamente à luz natural.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reflexão que altera a temperatura de cor da fonte luminosa; reflexão que mantém a temperatura de cor original da fonte.', 0);

    -- Questao 17 (Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q17', N'O flash rebatido (bounce flash), técnica em que o flash é direcionado para o teto ou parede antes de atingir o assunto, produz como resultado', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior intensidade luminosa que o flash direto, pois a superfície refletora amplifica o lampejo antes de direcioná-lo ao assunto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'luz mais suave e difusa, com sombras menos duras, pois a área de emissão efetiva aumenta ao utilizar o teto ou parede como fonte secundária; porém, exige abertura maior ou ISO mais alto para compensar a perda de intensidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a mesma intensidade luminosa do flash direto, pois a superfície branca reflete 100% da luz sem qualquer perda energética.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento do contraste da imagem, pois a luz rebatida concentra o lampejo em uma área menor do assunto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'elevação da temperatura de cor do flash para valores próximos de 8.000 K, exigindo filtro CTB na objetiva para correção cromática.', 0);

    -- Questao 18 (Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q18', N'A luz de preenchimento (fill light ou luz de enchimento) é utilizada em esquemas de iluminação para', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'substituir completamente a luz principal (key light), sendo mais intensa que ela para garantir iluminação uniforme em toda a cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'criar sombras dramáticas adicionais no lado oposto à luz principal, aumentando o contraste e a tridimensionalidade do assunto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'atenuar as sombras produzidas pela luz principal, iluminando o lado mais escuro do assunto e reduzindo o contraste geral da cena, sem eliminá-las completamente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'definir a temperatura de cor dominante da cena, sendo sempre ajustada em tungstênio (3.200 K) para produzir tom quente nos retratos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'posicionar-se sempre atrás do assunto para criar contraluz, separando-o do fundo e adicionando profundidade à imagem.', 0);

    -- Questao 19 (Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q19', N'A lei do inverso do quadrado da distância, aplicada à fotografia com flash, estabelece que', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a intensidade luminosa do flash é diretamente proporcional ao quadrado da distância entre o flash e o assunto, dobrando a cada metro afastado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao dobrar a distância entre o flash e o assunto, a intensidade da luz que atinge o assunto reduz-se a um quarto (¼) do valor original, exigindo compensação de dois stops de exposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao dobrar a distância entre o flash e o assunto, a intensidade reduz-se à metade, exigindo compensação de um stop de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a lei do inverso do quadrado aplica-se somente à luz natural e não à luz de flash, que mantém intensidade constante até o limite de alcance do equipamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a intensidade da luz decresce linearmente com a distância, de forma que a 2 metros a perda é de 50% e a 4 metros a perda é de 100% da intensidade original.', 0);

    -- Questao 20 (Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos de Iluminação - Q20', N'A temperatura de cor em fotografia é expressa em graus Kelvin (K) e representa', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a sensação psicológica de "calor" ou "frio" transmitida pelas cores da imagem — cores quentes possuem temperatura mais alta e cores frias, temperatura mais baixa — não havendo relação com propriedades físicas da luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a temperatura física em graus Celsius dissipada pela fonte de luz, sendo que lâmpadas incandescentes de maior potência possuem temperatura de cor mais alta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a predominância de determinadas frequências na emissão de luz de uma fonte, baseada no conceito de "corpo negro" do físico Lord Kelvin — fontes com temperatura mais baixa emitem predominância avermelhada/alaranjada; fontes com temperatura mais alta emitem predominância azulada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a variação de energia térmica gerada pelas lâmpadas incandescentes sob diferentes cargas de potência elétrica, não se aplicando a fontes como flash eletrônico ou LED.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o índice de reprodução de cores (IRC) de uma fonte luminosa, indicando quão fielmente ela reproduz as cores em relação à luz solar, em escala de 0 a 100.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

-- ============================================================
-- Simulado: Materiais Sensíveis e Registro Fotográfico
-- ============================================================
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Questao 1 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q01', N'A emulsão fotográfica presente nos filmes e papéis fotográficos convencionais é constituída fundamentalmente por', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pigmentos orgânicos sintéticos suspensos em resina acrílica, sensíveis à radiação infravermelha e ao calor emitido pela fonte de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'cristais de haletos de prata (brometo, cloreto e/ou iodeto de prata) suspensos em gelatina, que se alteram quimicamente pela ação da luz, permitindo o registro da imagem fotográfica.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'óxido de zinco e dióxido de titânio dispersos em solução aquosa de celulose, que reagem por eletrólise ao receber corrente elétrica gerada pela luz incidente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'camadas de corante fotocromático sobre base de policarbonato, que mudam de cor de forma reversível quando expostas à radiação ultravioleta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'microcristais de sulfeto de cádmio suspensos em gelatina, que convertem a intensidade luminosa em diferença de potencial elétrico registrável.', 0);

    -- Questao 2 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q02', N'Em fotografia convencional, denomina-se negativo o material fotográfico no qual, após a exposição e processamento,', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'as tonalidades claras e escuras da cena original são reproduzidas com fidelidade cromática, sendo o negativo a cópia final entregue ao cliente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'as tonalidades da cena original aparecem invertidas — as áreas mais iluminadas tornam-se escuras e as menos iluminadas tornam-se claras — servindo como matriz para a obtenção de cópias positivas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a imagem é formada exclusivamente pela reação de pigmentos sintéticos que escurecem nas áreas de menor exposição e clareiam nas áreas de maior incidência luminosa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a imagem aparece com as mesmas tonalidades da cena original, diferindo do positivo apenas pela presença de camada anti-halo na base do suporte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'as cores são substituídas por seus complementares: o azul torna-se amarelo, o vermelho torna-se ciano e o verde torna-se magenta, apenas em filmes coloridos.', 0);

    -- Questao 3 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q03', N'A escala ISO, usada para expressar a sensibilidade dos materiais fotográficos, resulta da fusão das escalas', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'DIN e GOST, respectivamente da Alemanha e da União Soviética, sendo o valor ISO sempre igual à média aritmética dos dois índices.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ASA (American Standards Association) e DIN (Deutsche Industrie Normen), unificando os padrões americano e alemão em um único índice internacional.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'EV e LUX, respectivamente os valores de exposição e luminância medidos pelo fotômetro da câmera no momento do disparo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ASA e EV, representando respectivamente a sensibilidade americana e o valor de exposição calculado pelo fotômetro embutido.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ANSI e JIS, respectivamente os padrões técnicos norte-americano e japonês de medição da sensibilidade de filmes fotográficos.', 0);

    -- Questao 4 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q04', N'Em relação à sensibilidade e ao grão dos filmes fotográficos em preto e branco, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'filmes de alta sensibilidade (ISO elevado) possuem grão mais fino e maior resolução, sendo preferidos para ampliações de grande formato.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'filmes de baixa sensibilidade (ISO baixo) possuem grão mais grosso, menor definição e são indicados para ambientes de baixa luminosidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'quanto maior a sensibilidade ISO do filme, maiores os cristais de haletos de prata da emulsão e mais visível o grão na imagem final; filmes de baixa sensibilidade possuem grão mais fino e maior resolução.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o tamanho do grão é uma característica exclusivamente do papel fotográfico, não afetando a resolução dos negativos em filme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a sensibilidade ISO e o tamanho do grão são variáveis completamente independentes, podendo um filme ter alta sensibilidade e grão muito fino simultaneamente sem qualquer comprometimento técnico.', 0);

    -- Questao 5 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q05', N'Os filmes fotográficos em preto e branco do tipo pancromático diferenciam-se dos filmes ortocromáticos porque', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'os filmes pancromáticos são sensíveis apenas à faixa do azul e do ultravioleta do espectro visível, enquanto os ortocromáticos são sensíveis a todo o espectro visível incluindo o vermelho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'os filmes pancromáticos são sensíveis a praticamente todos os comprimentos de onda do espectro visível, reproduzindo todas as cores em gradações de cinza; os ortocromáticos têm deficiência na captação do vermelho e laranja, tornando-os preto absoluto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'os filmes ortocromáticos são os mais modernos e sensíveis, utilizados profissionalmente para fotografia de moda e publicidade, enquanto os pancromáticos são mais antigos e destinados ao uso amador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'os filmes pancromáticos só podem ser manuseados em câmara escura completamente vedada à luz, enquanto os ortocromáticos podem ser manipulados sob luz ambiente sem risco de velamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ambos os tipos possuem sensibilidade espectral idêntica, diferindo apenas na espessura da camada de gelatina e, consequentemente, no tempo mínimo de revelação necessário.', 0);

    -- Questao 6 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q06', N'Chama-se imagem latente a', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'imagem visível e permanente formada sobre a emulsão fotográfica após a revelação química completa do filme ou papel exposto à luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'imagem invisível e instável formada sobre os cristais de haletos de prata da emulsão após a exposição à luz, antes de qualquer processamento químico, que necessita de revelação para se tornar visível e permanente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'imagem formada no visor eletrônico da câmera digital antes do disparo, que representa uma prévia do resultado final da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'imagem residual que permanece gravada no sensor da câmera digital após exposição intensa à luz, causando fantasmas na imagem seguinte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'imagem formada na matriz de Bayer do sensor digital após o disparo, antes de ser processada pelo computador interno da câmera em arquivo JPEG ou RAW.', 0);

    -- Questao 7 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q07', N'A reação de óxido-redução que ocorre durante a revelação fotográfica pode ser descrita como', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a dissolução dos cristais de haletos de prata expostos em água, que os remove da emulsão e deixa apenas as áreas não expostas como imagem final.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a reação do fixador com os haletos de prata não expostos, convertendo-os em prata metálica negra e tornando-os permanentes na emulsão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o processo pelo qual o agente revelador (que se oxida) doa elétrons aos íons de prata dos haletos expostos, reduzindo-os a prata metálica negra e tornando a imagem latente visível. A revelação amplifica em cerca de 1 bilhão de vezes a energia captada na exposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a reação entre o interruptor ácido e os cristais de prata metálica já formados, que os dissolve parcialmente para controlar a densidade final da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a transformação dos pigmentos orgânicos dos acoplantes de cor em prata metálica pela ação do calor gerado pela lâmpada do ampliador durante a impressão.', 0);

    -- Questao 8 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q08', N'O processamento químico de um filme negativo em preto e branco é dividido em etapas sequenciais obrigatórias. A ordem correta dessas etapas é', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Fixação → Revelação → Interrupção → Lavagem → Secagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Revelação → Interrupção → Fixação → Lavagem → Secagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Lavagem → Revelação → Fixação → Interrupção → Secagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Interrupção → Revelação → Fixação → Lavagem → Secagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Revelação → Fixação → Interrupção → Lavagem → Secagem.', 0);

    -- Questao 9 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q09', N'A função do interruptor (banho de parada) no processamento fotográfico é', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'remover da emulsão os cristais de haletos de prata não expostos à luz, estabilizando a imagem e tornando-a insensível à luz ambiente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'amplificar a densidade da imagem latente, aumentando o contraste do negativo para compensar subexposições ocorridas durante o disparo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'neutralizar imediatamente a ação da solução reveladora (alcalina) presente na emulsão, impedindo que a revelação prossiga além do tempo desejado; geralmente é uma solução ácida à base de ácido acético.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'lavar os resíduos químicos do revelador e do fixador da superfície do filme, preparando-o para a etapa de secagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sensibilizar adicionalmente as áreas subexpostas do negativo, compensando falhas na exposição original durante o disparo.', 0);

    -- Questao 10 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q10', N'A função do fixador no processamento fotográfico é', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'transformar os haletos de prata expostos em prata metálica, tornando a imagem latente visível e amplificando sua densidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'neutralizar o revelador ainda presente na emulsão, impedindo a continuidade da reação de óxido-redução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'remover da emulsão os cristais de haletos de prata não expostos e não reduzidos, que continuariam fotossensíveis e escureceriam progressivamente a imagem se não fossem eliminados; a base do fixador é o tiossulfato de sódio.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'endurecer a gelatina da emulsão para que a imagem resista a altas temperaturas e umidade durante a secagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'conferir brilho superficial ao papel fotográfico por meio de uma reação química entre o tiossulfato de sódio e os acoplantes de cor da emulsão.', 0);

    -- Questao 11 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q11', N'No processamento fotográfico em câmara escura, a temperatura da solução reveladora é um fator crítico porque', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'temperaturas acima de 20°C inativam completamente o revelador, impedindo a reação de óxido-redução com os haletos de prata.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a temperatura influencia diretamente a velocidade da reação química — reveladores mais quentes agem mais rapidamente; a temperatura padrão de referência para a maioria dos processos P&B é 20°C (68°F), e variações exigem compensação no tempo de revelação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a temperatura deve ser mantida sempre abaixo de 15°C para evitar o derretimento da gelatina da emulsão, que se liquefaz a partir desta temperatura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a temperatura afeta apenas a viscosidade do revelador, sem qualquer influência sobre a velocidade da reação química ou o contraste final do negativo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reveladores frios (abaixo de 10°C) agem mais rapidamente que os quentes, pois as reações de óxido-redução são exotérmicas e liberam energia ao esfriar.', 0);

    -- Questao 12 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q12', N'A agitação durante o processamento fotográfico é necessária porque', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o movimento físico do tanque de revelação aquece a solução reveladora, mantendo a temperatura constante durante todo o processamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a agitação renova continuamente o revelador em contato com a emulsão — removendo os subprodutos da reação que inibem o processo — e garante uniformidade na revelação, evitando marcas e irregularidades no negativo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o movimento impede que os cristais de haletos de prata sedimentem no fundo do tanque, o que causaria subexposição nas áreas inferiores do negativo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a agitação contínua e vigorosa aumenta o contraste final do negativo ao forçar o revelador a penetrar mais profundamente na camada de gelatina da emulsão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sem agitação, o revelador cristaliza rapidamente ao entrar em contato com os haletos de prata, inviabilizando completamente a reação de óxido-redução.', 0);

    -- Questao 13 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q13', N'O filme colorido negativo possui sua emulsão estruturada em três camadas sensíveis sobrepostas. As cores às quais cada camada é sensível são, respectivamente, da camada superior para a inferior', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Vermelho → Verde → Azul (a camada vermelha fica na parte superior, voltada para a objetiva).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Verde → Azul → Vermelho (a camada verde fica na parte superior para captar a cor predominante na maioria das cenas).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Azul → Verde → Vermelho (a camada sensível ao azul fica na parte superior; um filtro amarelo separa a camada azul das demais, impedindo que a luz azul atinja as camadas inferiores).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Ciano → Magenta → Amarelo (as camadas são sensíveis às cores subtrativas, não às primárias aditivas).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'As três camadas são igualmente sensíveis a todas as cores do espectro, diferenciando-se apenas pelos acoplantes de cor que determinam qual corante é produzido em cada camada durante a revelação.', 0);

    -- Questao 14 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q14', N'No processamento do filme colorido negativo pelo processo C-41, após a revelação cromogênica, a imagem de prata metálica formada é eliminada na etapa de branqueamento-fixação (blix). Isso ocorre porque', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a prata metálica é necessária para fixar os corantes orgânicos na emulsão; sua remoção é feita apenas após a impressão das cópias positivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'no filme colorido, a imagem final é formada exclusivamente pelos corantes orgânicos (acoplantes de cor) gerados durante a revelação cromogênica; a prata metálica é um subproduto desnecessário que deve ser removido para que a imagem colorida final fique transparente e com cores corretas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a prata metálica é reciclada durante o processo C-41 e redistribuída uniformemente pelas três camadas de cor, equilibrando a densidade cromática do negativo final.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o branqueamento converte a prata metálica em prata coloidal, que funciona como agente fixador dos corantes orgânicos nas três camadas sensíveis do filme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a remoção da prata ocorre apenas em filmes com sensibilidade acima de ISO 400; filmes de baixa sensibilidade retêm a prata metálica como parte da imagem final.', 0);

    -- Questao 15 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q15', N'O processo E-6 é utilizado para o processamento de filmes diapositivos (slides) coloridos. Ele se diferencia do processo C-41 porque', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o processo E-6 gera um negativo colorido que posteriormente é copiado para papel, enquanto o C-41 gera diretamente um positivo colorido transparente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o processo E-6 inclui uma etapa de inversão (primeiro revelador P&B + exposição secundária à luz ou revelador colorido), resultando em um positivo colorido transparente (slide/diapositivo), com cores diretas da cena original; o C-41 gera negativo com cores e tonalidades invertidas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ambos os processos geram negativos coloridos, diferindo apenas na temperatura de processamento: C-41 a 38°C e E-6 a 20°C.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o processo E-6 é utilizado exclusivamente para filmes em preto e branco de alta sensibilidade, enquanto o C-41 é exclusivo dos filmes coloridos negativos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'no processo E-6, o fixador é substituído por uma solução de tiossulfato de amônio aquecida a 45°C, que elimina a necessidade de etapa de branqueamento.', 0);

    -- Questao 16 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q16', N'Os graus de contraste dos papéis fotográficos para impressão em câmara escura (numerados de 0 a 5 ou classificados como suave, normal, duro e extraduro) permitem ao fotógrafo', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ajustar a sensibilidade ISO do papel fotográfico durante a impressão, compensando subexposições ocorridas na captação do negativo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'controlar a temperatura de cor da imagem final — papéis de grau baixo produzem tons mais quentes (amarelados) e papéis de grau alto produzem tons mais frios (azulados).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar o contraste da cópia positiva final — papéis de grau baixo (0 ou 1) produzem imagens mais suaves para negativos muito contrastados; papéis de grau alto (4 ou 5) ampliam o contraste para negativos muito planos (subcontrastados).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'determinar o tamanho máximo de ampliação da cópia positiva, sendo que papéis de grau alto só podem ser usados para ampliações pequenas (até 13×18 cm).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'os graus de contraste afetam exclusivamente o brilho superficial do papel — grau 0 produz acabamento fosco e grau 5 produz acabamento brilhante de alta reflexão.', 0);

    -- Questao 17 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q17', N'A camada anti-halo presente nos filmes fotográficos tem como função', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'proteger a emulsão fotossensível da ação da umidade e do calor, prolongando o prazo de validade do filme não exposto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'impedir que a luz azul atinja as camadas inferiores da emulsão colorida, substituindo o filtro amarelo nos filmes pancromáticos modernos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'absorver a luz que atravessa a emulsão e seria refletida de volta pela base do suporte, evitando o halo luminoso ao redor de pontos de alta luz que prejudicaria a nitidez da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'amplificar a sensibilidade espectral do filme ao vermelho, corrigindo a deficiência natural dos haletos de prata nessa faixa do espectro visível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'funcionar como camada reveladora de emergência que reage automaticamente em caso de exposição acidental do filme à luz branca, preservando as imagens já registradas nos fotogramas anteriores.', 0);

    -- Questao 18 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q18', N'Sobre a relação entre a concentração do revelador e o resultado final do processamento fotográfico, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reveladores mais diluídos agem mais rapidamente e aumentam o contraste do negativo; reveladores mais concentrados são mais lentos e produzem imagens de baixo contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a concentração do revelador não influencia o resultado fotográfico — apenas a temperatura e o tempo de revelação determinam o contraste e a densidade final do negativo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reveladores mais concentrados agem mais rapidamente e podem aumentar o contraste e a densidade; reveladores mais diluídos agem com mais suavidade, produzindo grão mais fino e contraste menor. A diluição também é usada para compensar a perda de atividade do revelador com o uso.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a concentração do revelador afeta apenas o brilho superficial do negativo, sem qualquer influência sobre o grão, contraste ou densidade da imagem final.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reveladores extremamente diluídos tornam-se alcalinos e passam a funcionar como fixadores, dissolvendo os haletos de prata em vez de reduzi-los a prata metálica.', 0);

    -- Questao 19 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q19', N'Os filmes coloridos são balanceados pelos fabricantes para serem utilizados com determinada temperatura de cor da fonte de luz. Um filme colorido balanceado para luz do dia (Daylight), quando utilizado sob iluminação de lâmpadas de tungstênio (3.200 K) sem filtro de correção, produzirá imagens com', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'dominante azulada intensa, pois a luz do tungstênio tem temperatura de cor mais alta que a luz do dia, gerando excesso de resposta nas camadas sensíveis ao azul.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'imagens com cores perfeitamente equilibradas, pois os filmes modernos possuem correção automática de temperatura de cor por meio dos acoplantes de cor presentes nas três camadas da emulsão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'dominante alaranjada/avermelhada intensa, pois a luz de tungstênio (3.200 K) é mais quente e menos azulada que a luz do dia (5.500 K) para a qual o filme foi calibrado, gerando excesso relativo de resposta nas camadas sensíveis ao vermelho e ao verde.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'imagens em preto e branco, pois a diferença de temperatura de cor é grande o suficiente para inativar os acoplantes de cor das três camadas sensíveis do filme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'dominante esverdeada, pois as lâmpadas de tungstênio emitem predominantemente radiação na faixa do verde-amarelo do espectro visível.', 0);

    -- Questao 20 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Materiais Sensíveis e Registro Fotográfico - Q20', N'Na fotografia pericial, a correta escolha e utilização dos materiais fotográficos sensíveis é fundamental para a integridade da prova. Sobre o uso do filme fotográfico convencional em preto e branco no registro pericial, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o filme fotográfico convencional não tem validade jurídica como prova pericial, sendo obrigatório o uso de câmera digital com geração de arquivo RAW em todos os procedimentos da Polícia Científica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'filmes de alta sensibilidade (ISO 400 ou superior) são sempre preferíveis ao filme ISO 100 em cenas de crime internas, pois qualquer nível de grão é aceitável na fotografia pericial independentemente da ampliação necessária.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a escolha da sensibilidade (ISO) deve considerar as condições de iluminação do local e a necessidade de detalhamento — filmes de baixa sensibilidade (ISO 25–100) oferecem grão mais fino e maior resolução para registros detalhados de vestígios; em condições de baixa luz, utiliza-se maior sensibilidade compensando a perda de definição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o processamento do filme pericial pode ser realizado em laboratório comercial aberto ao público, sem necessidade de controle de cadeia de custódia, pois o negativo original não pode ser adulterado após o processamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'filmes ortocromáticos são obrigatórios na fotografia pericial brasileira por determinação do IML, pois sua insensibilidade ao vermelho elimina interferências cromáticas causadas pelo sangue nas cenas de crime.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

-- ============================================================
-- Simulado: Equipamentos Digitais e Captura de Imagem
-- ============================================================
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Questao 1 (Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q01', N'Um sensor de imagem digital é estruturalmente composto por três camadas principais. Sobre essas camadas e sua função na formação da imagem, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o substrato de silício realiza o efeito fotoelétrico convertendo fótons em elétrons; sobre ele há um filtro de cor (mosaico de Bayer) que permite a cada fotodiodo captar predominantemente uma faixa espectral (vermelho, verde ou azul); e microlentes na camada superior concentram a luz incidente sobre cada fotodiodo, aumentando a eficiência de captação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'as microlentes realizam a conversão fotoelétrica; o filtro de cor armazena temporariamente a carga elétrica gerada; e o substrato de silício apenas protege mecanicamente o conjunto contra poeira e umidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o filtro de Bayer converte luz em sinal elétrico antes de chegar ao substrato, que por sua vez decompõe esse sinal em RGB sem necessidade de processamento posterior pelo processador de imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'cada fotodiodo do sensor capta simultaneamente os três canais RGB de forma independente, sendo o filtro de Bayer um componente legado presente apenas em sensores CCD obsoletos, ausente em sensores CMOS modernos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'as três camadas operam de forma redundante: qualquer uma delas, isoladamente, é capaz de produzir uma imagem colorida completa, sendo as demais reservas para caso de falha mecânica.', 0);

    -- Questao 2 (Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q02', N'O processo de demosaicing (ou debayering), aplicado a imagens captadas por sensores com filtro de Bayer, consiste em', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'remover completamente o ruído digital da imagem antes da gravação, sendo etapa exclusiva do processamento de arquivos JPEG e ausente no fluxo de gravação RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'interpolar, para cada pixel, os valores de cor que não foram diretamente captados por aquele fotodiodo (que registrou apenas uma das três cores — R, G ou B), utilizando informações dos fotodiodos vizinhos, reconstruindo assim uma imagem com valores completos de R, G e B em cada pixel.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'converter a imagem colorida para escala de cinza, sendo etapa preparatória obrigatória antes da conversão para qualquer formato de arquivo, inclusive RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'redimensionar a imagem para a resolução nativa do sensor, compensando eventuais defeitos de fabricação no filtro de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aplicar a marca d''água digital de proteção de direitos autorais diretamente nos dados do sensor, antes da conversão analógico-digital.', 0);

    -- Questao 3 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q03', N'A resolução espacial de uma imagem digital (quantidade de pixels) e a profundidade de bits (bit depth, relacionada à quantidade de cores/tons que cada pixel pode representar) são grandezas que', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'são equivalentes: uma imagem de 24 megapixels possui automaticamente profundidade de 24 bits por canal, sendo a relação 1 megapixel = 1 bit de profundidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'são independentes: a resolução espacial define o número total de pixels (largura × altura) da imagem; a profundidade de bits define quantos níveis de intensidade cada canal de cor de um pixel pode armazenar (ex.: 8 bits/canal = 256 níveis; 16 bits/canal = 65.536 níveis). Uma imagem pode ter alta resolução espacial e baixa profundidade de bits, ou vice-versa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a profundidade de bits determina exclusivamente o tamanho físico de impressão da imagem, enquanto a resolução espacial determina apenas o peso do arquivo em disco, sem relação com a qualidade visual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ambas as grandezas são determinadas exclusivamente pelo formato de arquivo escolhido (JPEG, TIFF, RAW), sendo características do software de edição e não do sensor da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a profundidade de bits refere-se ao número de canais de cor (sempre 3: R, G, B), enquanto a resolução espacial refere-se ao número de bits usados para armazenar os metadados EXIF da imagem.', 0);

    -- Questao 4 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q04', N'Arquivos RAW de 12 ou 14 bits por canal são preferidos em relação a arquivos JPEG de 8 bits por canal na fotografia pericial principalmente porque o maior bit depth', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumenta proporcionalmente a resolução espacial da imagem, produzindo arquivos com mais megapixels que o sensor é capaz de capturar nativamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permite registrar uma gama dinâmica e uma quantidade de níveis de tonalidade muito maior (ex.: 14 bits = 16.384 níveis por canal, contra 256 do 8 bits), possibilitando recuperar detalhes em altas-luzes e sombras durante o processamento, sem o aparecimento de bandas de cor (posterização) — fundamental para análise pericial de detalhes em áreas críticas da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduz o tamanho do arquivo final, tornando o RAW de 14 bits sempre menor que o JPEG de 8 bits equivalente, economizando espaço de armazenamento no cartão de memória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'elimina a necessidade de calcular o código Hash do arquivo, pois arquivos de maior bit depth já incluem verificação de integridade embutida pelo fabricante.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'converte automaticamente a imagem para o espaço de cor Adobe RGB, sendo essa conversão impossível em arquivos JPEG de 8 bits independentemente do software utilizado.', 0);

    -- Questao 5 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q05', N'No fluxo de processamento interno (pipeline) de uma câmera digital ao gravar em JPEG, a ordem correta das etapas após a captura pelo sensor é, tipicamente', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'compressão JPEG → balanço de branco → demosaicing → ajuste de nitidez e contraste → conversão A/D.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'conversão A/D do sinal do sensor → aplicação do balanço de branco → demosaicing (interpolação de cor a partir do padrão de Bayer) → ajustes de nitidez, contraste, saturação e redução de ruído pelo processador de imagem → compressão com perdas no padrão JPEG → gravação do arquivo com metadados EXIF.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'gravação do arquivo → cálculo do código Hash → conversão A/D → demosaicing → compressão JPEG, sendo essa ordem inversa à do fluxo RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'demosaicing → conversão A/D → compressão JPEG → balanço de branco → ajustes finais aplicados apenas na exibição na tela LCD da câmera, sem alterar o arquivo gravado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a câmera grava diretamente o sinal analógico do sensor no cartão de memória; toda a conversão A/D, demosaicing e compressão ocorrem apenas no computador, no momento da transferência do arquivo.', 0);

    -- Questao 6 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q06', N'Diferentemente do arquivo JPEG, o arquivo RAW não possui o balanço de branco "fixado" (queimado) nos dados da imagem. Isso significa que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'arquivos RAW não podem ser visualizados em nenhum software até que o balanço de branco seja definido manualmente pelo usuário, ao contrário do JPEG que sempre abre automaticamente em qualquer visualizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a temperatura de cor registrada no momento da captura é armazenada apenas como um parâmetro/metadado de referência (e não aplicada definitivamente aos dados do sensor); no pós-processamento, o balanço de branco do arquivo RAW pode ser ajustado livremente sem perda de qualidade, recalculando a imagem a partir dos dados brutos — algo que no JPEG já processado gera degradação adicional.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'arquivos RAW são sempre monocromáticos (preto e branco), e a aplicação de qualquer balanço de branco no pós-processamento é o que introduz artificialmente a cor na imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o balanço de branco no RAW é determinado exclusivamente pelo código Hash do arquivo, sendo recalculado automaticamente sempre que o Hash é verificado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'RAW e JPEG possuem exatamente o mesmo comportamento quanto ao balanço de branco; a única diferença entre os dois formatos é o tamanho final do arquivo em disco.', 0);

    -- Questao 7 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q07', N'O formato TIFF (Tagged Image File Format) é frequentemente utilizado como formato intermediário de trabalho na fotografia pericial e na pós-produção, em detrimento do JPEG, principalmente porque o TIFF', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'é um formato exclusivo para imagens em preto e branco, sendo incompatível com imagens coloridas provenientes de sensores RGB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aplica obrigatoriamente compressão com perdas semelhante ao JPEG, porém com taxa de compressão configurável pelo usuário entre 1% e 100%.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'suporta gravação sem compressão (ou com compressão sem perdas, como o LZW), preservando integralmente a qualidade da imagem mesmo após sucessivas aberturas e regravações — ao contrário do JPEG, cujo algoritmo de compressão com perdas degrada progressivamente a imagem a cada novo salvamento (geração).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'é o único formato de imagem capaz de armazenar o código Hash MD5 diretamente dentro dos pixels da imagem, de forma visualmente imperceptível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduz automaticamente a resolução espacial da imagem para 72 DPI, tornando-a adequada apenas para visualização em tela, nunca para impressão pericial.', 0);

    -- Questao 8 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q08', N'Sobre a compressão de imagens digitais, a diferença fundamental entre compressão com perdas (lossy, ex.: JPEG) e sem perdas (lossless, ex.: PNG, TIFF-LZW, RAW comprimido) é que a compressão com perdas', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sempre produz arquivos maiores que a compressão sem perdas, pois descarta informação redundante de forma menos eficiente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'descarta permanentemente informação da imagem (geralmente detalhes de alta frequência menos perceptíveis ao olho humano) para reduzir significativamente o tamanho do arquivo — essa informação não pode ser recuperada; já a compressão sem perdas reorganiza os dados de forma mais compacta sem descartar nenhuma informação, permitindo reconstrução exata (bit a bit) do arquivo original.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'só pode ser aplicada a imagens em preto e branco, enquanto a compressão sem perdas é exclusiva de imagens coloridas com profundidade igual ou superior a 16 bits.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'é reversível por meio do recálculo do código Hash MD5 do arquivo original, que permite reconstruir os dados descartados durante a compressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumenta a resolução espacial da imagem como efeito colateral do algoritmo de compressão, sendo essa a razão pela qual arquivos JPEG sempre têm mais megapixels que o arquivo RAW de origem.', 0);

    -- Questao 9 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q09', N'Ao redimensionar (resize) uma imagem digital para aumentar suas dimensões (upscaling), o software de edição utiliza algoritmos de interpolação (ex.: bilinear, bicúbica) para preencher os novos pixels. Sobre esse processo, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a interpolação recupera detalhes reais da cena que não estavam presentes na captura original, "adivinhando" corretamente informações que o sensor não conseguiu registrar devido à sua resolução limitada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'os novos pixels são criados por estimativa matemática a partir dos pixels vizinhos existentes — não correspondem a informação real capturada da cena —, podendo suavizar bordas, introduzir artefatos e reduzir a nitidez percebida; por isso, ampliar uma imagem além de sua resolução nativa não aumenta o nível de detalhe real disponível para análise pericial.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o redimensionamento para cima sempre aumenta a profundidade de bits da imagem proporcionalmente ao fator de ampliação aplicado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'qualquer redimensionamento, para cima ou para baixo, é uma operação sem perdas e reversível, preservando o Hash original do arquivo mesmo após a alteração das dimensões.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a interpolação bicúbica é utilizada exclusivamente em arquivos RAW, sendo tecnicamente impossível redimensionar arquivos JPEG ou TIFF por qualquer método de interpolação.', 0);

    -- Questao 10 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q10', N'Os metadados EXIF (Exchangeable Image File Format) embutidos automaticamente pela câmera em arquivos JPEG e TIFF tipicamente incluem informações como modelo da câmera, objetiva utilizada, data/hora, ISO, abertura e velocidade do obturador. Sobre os metadados EXIF, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'são suportados nativamente pelos formatos BMP, GIF e PNG, sendo o JPEG o único formato de imagem incompatível com EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'são gravados pela câmera no momento da captura e, embora normalmente não sejam editáveis pela interface padrão de visualização, podem ser alterados por softwares específicos; por isso, a análise de metadados EXIF — como verificação de consistência entre data/hora registrada e o contexto da imagem, ou identificação de software de edição posterior — é uma técnica investigativa para contestar (ou corroborar) a autenticidade de uma imagem, mas não substitui o Hash como garantia de integridade do arquivo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'os dados EXIF são criptografados com o algoritmo MD5 no momento da gravação, tornando-os tecnicamente impossíveis de alterar mesmo com software especializado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'são exclusivos de câmeras DSLR profissionais, estando ausentes em qualquer câmera compacta, smartphone ou câmera mirrorless.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a remoção dos metadados EXIF de uma imagem aumenta automaticamente sua resolução espacial, pois libera o espaço de armazenamento anteriormente ocupado pelos metadados para dados de pixel.', 0);

    -- Questao 11 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q11', N'Os padrões IPTC e XMP de metadados diferem do EXIF principalmente porque', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'são gravados automaticamente pelo sensor da câmera no momento da captura, exatamente como o EXIF, sendo os três padrões tecnicamente idênticos e apenas com nomes diferentes por convenção histórica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o EXIF é criado automaticamente pela câmera no momento da captura (dados técnicos da exposição); o IPTC é inserido manualmente após a captura, por softwares de edição, contendo informações como autor, legenda, palavras-chave e direitos de uso; o XMP, desenvolvido pela Adobe, é um padrão mais flexível que pode incorporar e sincronizar dados de ambos os outros padrões. Os três podem coexistir no mesmo arquivo de imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'IPTC e XMP substituem completamente os dados de pixel da imagem, funcionando como contêineres que armazenam apenas texto, sem qualquer dado visual.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas arquivos RAW podem conter metadados IPTC e XMP; arquivos JPEG e TIFF são limitados exclusivamente ao padrão EXIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'XMP é um algoritmo de compressão de imagem concorrente do JPEG, não tendo qualquer relação com metadados ou informações textuais.', 0);

    -- Questao 12 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q12', N'Considere que um perito calcule o Hash MD5 de um arquivo de imagem original imediatamente após a captura, registrando o valor obtido no laudo. Semanas depois, ao recalcular o Hash MD5 do mesmo arquivo (preservado sem qualquer edição intencional), o valor obtido é idêntico ao original. Essa coincidência de valores indica que', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o arquivo provavelmente foi corrompido durante o armazenamento, pois o MD5 deveria mudar naturalmente com o tempo mesmo sem alterações no conteúdo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a sequência de bytes que compõe o arquivo (incluindo dados de pixel e metadados) permanece bit a bit idêntica à do momento da captura — nenhuma alteração de conteúdo, ainda que mínima (um pixel, um caractere de metadado), ocorreu no intervalo, o que reforça a integridade do arquivo como evidência.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o algoritmo MD5 sempre retorna o mesmo valor para qualquer arquivo de imagem, independentemente do conteúdo, sendo portanto inútil para fins periciais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a câmera que originou o arquivo recalculou e regravou automaticamente o Hash a cada acesso ao arquivo, mantendo a coincidência de valores artificialmente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o Hash MD5 depende exclusivamente do nome do arquivo e da data do sistema operacional, sendo a coincidência uma simples consequência de o nome do arquivo não ter sido alterado.', 0);

    -- Questao 13 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q13', N'Um arquivo de imagem pericial, ao ser submetido a uma simples conversão de formato (ex.: de TIFF para JPEG), mesmo sem qualquer alteração visual perceptível ao olho humano, apresentará um Hash MD5 diferente do arquivo TIFF original. Isso ocorre porque', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o algoritmo MD5 é sensível apenas à extensão do nome do arquivo (.tiff vs .jpg), e não ao conteúdo binário propriamente dito.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a conversão entre formatos reorganiza completamente a estrutura binária do arquivo (cabeçalhos, codificação dos dados de pixel, metadados), produzindo uma sequência de bytes totalmente diferente — mesmo que o resultado visual seja semelhante ao original. Por isso, para fins periciais, deve-se preservar o arquivo original na extensão e formato em que foi gerado pela câmera, sem conversões.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a conversão de formato sempre adiciona uma marca d''água invisível ao arquivo, e é essa marca — não a mudança de formato — que altera o Hash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'arquivos TIFF e JPEG compartilham exatamente a mesma estrutura binária; a diferença no Hash, nesse caso, indicaria necessariamente corrupção do arquivo durante a conversão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o Hash MD5 de qualquer arquivo de imagem se altera automaticamente a cada 24 horas por design do algoritmo, independentemente de qualquer ação do usuário.', 0);

    -- Questao 14 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q14', N'Na transferência de arquivos do cartão de memória da câmera para o sistema de armazenamento da Polícia Científica, o procedimento tecnicamente correto, do ponto de vista da cadeia de custódia digital, prevê', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a edição imediata dos arquivos (correção de cor, recorte, redimensionamento) antes de qualquer outro procedimento, para que apenas a versão "final" seja preservada e armazenada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a transferência integral dos arquivos originais (sem edição), seguida do cálculo e registro do Hash de cada arquivo original; cópias de trabalho podem ser feitas para edição/análise posterior, mas o arquivo original com seu Hash documentado deve ser preservado intacto e separado das cópias de trabalho.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a exclusão dos arquivos do cartão de memória imediatamente após a transferência, sem verificação adicional, para liberar espaço para a próxima diligência.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a conversão obrigatória de todos os arquivos para o formato PNG antes do armazenamento, pois é o único formato reconhecido judicialmente no Brasil.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o armazenamento exclusivo em nuvem (cloud) de terceiros, sendo proibido por lei o armazenamento de evidências fotográficas em mídias físicas locais.', 0);

    -- Questao 15 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q15', N'Sobre o espaço de cor (color space) de uma imagem digital — por exemplo, sRGB versus Adobe RGB —, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o sRGB possui uma gama (gamut) de cores reproduzíveis mais ampla que o Adobe RGB, sendo por isso o padrão recomendado para impressão profissional de alta fidelidade cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o Adobe RGB abrange uma gama de cores mais ampla que o sRGB (especialmente em tons de verde e ciano), sendo vantajoso para fluxos de trabalho profissionais com impressão; o sRGB é o padrão para exibição em monitores, web e a maioria das impressoras de consumo. Uma imagem capturada em Adobe RGB mas exibida/impressa em dispositivo que só reconhece sRGB pode apresentar cores visivelmente diferentes das pretendidas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o espaço de cor de uma imagem é determinado exclusivamente pelo Hash MD5 do arquivo, não podendo ser alterado por nenhum software após a captura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'arquivos RAW não possuem espaço de cor associado, sendo essa informação aplicável apenas a arquivos JPEG e TIFF já processados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sRGB e Adobe RGB são termos equivalentes que descrevem a mesma especificação técnica, divulgada por organizações distintas (sRGB pela ISO e Adobe RGB pela Adobe) apenas por motivos de licenciamento de marca.', 0);

    -- Questao 16 (ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q16', N'Em relação ao ruído digital (noise) presente em imagens capturadas em altos valores de ISO, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o ruído digital surge exclusivamente de defeitos de fabricação do sensor, sendo completamente ausente em sensores fabricados após 2015, independentemente do ISO utilizado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o aumento do ISO amplifica eletronicamente o sinal captado pelo sensor; junto com o sinal útil, o ruído inerente ao processo de captura (ruído térmico, ruído de leitura, variações estatísticas na contagem de fótons) também é amplificado, tornando-se proporcionalmente mais visível na imagem — especialmente em sensores menores e em condições de baixa luminosidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o ruído digital é introduzido exclusivamente durante a compressão JPEG, estando completamente ausente em qualquer arquivo RAW, independentemente do ISO utilizado na captura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o ruído digital diminui proporcionalmente ao aumento do ISO, sendo essa a razão pela qual fotógrafos profissionais utilizam ISOs muito altos (12800 ou superiores) para obter imagens mais limpas em qualquer condição de luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o ruído digital afeta apenas os metadados EXIF da imagem, sem qualquer impacto visual nos dados de pixel.', 0);

    -- Questao 17 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q17', N'Para a visualização de um arquivo RAW pericial em diferentes computadores e softwares, ao longo dos anos, é importante considerar que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'arquivos RAW são universalmente padronizados, sendo o formato idêntico entre todos os fabricantes de câmeras e garantindo compatibilidade permanente com qualquer software, presente ou futuro, sem necessidade de atualizações.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'cada fabricante utiliza variações proprietárias de formato RAW (ex.: .CR2/.CR3 da Canon, .NEF da Nikon, .ARW da Sony), e softwares de visualização/edição precisam de atualizações ou plugins específicos ("conversores RAW") para reconhecer corretamente arquivos de modelos de câmera mais recentes; por isso, ao arquivar material pericial em RAW para o longo prazo, é prudente também manter uma cópia em formato padronizado (como o DNG da Adobe, ou TIFF) para garantir acessibilidade futura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a visualização de arquivos RAW depende exclusivamente da resolução do monitor utilizado, sendo irrelevante o software empregado para a abertura do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'arquivos RAW não podem, em nenhuma hipótese, ser abertos em sistemas operacionais diferentes daquele da câmera que os originou.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o formato RAW foi descontinuado pela indústria fotográfica em favor exclusivo do formato JPEG, sendo as câmeras atuais incapazes de gravar arquivos RAW.', 0);

    -- Questao 18 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q18', N'Sobre estratégias de armazenamento e backup de arquivos fotográficos periciais, a prática tecnicamente mais robusta é', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'manter uma única cópia dos arquivos no cartão de memória original da câmera, sem transferência, pois cartões de memória profissionais são imunes a falhas e corrupção de dados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'manter múltiplas cópias dos arquivos originais (regra comum conhecida como "3-2-1": ao menos 3 cópias, em 2 tipos de mídia diferentes, com 1 cópia em local geograficamente distinto), com verificação periódica de integridade por meio do Hash registrado, reduzindo o risco de perda por falha de mídia, furto, incêndio ou outros sinistros.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'converter todos os arquivos para resolução reduzida (thumbnail) antes do armazenamento definitivo, pois arquivos menores são proporcionalmente mais resistentes à corrupção de dados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'armazenar os arquivos exclusivamente em pen drives USB, por serem o único tipo de mídia compatível com o cálculo de Hash MD5.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'não é necessário qualquer backup, pois o código Hash MD5, por si só, recupera automaticamente o conteúdo de um arquivo corrompido ou perdido.', 0);

    -- Questao 19 (Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q19', N'Considere um sensor de imagem com dimensões físicas fixas e um aumento na quantidade de megapixels (maior resolução, com pixels individuais menores). Em igualdade de condições de iluminação, esse aumento de megapixels tende a', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar proporcionalmente a área de cada fotodiodo (photosite), captando mais luz por pixel e reduzindo o ruído em altos ISOs, sem qualquer contrapartida negativa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reduzir a área de cada fotodiodo individual (já que a área total do sensor é fixa e está dividida entre mais pixels), o que pode resultar em menor capacidade de captação de luz por pixel e maior ruído relativo em altos ISOs — ainda que a resolução total (em pixels) seja maior. Há, portanto, um trade-off entre resolução espacial e desempenho em baixa luz para um sensor de tamanho fixo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'não ter qualquer relação com o desempenho em baixa luz, pois o ruído depende exclusivamente do algoritmo de compressão JPEG utilizado, e não do hardware do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diminuir automaticamente a profundidade de bits do arquivo, de forma inversamente proporcional ao aumento de megapixels.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar proporcionalmente a temperatura de cor nativa do sensor, tornando obrigatório o uso de filtros CTB em qualquer fotografia feita com sensores de alta resolução.', 0);

    -- Questao 20 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Equipamentos Digitais e Captura de Imagem - Q20', N'Um perito fotografa uma cena em RAW e, no laudo, anexa apenas a versão em JPEG processada (com ajustes de exposição, contraste e recorte), descartando o RAW original e o arquivo intermediário. Do ponto de vista da defesa técnica da autenticidade da prova, essa prática', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'é tecnicamente ideal, pois o arquivo JPEG processado é sempre superior ao RAW em qualidade de imagem e dispensa qualquer arquivo adicional.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'não traz qualquer prejuízo, pois o código Hash do JPEG final é suficiente para comprovar que a imagem nunca foi alterada, independentemente da existência do RAW original.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'é problemática: a ausência do arquivo original (RAW, ou ao menos a primeira gravação não editada) e da documentação das etapas de edição dificulta a verificação independente de que os ajustes aplicados (exposição, contraste, recorte) não alteraram informações relevantes da cena; a boa prática pericial é preservar o arquivo original com seu Hash registrado, documentando separadamente quaisquer versões editadas e os ajustes realizados.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'só seria problemática se o arquivo JPEG tivesse extensão .jpg em letras maiúsculas, pois a extensão em minúsculas (.jpeg) é a única reconhecida judicialmente como prova.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'é uma exigência legal: o RAW original deve ser obrigatoriamente apagado em até 24 horas após a captura, por questões de espaço de armazenamento nos sistemas da Polícia Científica.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

-- ============================================================
-- Simulado: Simulado Explosivo para Aprovação (Avaliação Geral)
-- ============================================================
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Questao 1 (Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q01', N'Em uma câmera DSLR, durante a composição da imagem pelo visor óptico, o caminho percorrido pela luz proveniente da objetiva é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'objetiva → espelho reflex (a 45°) → pentaprisma (ou pentaespelho) → visor ocular; no momento do disparo, o espelho se abate, liberando o caminho direto objetiva → sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'objetiva → sensor → conversão digital → visor eletrônico, sendo o espelho reflex apenas um elemento decorativo sem função óptica nas DSLR modernas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'objetiva → filtro de Bayer → pentaprisma → sensor, sendo o visor ocular apenas uma réplica do que o sensor capta em tempo real, sem qualquer elemento óptico no caminho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'objetiva → obturador → visor ocular → sensor, com o obturador permanecendo sempre aberto durante toda a composição da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'objetiva → visor ocular diretamente, sem qualquer elemento intermediário, sendo essa a principal diferença entre DSLR e câmeras TLR.', 0);

    -- Questao 2 (Modos da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q02', N'Um fotógrafo pericial precisa registrar uma cena em movimento rápido (ex.: um veículo em fuga) com máxima nitidez, sem preocupação prioritária com a profundidade de campo. O modo de exposição mais indicado, e a justificativa técnica correta, são', 1,
        (SELECT id FROM temas WHERE nome = N'Modos da Câmera'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'modo Av/A, pois ao definir a maior abertura possível (menor número f), a câmera automaticamente seleciona a velocidade mais rápida disponível, independentemente da luz da cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'modo Tv/S (Prioridade de Velocidade), definindo uma velocidade alta (ex.: 1/1000s ou superior) — o fotógrafo controla diretamente o parâmetro que congela o movimento, enquanto a câmera ajusta a abertura para manter a exposição correta.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'modo Scene Retrato, pois esse pré-programa prioriza velocidades altas para qualquer tipo de cena, incluindo veículos em movimento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'modo Manual com ISO mínimo fixo, pois o ISO mínimo sempre corresponde à maior velocidade de obturador disponível na câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'modo AUTO, pois esse modo prioriza automaticamente a velocidade do obturador acima de qualquer outro parâmetro em qualquer situação de baixa luz.', 0);

    -- Questao 3 (Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q03', N'Sobre a diferença entre sensores Full Frame e APS-C, e o impacto do "fator de corte" (crop factor ≈ 1,5×) na fotografia pericial, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sensores APS-C produzem imagens com maior número de megapixels que sensores Full Frame de qualquer geração, em qualquer comparação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o fator de corte altera fisicamente a distância focal da objetiva, transformando uma lente de 50mm em uma lente de 75mm permanentemente, mesmo se reutilizada em câmera Full Frame.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'uma objetiva de 50mm utilizada em câmera APS-C produz um ângulo de visão equivalente ao de uma objetiva de aproximadamente 75mm em câmera Full Frame (50 × 1,5), sem que as características físicas da lente (abertura real, distorções) sejam alteradas — apenas o ângulo de visão registrado pelo sensor menor é reduzido.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sensores Full Frame são incompatíveis com objetivas projetadas para sensores APS-C, sendo impossível o uso cruzado em qualquer situação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o fator de corte de 1,5× refere-se exclusivamente à diferença de preço entre câmeras Full Frame e APS-C, sem qualquer relação óptica.', 0);

    -- Questao 4 (Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q04', N'Ao fotografar uma cena em condições de iluminação mista (parte sob luz natural pela janela, parte sob iluminação artificial fluorescente), utilizando o balanço de branco automático da câmera, o resultado mais provável é', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a câmera elimina automaticamente uma das fontes de luz da imagem, exibindo apenas a área iluminada pela fonte de maior intensidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'toda a imagem é registrada em escala de cinza, pois o balanço de branco automático não funciona em condições de iluminação mista.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a câmera converte automaticamente o arquivo para RAW, independentemente da configuração original, ao detectar fontes de luz mistas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a câmera calcula uma única configuração de balanço de branco "média" para toda a cena, podendo resultar em dominante de cor incorreta em uma ou ambas as áreas — a área sob luz natural pode parecer com tonalidade diferente da área sob luz fluorescente, já que cada fonte possui temperatura de cor distinta e o ajuste automático não pode corrigir perfeitamente ambas simultaneamente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a resolução da imagem é reduzida automaticamente à metade sempre que duas fontes de luz com temperaturas de cor diferentes são detectadas na mesma cena.', 0);

    -- Questao 5 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q05', N'Em relação à diferença entre zoom óptico e zoom digital, e seu impacto na fotografia pericial, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ambos os tipos de zoom produzem resultado idêntico em termos de detalhe capturado, diferindo apenas no mecanismo (motorizado vs. manual).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o zoom digital sempre produz imagens de qualidade superior ao zoom óptico, pois utiliza processamento computacional para reconstruir detalhes ausentes na captura óptica original.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o zoom óptico altera fisicamente o ISO da câmera proporcionalmente ao fator de ampliação, enquanto o zoom digital mantém o ISO constante.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o zoom óptico e o digital são tecnicamente intercambiáveis em qualquer câmera, sendo a escolha entre eles puramente uma questão de preferência do fabricante sem implicações na qualidade final.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o zoom óptico desloca fisicamente os elementos da objetiva, alterando a distância focal efetiva e mantendo a resolução original do sensor; o zoom digital recorta uma área central da imagem e a amplia por interpolação, sem captar informação óptica adicional — resultando em perda de detalhe real e potencial pixelização, o que compromete a qualidade de imagens periciais ampliadas digitalmente.', 1);

    -- Questao 6 (Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q06', N'Considere uma fonte de flash com Número Guia (NG) = 40 (para ISO 100). Para fotografar um assunto a 5 metros de distância, a abertura do diafragma correta é, aproximadamente', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'f/8 (pois NG ÷ distância = 40 ÷ 5 = 8, correspondendo à abertura f/8).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'f/200 (pois NG × distância = 40 × 5 = 200, correspondendo diretamente ao valor de f).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'f/45 (pois NG + distância = 40 + 5 = 45, correspondendo diretamente ao valor de f).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'f/2 (pois distância ÷ NG = 5 ÷ 40 ≈ 0,125, e o inverso aproximado é 2).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'indeterminável, pois o Número Guia não tem qualquer relação matemática com a abertura do diafragma ou a distância ao assunto.', 0);

    -- Questao 7 (Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q07', N'Sobre a Lei do Inverso do Quadrado da Distância aplicada a uma fonte de luz pontual (como um flash), é correto afirmar que, ao dobrar a distância entre a fonte e o assunto', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a intensidade da luz que atinge o assunto permanece exatamente a mesma, independentemente da distância, sendo essa lei aplicável apenas à luz solar.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a intensidade da luz que atinge o assunto cai para 1/4 do valor original (perda de 2 stops de exposição), pois a intensidade é inversamente proporcional ao quadrado da distância (I ∝ 1/d²).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a intensidade da luz dobra, compensando automaticamente a distância adicional percorrida pela luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a temperatura de cor da fonte se altera proporcionalmente ao quadrado da distância, tornando-se mais quente conforme o assunto se afasta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a intensidade da luz cai para a metade (1/2), correspondendo a uma perda de 1 stop de exposição, de forma linear com a distância.', 0);

    -- Questao 8 (Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q08', N'Em uma cena fotografada sob luz de tungstênio (≈3.200K) com a câmera configurada para balanço de branco "Daylight" (≈5.600K), o resultado visual esperado, e a correção mais adequada, são', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a imagem aparecerá com forte dominante azulada, e a correção seria aplicar um filtro CTO (laranja) sobre a fonte de tungstênio ou ajustar o balanço de branco da câmera para "Tungstênio" no momento da captura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a imagem aparecerá em preto e branco, pois a incompatibilidade entre a temperatura de cor da fonte e o balanço de branco da câmera desativa o processamento de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a imagem aparecerá com forte dominante alaranjada/amarelada, pois a luz de tungstênio (mais "quente", menor temperatura em Kelvin) registrada com balanço de branco ajustado para luz mais "fria" (Daylight, maior Kelvin) produz excesso de tons quentes; a correção seria aplicar filtro CTB (azul) sobre a fonte de tungstênio, ou ajustar o balanço de branco da câmera para "Tungstênio"/incandescente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'não haverá qualquer alteração visual, pois o balanço de branco "Daylight" é universal e compatível com qualquer fonte de luz, independentemente da temperatura de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a imagem aparecerá superexposta em pelo menos 4 stops, pois a luz de tungstênio é sempre mais intensa que a luz do dia em termos de número de lumens.', 0);

    -- Questao 9 (Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q09', N'Sobre as diferenças entre luz dura (hard light) e luz suave (soft light) na iluminação fotográfica, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'luz dura é sempre produzida por fontes de LED, e luz suave é sempre produzida por fontes de flash, sendo essa a única diferenciação entre os dois tipos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'luz dura e luz suave são termos exclusivos da iluminação artificial, não sendo aplicáveis à luz natural em nenhuma circunstância.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'luz dura é caracterizada por temperatura de cor sempre superior a 6.000K, enquanto luz suave é caracterizada por temperatura de cor sempre inferior a 4.000K, independentemente do tamanho da fonte.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'luz dura, produzida por fontes pequenas e/ou distantes em relação ao assunto (ex.: sol em céu limpo, flash direto sem difusor), produz sombras bem definidas e de transição abrupta, com alto contraste; luz suave, produzida por fontes grandes e/ou próximas (ex.: céu nublado, softbox, luz rebatida), produz sombras com transição gradual e menor contraste, "envolvendo" melhor o assunto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a diferença entre luz dura e luz suave depende exclusivamente da potência (em watts) da fonte, sendo fontes de maior potência sempre classificadas como luz dura.', 0);

    -- Questao 10 (Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q10', N'A técnica de flash rebatido (bounce flash), em que o flash é direcionado para o teto ou parede ao invés do assunto diretamente, tem como objetivo e implicação prática', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir o consumo de bateria do flash, sendo essa a única finalidade da técnica, sem efeito sobre a qualidade da luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a temperatura de cor da luz emitida em pelo menos 2.000K, independentemente da cor da superfície de rebatimento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar completamente a necessidade de qualquer ajuste de exposição, pois o flash rebatido sempre produz exposição idêntica ao flash direto na mesma distância.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'converter o flash de luz pontual em fonte de luz contínua (tipo tungstênio), alterando permanentemente seu modo de disparo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'transformar a superfície de rebatimento (teto/parede) em uma fonte de luz secundária, maior e mais difusa que o flash original — produzindo iluminação mais suave e com sombras mais sutis no assunto; como consequência, a luz percorre uma distância maior (até a superfície e depois até o assunto) e perde intensidade, exigindo compensação de exposição (maior abertura, ISO mais alto, ou maior potência do flash); a cor da superfície de rebatimento também pode introduzir uma dominante de cor na luz resultante.', 1);

    -- Questao 11 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q11', N'Sobre a relação entre distância focal e profundidade de campo, mantendo-se constante a abertura do diafragma e a distância ao assunto, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'objetivas de maior distância focal (teleobjetivas) tendem a produzir menor profundidade de campo que objetivas de menor distância focal (grandes angulares), na mesma abertura e distância ao assunto — por isso teleobjetivas são frequentemente usadas para isolar o assunto do fundo (fundo desfocado), enquanto grandes angulares tendem a manter mais elementos da cena em foco.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a distância focal não tem qualquer relação com a profundidade de campo, sendo esta determinada exclusivamente pela abertura do diafragma, independentemente da objetiva utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'objetivas de maior distância focal sempre produzem maior profundidade de campo que objetivas de menor distância focal, em qualquer condição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a profundidade de campo é determinada exclusivamente pelo ISO utilizado, sendo a distância focal e a abertura irrelevantes para esse parâmetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'grandes angulares produzem sempre o mesmo ângulo de visão que teleobjetivas, diferindo apenas no peso físico do equipamento.', 0);

    -- Questao 12 (Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q12', N'O filtro polarizador, quando utilizado corretamente (com o anel rotacionado para a posição de máxima polarização), pode produzir os seguintes efeitos na imagem:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da velocidade do obturador disponível, pois o filtro polarizador permite mais entrada de luz que qualquer outro filtro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'redução de reflexos em superfícies não metálicas (vidro, água, plástico) e aumento da saturação de cores, especialmente do céu azul, que pode escurecer significativamente dependendo do ângulo em relação ao sol; o efeito é mais pronunciado quando o ângulo entre a câmera, o assunto e a fonte de luz está próximo de 90°.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'conversão automática da imagem para preto e branco, sendo essa sua única função prática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento da profundidade de campo em pelo menos 3 stops, independentemente da abertura configurada na objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminação completa da necessidade de balanço de branco, pois o filtro polarizador normaliza automaticamente a temperatura de cor da cena para 5.600K.', 0);

    -- Questao 13 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q13', N'A aberração cromática, fenômeno óptico comum em objetivas (especialmente em zonas de alto contraste das imagens), ocorre porque', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o sensor da câmera processa as cores em velocidades diferentes, gerando atraso entre os canais R, G e B durante a leitura do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o filtro de Bayer do sensor está desalinhado fisicamente, sendo um defeito exclusivamente do hardware do sensor e não da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o vidro da objetiva refrata diferentes comprimentos de onda da luz (cores) em ângulos levemente distintos, fazendo com que não convirjam exatamente no mesmo ponto do plano focal — resultando em franjas coloridas (geralmente roxas/verdes) visíveis nas bordas de alto contraste da imagem; objetivas com elementos ópticos especiais (ED, low dispersion) reduzem esse efeito.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a compressão JPEG aplicada pela câmera separa intencionalmente os canais de cor para reduzir o tamanho do arquivo, causando esse efeito apenas em arquivos comprimidos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o flash utilizado na captura emite luz em comprimentos de onda incompatíveis com o sensor, gerando esse artefato apenas em fotos com flash.', 0);

    -- Questao 14 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q14', N'A objetiva do tipo "olho-de-peixe" (fisheye), em comparação com uma grande angular convencional, caracteriza-se por', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'distância focal sempre superior a 100mm, sendo tecnicamente classificada como teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ausência total de distorção, produzindo linhas retas perfeitamente retas em qualquer posição do quadro, ao contrário das grandes angulares convencionais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'compatibilidade exclusiva com câmeras de médio e grande formato, sendo incompatível com sensores de 35mm ou APS-C.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'manter intencionalmente a distorção esférica (de barril) acentuada, atingindo ângulos de visão extremamente amplos (até 180° ou mais), produzindo imagens com linhas retas curvadas (especialmente nas bordas) — diferentemente das grandes angulares convencionais, que buscam corrigir/minimizar essa distorção mesmo com ângulos de visão amplos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'produzir imagens exclusivamente em escala de cinza, sendo seu uso restrito à fotografia documental em preto e branco.', 0);

    -- Questao 15 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q15', N'O fenômeno de vinhetagem (escurecimento progressivo das bordas/cantos da imagem em relação ao centro) pode ter como causas', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'exclusivamente defeitos de fabricação do sensor, sendo impossível corrigir esse efeito por meio de software de edição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'exclusivamente o uso de cartões de memória de baixa velocidade de escrita, sendo resolvido apenas com a troca do cartão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exclusivamente a configuração de ISO muito alto, sendo eliminada ao reduzir o ISO para o valor mínimo da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'exclusivamente o uso do flash embutido da câmera, sendo eliminada ao utilizar flash externo em qualquer situação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'características ópticas da própria objetiva em determinadas combinações de abertura (especialmente em grandes aberturas, como f/1,4-f/2,8), uso de para-sol inadequado, ou adaptadores/filtros empilhados (especialmente em grandes angulares) que obstruem parcialmente os raios de luz que chegariam às bordas do sensor; muitas vezes pode ser atenuada fechando o diafragma ou corrigida em pós-processamento.', 1);

    -- Questao 16 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q16', N'O processo químico de revelação do filme fotográfico em preto e branco tem como função principal', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir os haletos de prata (cristais sensibilizados pela luz durante a exposição, formando a "imagem latente") a prata metálica, tornando visível a imagem que estava registrada apenas como alteração química invisível na emulsão — quanto mais luz incidiu sobre determinada área do filme durante a exposição, mais prata metálica (escurecimento) se forma naquela área durante a revelação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'adicionar cor à imagem, sendo essa etapa exclusiva do processamento de filmes coloridos e ausente no processamento de filmes preto e branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'remover completamente a emulsão fotossensível do filme, deixando apenas a base de poliéster transparente como produto final.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'converter o filme analógico diretamente em arquivo digital, sendo um processo eletrônico e não químico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a sensibilidade ISO do filme permanentemente, permitindo reutilização do mesmo filme em exposições futuras com maior sensibilidade.', 0);

    -- Questao 17 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q17', N'No fluxo de processamento de um filme em preto e branco, a sequência correta de etapas químicas básicas é', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fixação → revelação → lavagem, pois a fixação deve preceder a revelação para preparar a emulsão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'revelação (reduz os haletos de prata expostos à luz a prata metálica, formando a imagem visível) → interrupção/banho de parada (interrompe quimicamente a ação do revelador) → fixação (remove os haletos de prata não expostos/não revelados, que ainda são sensíveis à luz, tornando a imagem estável e permanente) → lavagem final (remove resíduos químicos).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'lavagem → fixação → revelação → secagem, sendo a lavagem inicial obrigatória antes de qualquer contato do filme com produtos químicos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'revelação → secagem → fixação, sendo a secagem uma etapa intermediária obrigatória entre revelação e fixação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'as etapas podem ser realizadas em qualquer ordem, pois os produtos químicos envolvidos não interagem entre si.', 0);

    -- Questao 18 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q18', N'Os haletos de prata (cloreto, brometo e iodeto de prata) presentes na emulsão fotográfica de filmes e papéis analógicos são caracterizados por', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'serem completamente insensíveis à luz, exigindo exposição prolongada a radiação ultravioleta para qualquer reação química.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'dissolverem-se completamente na água em temperatura ambiente, sendo essa a razão pela qual filmes não podem ser molhados antes da revelação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'serem compostos fotossensíveis que, ao serem expostos à luz, sofrem alteração química (formando a imagem latente, ainda invisível) e que, durante a revelação, são reduzidos a prata metálica nas áreas que receberam luz — sendo posteriormente removidos pelo fixador nas áreas não expostas/não revelados, que permaneceriam sensíveis à luz se não removidos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'serem compostos exclusivamente sintéticos, sem qualquer relação com o elemento químico prata (Ag), apesar do nome.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'tornarem-se mais sensíveis à luz após o processo de fixação, sendo essa a razão da necessidade de armazenamento do negativo em local escuro mesmo após revelado.', 0);

    -- Questao 19 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q19', N'A função do fixador no processamento fotográfico é', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o contraste da imagem revelada, escurecendo ainda mais as áreas que já haviam sido reveladas como prata metálica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'adicionar a cor à imagem em filmes coloridos, sendo um processo exclusivo desse tipo de filme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'interromper a ação do revelador antes que ele atue sobre os haletos de prata não expostos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'remover (dissolver e tornar solúveis) os haletos de prata que não foram expostos à luz e, portanto, não foram convertidos em prata metálica durante a revelação — essas áreas, se não removidas, permaneceriam fotossensíveis e escureceriam progressivamente com a exposição à luz, destruindo a imagem; o fixador "fixa" (torna permanente e estável) a imagem revelada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'converter o negativo diretamente em positivo, eliminando a necessidade de qualquer processo de ampliação ou contato posterior.', 0);

    -- Questao 20 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q20', N'Em relação à composição física dos filmes fotográficos analógicos, a estrutura típica é composta por', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'uma única camada de vidro temperado revestida diretamente com pigmentos coloridos permanentes, sem qualquer componente sensível à luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'exclusivamente metal (geralmente alumínio), sendo o filme fotográfico um disco metálico rígido similar a um CD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'papel fotográfico revestido com tinta à base de óleo, idêntico ao papel utilizado em impressoras a jato de tinta convencionais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'circuitos eletrônicos miniaturizados equivalentes a um sensor CMOS flexível, sendo tecnicamente um "sensor analógico" no sentido eletrônico do termo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'uma base flexível (geralmente de poliéster ou triacetato de celulose, este último adotado por ser menos inflamável que o nitrato de celulose usado historicamente) revestida com uma emulsão fotossensível contendo haletos de prata dispersos em gelatina.', 1);

    -- Questao 21 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q21', N'Na razão de ampliação 1:1 (escala macro de tamanho natural), o fator de exposição (FE), calculado pela fórmula FE = (M+1)², resulta em', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'FE = (1+1)² = 4, exigindo compensação de 2 stops (quadruplicar o tempo de exposição ou abrir 2 stops no diafragma) em câmeras sem medição TTL.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'FE = 1, não exigindo qualquer compensação, pois a escala 1:1 é considerada a posição "neutra" de exposição da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'FE = (1+1)² = 4, mas essa compensação deve ser aplicada apenas ao ISO, nunca ao tempo de exposição ou à abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'FE = 0, pois em escala 1:1 a quantidade de luz que atinge o sensor é sempre igual à quantidade de luz incidente na cena, independentemente da extensão utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'indeterminável, pois a fórmula FE = (M+1)² aplica-se exclusivamente a ampliações superiores a 5:1.', 0);

    -- Questao 22 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q22', N'Na fotografia macro pericial de vestígios minúsculos (impressões digitais, fibras, marcas de ferramenta), a profundidade de campo extremamente reduzida exige, frequentemente, a aplicação da técnica de', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'conversão automática para RAW, que aumentaria proporcionalmente a profundidade de campo da imagem capturada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'empilhamento de foco (focus stacking): captura de múltiplas imagens com planos de foco ligeiramente diferentes ao longo do eixo do assunto, posteriormente combinadas em pós-processamento para produzir uma imagem final com toda a extensão do vestígio em foco nítido.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumento do ISO ao máximo disponível, que automaticamente amplia a profundidade de campo na mesma proporção do aumento de sensibilidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'uso exclusivo do flash de anel, que por si só elimina completamente a necessidade de qualquer profundidade de campo adicional.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'remoção física da objetiva da câmera, fotografando diretamente pelo corpo, técnica que aumentaria a profundidade de campo proporcionalmente à distância removida.', 0);

    -- Questao 23 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q23', N'Os tubos de extensão, ao serem acoplados entre o corpo da câmera e a objetiva para macrofotografia, têm como efeito principal', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reduzir a distância focal da objetiva pela metade, dobrando automaticamente o ângulo de visão registrado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'adicionar elementos ópticos corretivos que eliminam qualquer aberração cromática da objetiva original.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar a distância entre a objetiva e o plano focal (sensor), o que reduz a distância mínima de focalização e aumenta a razão de ampliação obtida — sem alteração da qualidade óptica intrínseca da objetiva, porém com perda de luz proporcional à extensão adicionada e, frequentemente, perda da capacidade de foco no infinito.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'converter automaticamente qualquer objetiva em uma objetiva fisheye, ampliando o ângulo de visão para até 180°.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar completamente a necessidade de iluminação adicional, pois os tubos de extensão concentram a luz ambiente proporcionalmente ao seu comprimento.', 0);

    -- Questao 24 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q24', N'Sobre a relação entre o código Hash (ex.: MD5, SHA-1) de um arquivo de imagem digital e sua utilização na fotografia pericial, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o Hash é calculado a partir apenas do nome do arquivo e da data de criação registrada pelo sistema operacional, sendo independente do conteúdo binário do arquivo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o Hash sempre se altera espontaneamente após um período de tempo (ex.: 24 horas), independentemente de qualquer ação sobre o arquivo, sendo portanto inadequado para verificação de integridade de longo prazo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o Hash é uma sequência alfanumérica gerada a partir do conteúdo binário completo do arquivo (incluindo dados de pixel e metadados); qualquer alteração no arquivo — ainda que mínima, como a modificação de um único pixel ou de um caractere de metadado — produz um Hash completamente diferente, permitindo verificar se o arquivo permanece idêntico ao original (mesmo Hash) ou foi alterado (Hash diferente).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o Hash criptografa o conteúdo do arquivo de imagem, tornando-o ilegível até que seja "descriptografado" com uma senha definida pelo perito no momento da captura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'arquivos RAW não podem ter seu Hash calculado, sendo essa verificação de integridade exclusiva de arquivos JPEG.', 0);

    -- Questao 25 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q25', N'Sobre a diferença entre arquivos RAW e JPEG em relação ao processamento interno da câmera e à preservação de informação para fins periciais, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o JPEG preserva mais informação bruta do sensor que o RAW, sendo por isso o formato preferido em laudos periciais que exigem máxima fidelidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ambos os formatos são processados de forma idêntica pela câmera, diferindo apenas na extensão do arquivo gerado no momento da gravação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o RAW aplica compressão com perdas mais agressiva que o JPEG, resultando em arquivos sempre menores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o RAW armazena imagens exclusivamente em preto e branco, sendo a cor adicionada apenas durante a conversão para JPEG no computador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o RAW preserva os dados brutos captados pelo sensor (sem demosaicing definitivo, sem compressão com perdas, sem balanço de branco "queimado" nos dados), funcionando como um "negativo digital" com maior bit depth (12-14 bits vs. 8 bits do JPEG) — permitindo recuperação de detalhes em altas-luzes/sombras e ajustes de balanço de branco no pós-processamento sem a degradação progressiva que ocorre ao reabrir e regravar arquivos JPEG sucessivamente.', 1);

    -- Questao 26 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q26', N'Ao extrair um frame (quadro estático) de um vídeo gravado em Full HD (1920×1080) para uso como evidência fotográfica, a resolução resultante dessa imagem estática será', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'correspondente à resolução do quadro de vídeo de origem (1920×1080, aproximadamente 2,1 megapixels) — significativamente inferior à resolução típica de uma fotografia capturada por câmera fotográfica dedicada (12-24+ megapixels), o que representa uma limitação relevante para ampliações e impressões periciais de grande formato.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'automaticamente ampliada para a resolução máxima do monitor utilizado na reprodução, independentemente da resolução de gravação do vídeo original.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'sempre igual a zero, pois frames extraídos de vídeo não podem ser convertidos em arquivos de imagem estática sob nenhuma circunstância.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'equivalente à resolução total do sensor da câmera (em megapixels), independentemente da resolução configurada para a gravação de vídeo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sempre superior a 20 megapixels, pois todo processo de extração de frame aplica upscaling automático por padrão em qualquer software de edição.', 0);

    -- Questao 27 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q27', N'Ao calcular a velocidade aproximada de um veículo a partir de frames extraídos de um vídeo de CFTV, sabendo a distância percorrida entre dois pontos de referência fixos na cena, a informação adicional indispensável é', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a marca e o modelo do veículo, pois cada modelo possui uma velocidade máxima tabelada que define diretamente o resultado do cálculo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o número de frames decorridos entre o veículo passar pelo primeiro e pelo segundo ponto de referência, combinado com a taxa de quadros (fps) da gravação — permitindo calcular o tempo decorrido (frames ÷ fps) e, com a distância conhecida, a velocidade média (distância ÷ tempo).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a cor do veículo, que se relaciona proporcionalmente com a velocidade pela escala de temperatura de cor Kelvin.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o tamanho do arquivo de vídeo em megabytes, que determina matematicamente a velocidade de qualquer objeto registrado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o código Hash do arquivo de vídeo, do qual a velocidade pode ser extraída diretamente por meio de cálculo criptográfico reverso.', 0);

    -- Questao 28 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q28', N'Sobre a estrutura de compressão de vídeo conhecida como GOP (Group of Pictures), na qual os quadros são classificados como I-frames, P-frames e B-frames, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'todos os tipos de frame contêm exatamente a mesma quantidade de dados, sendo a nomenclatura apenas decorativa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'B-frames significam "black and white", sendo utilizados apenas em vídeos preto e branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o I-frame (intra-coded) contém a informação completa e independente de uma imagem ("quadro-chave"); P-frames e B-frames armazenam apenas as diferenças em relação a quadros de referência próximos, economizando espaço de armazenamento — por isso, ao extrair frames de um vídeo comprimido para análise pericial, um I-frame tende a fornecer uma imagem de qualidade mais previsível e consistente do que um P-frame ou B-frame, cuja reconstrução depende da decodificação correta dos quadros de referência associados.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a estrutura GOP determina exclusivamente a velocidade de reprodução (fps) do vídeo, sem qualquer relação com a compressão de dados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'P-frames sempre ocupam mais espaço que I-frames, pois armazenam informações de múltiplos quadros simultaneamente de forma redundante.', 0);

    -- Questao 29 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q29', N'Um perito fotografa um local de crime utilizando uma câmera DSLR configurada em RAW, com flash externo rebatido no teto, objetiva macro de 100mm para registrar uma marca de ferramenta, e posteriormente extrai também frames de um vídeo de CFTV do mesmo local. Considerando os formatos de arquivo gerados (RAW da câmera fotográfica e frame extraído do vídeo), a afirmação correta sobre a documentação pericial desses materiais é', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas o arquivo de vídeo precisa ter seu Hash calculado, pois arquivos RAW de câmeras fotográficas são, por definição, sempre íntegros e não necessitam dessa verificação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ambos os tipos de material (RAW fotográfico e arquivo de vídeo/frame extraído) devem ser preservados em sua forma original, com Hash calculado e registrado para cada um, documentando-se separadamente quaisquer processamentos posteriores (conversões, ajustes, extrações de frame) — preservando a cadeia de custódia digital de cada material, independentemente de sua origem (câmera fotográfica ou sistema de CFTV).', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o arquivo RAW deve ser convertido obrigatoriamente para o mesmo formato do frame de vídeo (geralmente JPEG) antes de qualquer cálculo de Hash, para padronização do laudo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas um dos materiais (o de maior resolução) precisa ser preservado, sendo o de menor resolução descartável sem prejuízo à cadeia de custódia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a cadeia de custódia digital aplica-se exclusivamente a arquivos de vídeo, não sendo um conceito relevante para arquivos fotográficos RAW.', 0);

    -- Questao 30 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q30', N'Comparando a fotografia macro de uma impressão digital com escala métrica (registro fotográfico estático) e a extração de um frame de vídeo mostrando a mesma impressão digital (caso hipotético de câmera em movimento sobre a superfície), do ponto de vista da qualidade da evidência para análise datiloscópica, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ambos os métodos produzem, sempre, exatamente a mesma resolução e qualidade, sendo a escolha entre eles indiferente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o frame de vídeo sempre produzirá qualidade superior, pois vídeos capturam mais informação por segundo que fotografias estáticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a fotografia macro estática, com objetiva dedicada, escala métrica, iluminação controlada (ex.: flash de anel) e configurações otimizadas (abertura para profundidade de campo adequada, ISO baixo para minimizar ruído), tende a produzir resolução e nível de detalhe superiores ao frame extraído de vídeo — que está limitado pela resolução do vídeo (tipicamente Full HD ou inferior, ≈2,1MP), pela possível presença de motion blur (já que a câmera estaria em movimento) e pela compressão do codec de vídeo; por isso, para registro definitivo de vestígios como impressões digitais, a fotografia macro estática dedicada é preferível.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a escala métrica é incompatível com qualquer registro em vídeo, tornando frames de vídeo automaticamente inválidos para qualquer finalidade pericial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o flash de anel não pode ser utilizado em conjunto com objetivas macro de 100mm, sendo compatível apenas com objetivas de 50mm.', 0);

    -- Questao 31 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q31', N'Considerando o conjunto de conhecimentos sobre sensores (CCD/CMOS), formatos de arquivo (RAW/JPEG/TIFF), e o conceito de "negativo digital" aplicado ao RAW, a melhor prática de arquivamento de longo prazo de fotografias periciais digitais envolve', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'manter os arquivos RAW originais (com Hash registrado, seguindo a regra "3-2-1" de backup: múltiplas cópias, em mídias diferentes, com uma cópia em local geograficamente distinto), considerando ainda que formatos RAW proprietários (.CR2, .NEF, .ARW, etc.) podem se tornar menos acessíveis com o tempo — sendo prudente manter também uma cópia em formato padronizado (DNG ou TIFF) para garantir legibilidade futura, sem descartar o RAW original.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'converter imediatamente todos os arquivos RAW para JPEG de baixa qualidade (compressão máxima), descartando o RAW original para economizar espaço de armazenamento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'armazenar apenas em uma única mídia (o cartão de memória original da câmera), sem qualquer cópia adicional, pois cartões de memória profissionais são, segundo essa visão, imunes a falhas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'imprimir todas as fotografias em papel fotográfico e descartar os arquivos digitais, pois cópias impressas seriam a única forma juridicamente válida de arquivamento pericial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'renomear todos os arquivos RAW para a extensão .jpg sem qualquer conversão real do conteúdo binário, considerando essa renomeação suficiente para compatibilidade universal futura.', 0);

    -- Questao 32 (Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Simulado (@sergiofotografopericial) - Simulado Explosivo para Aprovação (Avaliação Geral) - Q32', N'Um candidato ao cargo de Fotógrafo Técnico-Pericial deve compreender que, do ponto de vista técnico geral, a fotografia pericial digital combina conhecimentos de óptica (objetivas, filtros, profundidade de campo), eletrônica (sensores, processamento de imagem), iluminação (fontes, temperatura de cor, número guia), química (materiais sensíveis analógicos), e informática (formatos de arquivo, compressão, metadados, Hash, cadeia de custódia). A afirmação que melhor sintetiza a relação entre esses domínios na atividade pericial é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), NULL, NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'cada domínio (óptica, eletrônica, iluminação, química, informática) é completamente independente dos demais, não havendo qualquer interseção prática entre eles na rotina pericial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apenas o domínio de informática (Hash, formatos de arquivo) é relevante para a validade jurídica da prova, sendo os demais domínios (óptica, iluminação, química) irrelevantes para o laudo pericial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'os conhecimentos analógicos (química dos materiais sensíveis, processamento de filme) tornaram-se completamente obsoletos e não devem mais constar de qualquer formação do fotógrafo pericial, dado o predomínio da fotografia digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a escolha do equipamento (câmera, objetiva, iluminação) e das configurações de captura (abertura, velocidade, ISO, formato de arquivo) influencia diretamente a qualidade e a quantidade de informação disponível para análise posterior; o domínio técnico de cada área (óptica para enquadramento e profundidade de campo corretos, iluminação para reprodução fiel de cores e detalhes, captura em RAW para preservação de informação, e procedimentos de Hash/cadeia de custódia para garantir integridade) trabalha de forma integrada para produzir uma evidência fotográfica tecnicamente adequada e juridicamente válida — sendo a fragilidade em qualquer uma dessas áreas capaz de comprometer a qualidade ou a validade da prova produzida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a validade jurídica de uma fotografia pericial depende exclusivamente do cargo do servidor que a produziu, sendo as configurações técnicas da câmera e o processamento posterior totalmente irrelevantes para esse fim.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

