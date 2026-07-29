-- Insercao de 150 questoes de fotografia extraidas de provas/gabaritos oficiais
-- reais (verificados um a um), adicionadas na pasta QuestoesFto.
-- Fontes: VUNESP (PC-SP 2014, Marilia 2016), IBFC (Feira de Santana 2018),
-- ACPI (Denise-MT 2015), Instituto ADM&TEC (Timbauba 2023, Gravata 2020),
-- SANEPAR (2005), CEBRASPE (ITAIPU 2023/2024), UFG (Caldas Novas-GO 2024).
-- Gabarito sempre oficial, transcrito das provas/gabaritos reais - nenhuma
-- resposta foi inventada. Questoes que exigiam ver uma imagem nao fornecida
-- pelo PDF, ou fora do escopo tecnico de fotografia, foram excluidas.

USE ConcursosDB;
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Triângulo de Exposição')
    INSERT INTO temas (nome) VALUES (N'Triângulo de Exposição');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'ISO')
    INSERT INTO temas (nome) VALUES (N'ISO');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Obturador')
    INSERT INTO temas (nome) VALUES (N'Obturador');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Diafragma')
    INSERT INTO temas (nome) VALUES (N'Diafragma');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Objetivas')
    INSERT INTO temas (nome) VALUES (N'Objetivas');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Filtros')
    INSERT INTO temas (nome) VALUES (N'Filtros');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Tipos de Arquivos')
    INSERT INTO temas (nome) VALUES (N'Tipos de Arquivos');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Componentes da Câmera')
    INSERT INTO temas (nome) VALUES (N'Componentes da Câmera');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Histograma')
    INSERT INTO temas (nome) VALUES (N'Histograma');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Sensor e Fator de Corte')
    INSERT INTO temas (nome) VALUES (N'Sensor e Fator de Corte');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Resolução e Qualidade de Imagem')
    INSERT INTO temas (nome) VALUES (N'Resolução e Qualidade de Imagem');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Flash')
    INSERT INTO temas (nome) VALUES (N'Flash');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Balanço de Branco')
    INSERT INTO temas (nome) VALUES (N'Balanço de Branco');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Focagem')
    INSERT INTO temas (nome) VALUES (N'Focagem');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Tipos de Luzes')
    INSERT INTO temas (nome) VALUES (N'Tipos de Luzes');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Protocolo e Cartão de Memória')
    INSERT INTO temas (nome) VALUES (N'Protocolo e Cartão de Memória');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'História da Fotografia')
    INSERT INTO temas (nome) VALUES (N'História da Fotografia');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Fotometria')
    INSERT INTO temas (nome) VALUES (N'Fotometria');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Impressão')
    INSERT INTO temas (nome) VALUES (N'Impressão');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Composição e Enquadramento')
    INSERT INTO temas (nome) VALUES (N'Composição e Enquadramento');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Edição de Imagens')
    INSERT INTO temas (nome) VALUES (N'Edição de Imagens');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Fotografia Analógica')
    INSERT INTO temas (nome) VALUES (N'Fotografia Analógica');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Luz')
    INSERT INTO temas (nome) VALUES (N'Luz');
IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Modos da Câmera')
    INSERT INTO temas (nome) VALUES (N'Modos da Câmera');

-- ============================================================
-- Fonte: VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial
-- ============================================================
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Questao 1 (Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q01', N'Uma das mais importantes características de uma câmera fotográfica é o controle da quantidade de luz que atinge o sensor digital ou o filme. Três variáveis são consideradas principais no que se refere à exposição da superfície sensível à luz. São elas:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', 2014);
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

    -- Questao 2 (ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q02', N'A escala estabelecida pela International Standards Organization (ISO), para sensibilidades de filmes e/ou sensores, é uma fusão das escalas de dois sistemas anteriores – o ASA (American Standards Association) e o DIN (Deutsche Industrie Normen). Evidenciando-se a necessidade em se elevar o valor da ISO na câmera, no momento da exposição, pode-se concluir:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', 2014);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pretende-se evitar o registro de ruídos na imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a objetiva é pouco luminosa e não se pretende elevar o tempo de exposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a objetiva é pouco luminosa e não se pretende diminuir o tempo de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'há excesso de luz no ambiente para a exposição pretendida.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a objetiva é bastante luminosa, mas a ausência de filtros nos leva à elevação do valor da ISO.', 0);

    -- Questao 3 (Obturador)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q03', N'O que se entende por “tempo de exposição”, no registro fotográfico, é o tempo no qual o obturador permanece', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'VUNESP', 2014);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fechado, enquanto o fotógrafo avalia a intensidade luminosa disponível na cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'fechado, logo após a formação da imagem no sensor, para o registro da imagem no processo digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'fechado, enquanto o fotógrafo determina o diafragma necessário àquela exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aberto, mas o fotógrafo ainda não determinou o diafragma pretendido para aquela exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aberto, e os raios luminosos, passando através da objetiva, atingem a superfície sensível e registram a imagem.', 1);

    -- Questao 4 (Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q04', N'Pode-se afirmar que a função do diafragma no registro fotográfico é determinar', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', 2014);
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

    -- Questao 5 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q05', N'Define-se “distância focal” de uma objetiva como a distância entre', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', 2014);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o último elemento óptico da objetiva e o ponto nodal posterior.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o objeto que se queira em foco e o plano de formação da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o objeto que se queira em foco e o ponto nodal posterior da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o ponto nodal posterior da objetiva até o plano de formação da imagem quando a objetiva está focada no infinito.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o ponto nodal posterior da objetiva até o plano de formação da imagem quando a objetiva está focada na distância mínima.', 0);

    -- Questao 6 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q06', N'As objetivas fotográficas se dividem em três principais categorias, a saber:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', 2014);
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

    -- Questao 7 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q07', N'A distância focal de uma objetiva considerada como “normal” (também chamada de objetiva-padrão) é, aproximadamente, igual', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', 2014);
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
    VALUES (@idQuestao, 'E', N'à diagonal do formato da janela dividida por π.', 0);

    -- Questao 8 (ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q08', N'Em uma fotografia noturna, num ambiente de pouca luz, em que não há a possibilidade de se utilizar qualquer iluminação adicional, uma das opções para uma exposição satisfatória é a de aumentar a sensibilidade do sensor. A elevação do número ISO a um nível considerado alto pode gerar o seguinte resultado na imagem:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'VUNESP', 2014);
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

    -- Questao 9 (Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q09', N'Profundidade de campo pode ser definida como o intervalo de distâncias', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', 2014);
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

    -- Questao 12 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q12', N'São chamadas “objetivas rápidas” aquelas que', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', 2014);
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

    -- Questao 13 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q13', N'Uma importante parte das especificações de qualquer objetiva é a proximidade que ela pode focalizar. As objetivas especiais para macrofotografia são projetadas para que mesmo objetos muito pequenos possam parecer grandes no quadro. Para se alcançar bons resultados com o uso de objetivas macro, pode-se afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', 2014);
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
    VALUES (@idQuestao, 'E', N'com o uso das objetivas macro, independentemente da abertura selecionada, obtém-se praticamente toda a imagem em foco, visto a grande profundidade de campo proporcionada por esse tipo de lente.', 0);

    -- Questao 14 (Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q14', N'Leia a seguinte situação: Ao fotógrafo cabe registrar a imagem de um corpo inerte, deitado em uma cama, no interior de um quarto sem luz elétrica, iluminado apenas por um pouco de luz difusa de fim de tarde que entra pela janela. Não há possibilidade de se usar refletores, pois no ambiente não há corrente elétrica e, por um problema técnico, o flash está inoperante. A primeira leitura de exposição que o fotógrafo faz, enquadrando apenas o corpo, é a seguinte: ISO 3200; 1/125 seg.; f/1.4. O profissional deseja registrar a foto com o melhor resultado possível, evitando ruídos, perda de definição e qualquer alteração no ambiente. Sabendo que o fotógrafo tem à sua disposição um tripé, qual a melhor configuração para que ele alcance o resultado pretendido e mantenha a mesma relação de exposição?', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', 2014);
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

    -- Questao 15 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q15', N'As lentes close-up são usadas de forma semelhante à dos filtros. Funcionam como lentes de aumento e estão disponíveis em graus medidos em dioptrias. Levando-se em conta que a objetiva principal está focalizada no infinito, a que distância o objeto estará em foco quando se monta sobre a objetiva diferentes dioptrias?', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', 2014);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Uma lente de dioptria +1, acoplada a um filtro ND 0.3, focaliza a uma distância de 0,30 m; uma de dioptria + 2, acoplada a um filtro ND 0.6, focaliza a uma distância de 0,60 m, e uma de dioptria + 4, acoplada a um filtro ND 1.2, focaliza a uma distância de 1,2 m.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Uma lente de dioptria +1 focaliza a uma distância mínima de 1 metro, uma de dioptria +2, a 2 metros, e uma de dioptria +4, a 4 metros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Independentemente do grau de dioptria da lente close-up, o foco mínimo será aquele determinado pela distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Independentemente da lente close-up utilizada, o foco mínimo será aquele determinado pelo valor da distância focal da objetiva dividido pelo valor do grau de dioptria da lente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Uma lente de dioptria +1 focaliza a uma distância mínima de 1 metro, uma de dioptria +2, a 0,5 metro, e uma de dioptria +4, a 0,25 metro.', 1);

    -- Questao 16 (Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q16', N'O filtro polarizador é também utilizado para eliminar reflexos em vidro ou água. Para que esse resultado seja alcançado, avalia-se o efeito no visor ou LCD', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', 2014);
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

    -- Questao 17 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q17', N'Pode-se considerar que, nos sistemas digitais, o equivalente à imagem latente do filme fotográfico fotoquímico é(são)', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', 2014);
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

    -- Questao 18 (Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q18', N'É necessário, para cada profissional que opera a câmera, o ajuste no visor da sua própria dioptria, pois a correção dióptrica', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', 2014);
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

    -- Questao 19 (Histograma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q19', N'Grande parte das câmeras fotográficas digitais oferece uma representação gráfica, instrumento de avaliação, tanto antes como depois da exposição e do registro da imagem. A representação gráfica a que se refere o enunciado é', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', 2014);
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

    -- Questao 20 (Histograma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q20', N'Com a exibição do gráfico mencionado na questão anterior, o fotógrafo é capaz de verificar', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'VUNESP', 2014);
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

    -- Questao 21 (Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q21', N'Nas câmeras digitais, os raios de luz que atravessam a objetiva formam a imagem quando atingem o sensor. Na grande maioria dos equipamentos, o sensor é uma superfície plana composta por uma matriz bidimensional de', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', 2014);
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

    -- Questao 22 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q22', N'Considere como suficiente para a impressão a resolução de 300 dpi. Quais as dimensões em pixels que uma imagem deve ter para se permitir a impressão em formato 20 cm x 30 cm?', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'VUNESP', 2014);
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

    -- Questao 23 (Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q23', N'A potência de um flash é geralmente expressa por um número-guia. Quanto mais alto o número, mais potente é o flash. Considere um flash (com sistema de medidas expressas em metros) com número guia 28 para uma sensibilidade de ISO 100. Para se iluminar corretamente um assunto que esteja situado a 5 metros, o diafragma deve ser de', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', 2014);
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

    -- Questao 25 (Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q25', N'Em fotografia, a combinação de comprimentos de onda com diferentes tipos de luz é mensurada em termos de temperatura de cor, utilizando-se para isso a escala Kelvin. Em termos gerais, pode-se dizer que as temperaturas de cor da luz de tungstênio, da luz do flash eletrônico e da luz de um céu encoberto correspondem, respectivamente, a', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', 2014);
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

    -- Questao 26 (Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q26', N'Diferentes fontes de luz geram diferentes temperaturas de cor com diferentes preponderâncias cromáticas. Levando-se em conta o espectro eletromagnético para a luz visível, pode-se observar, de maneira comparativa, a seguinte predominância tonal para refletores com lâmpadas de tungstênio e refletores com lâmpadas HMI, respectivamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'VUNESP', 2014);
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

    -- Questao 28 (Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q28', N'Trata-se de uma fotografia capturada com câmera digital sob as seguintes condições: Objetiva 200 mm; 1/500 seg.; f/5.6 e ISO 100. Entre as alternativas, assinale aquela em que, mantendo-se a mesma objetiva e modificando-se algumas variáveis, está descrita de forma correta a alteração que se processa na imagem.', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', 2014);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/1000 seg.; f/4; ISO 100. A exposição é mantida com redução da nitidez do registro do assunto em movimento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/250 seg.; f/2.8; ISO 100. A exposição não é mantida, resultando-se em uma imagem subexposta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/500 seg.; f/11; ISO 400. A exposição é mantida com diminuição na profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/2000 seg.; f/2.8; ISO 100. A exposição se mantém com redução na profundidade de campo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'1/500 seg.; f/8; ISO 200. A exposição não é mantida, resultando-se em uma imagem superexposta.', 0);

    -- Questao 29 (Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q29', N'Na grande maioria das câmeras fotográficas digitais, há duas possibilidades de controle de foco: manual e automático. Na prática, indique em qual situação o ajuste manual se torna mais eficiente que o automático.', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'VUNESP', 2014);
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

    -- Questao 30 (Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q30', N'Considerando-se dois tipos de refletores de luz contínua disponíveis no mercado, refletores de lâmpadas halógenas com lentes Fresnel e refletores com lâmpadas fluorescentes, pode-se afirmar que os resultados práticos de iluminação obtidos, respectivamente, para cada tipo de refletor, são:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'VUNESP', 2014);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'luz dura sem formação de sombras e luz difusa com sombras em dégradé.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'luz dura com sombras em dégradé e luz difusa com sombras definidas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'luz difusa com sombras em dégradé e luz dura com sombras definidas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'luz dura com sombras definidas e luz difusa com sombras em dégradé.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'luz difusa com sombras definidas e luz dura com sombras em dégradé.', 0);

    -- Questao 31 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q31', N'Quando uma imagem se torna um arquivo digital por meio da câmera, ela pode ser usada e armazenada de várias formas. Levando-se em consideração que o negativo fotográfico é um suporte físico e pode ser danificado, o que se pode afirmar com relação ao arquivo digital?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'VUNESP', 2014);
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

    -- Questao 32 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2014 - PC-SP - Fotógrafo Técnico-Pericial - Q32', N'Considerando o contexto dos arquivos com informações digitais, a sigla MD5 refere-se a', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'VUNESP', 2014);
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

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

-- ============================================================
-- Fonte: IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo
-- ============================================================
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Questao 31 (História da Fotografia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q31', N'Em 2014, o cineasta alemão, Win Wenders, em parceria com Juliano Ribeiro dirigiu um documentário ítalo-franco-brasileiro, intitulado O Sal da Terra, que retrata a trajetória do fotógrafo:', 1,
        (SELECT id FROM temas WHERE nome = N'História da Fotografia'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Francês, Henri Cartier-Bresson.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Ítalo-Americano, Alessandro Baccari.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Brasileiro, Sebastião Salgado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Alemão, Helmut Newton.', 0);

    -- Questao 32 (Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q32', N'Assinale a alternativa CORRETA. Os fotômetros podem ser integrados aos equipamentos fotográficos ou manuais, portanto, externos, tanto um como o outro:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A medição é realizada através de uma escala.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A medição é realizada tendo por base a palma da mão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A medição é realizada levando-se em conta o ambiente (calor) e temperatura (externa).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A medição é realizada apenas pela luz refletida da objetiva.', 0);

    -- Questao 33 (Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q33', N'Analise as afirmações abaixo e assinale a alternativa INCORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A profundidade de campo também é controlada pelo diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Quanto maior for a abertura do diafragma, menor será o número de F (“f-stop”).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O diafragma fica na frente da objetiva e controla a entrada de luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Um conjunto de lâminas finas e justapostas compõe a estrutura do diafragma.', 0);

    -- Questao 34 (História da Fotografia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q34', N'“Há uma fração de segundo criativa quando você está fazendo uma foto. Seu olho deve enxergar uma composição ou uma expressão que a própria vida oferece a você, e você deve saber, através da intuição, quando clicar. Esse é o momento em que o fotógrafo é criativo”. Esta frase é de autoria de:', 1,
        (SELECT id FROM temas WHERE nome = N'História da Fotografia'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Martine Franck.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Henri Cartier-Bresson.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Walter Firmo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Marc Ferrez.', 0);

    -- Questao 35 (História da Fotografia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q35', N'Analise as afirmativas abaixo e assinale a alternativa correta. Podemos destacar como expoentes e pioneiros da Fotografia no Brasil: I. Hercule Florence, Sebastião Salgado, Gervásio Baptista. II. Araquém Alcântara, Sebastião Salgado, Gervásio Baptista. III. Victor Frond, Augusto Malta, Militão Augusto de Azevedo. IV. Marc Ferrez, José Christiano Junior, Geraldo Barros. V. Anna Mariani, José Christiano Junior, Gervásio Baptista. Estão corretas as afirmativas:', 1,
        (SELECT id FROM temas WHERE nome = N'História da Fotografia'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I, II, IV apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'II, III, IV, V apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'II, IV apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'III apenas.', 1);

    -- Questao 37 (ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q37', N'Analise as frases abaixo e assinale a alternativa correta:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Em um ambiente com pouca luz, o fotógrafo optou por uma maior sensibilidade do sensor, o que torna a imagem mais clara, porém evidencia o ruído. Valores baixos são menos sensíveis, granulam pouco e têm como resultado uma imagem com qualidade melhor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A baixa sensibilidade em ISO 100 não permite grandes ampliações porque a granulação expõe maiores detalhes do objeto fotografado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O uso do ISO 200 a 800 requer muita luz, o que delimita o tipo de objeto a ser fotografado, sendo utilizado apenas em fotografia de movimento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Fechando o diafragma, isto é, reduzindo gradativamente seu diâmetro, aumenta-se ao mesmo tempo a quantidade de luz que entra pela objetiva.', 0);

    -- Questao 38 (Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q38', N'É correta a utilização do Flash de Preenchimento durante a luz do dia, pois deste modo:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A imagem ficará superexposta e, portanto, natural.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Há uma melhor distribuição da luz na imagem, propiciando a diminuição acentuada de sombras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'As sombras, com a luz do flash, sumirão por completo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Produzirão brilhos agradáveis como resultado do contraste entre luz e sombras.', 0);

    -- Questao 39 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q39', N'Assinale a alternativa que apresenta qual é a relação entre a Qualidade da Imagem e o Número de Pixels:', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Uma imagem com alta resolução terá menos pixels, menos detalhes e definição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Menores sensores de imagem produzem maior número de pixels que, por sua vez, irão gerar imagens digitais de melhor qualidade.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A qualidade da imagem é diretamente proporcional ao número de pixels que forma a imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O pixel é a unidade de medida para imagens digitais e analógicas.', 0);

    -- Questao 40 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q40', N'A resolução de imagens é determinada através de cálculos. Analise as afirmativas a seguir atribuindo-lhes valores Verdadeiro (V) ou Falso (F). ( ) PPI (pixels per inch, pixels por polegada) – Está associado a telas de dispositivos digitais. Cada pixel equivale a um ponto de luz vindo de qualquer monitor, então, a utilidade do PPI é de informar a quantidade de pixels existentes em uma polegada de tela, exatos 2,54cm. ( ) Uma imagem com 300 DPI, por exemplo, equivale a 118,11 PPI, menos da metade do que normalmente é necessário. ( ) DPI (dots per inch, pontos por polegada) – Muito parecido com o PPI, porém, este é para os processos de impressão. Os pixels (unidade virtual) são substituídos por pontos (unidade física). ( ) A regra para resolução de imagem para mídia eletrônica, como e-mail, publicação de imagens na internet, é de 300 DPI e 72 DPI para impressão em gráfica ou laboratório fotográfico. ( ) Para calcular o tamanho máximo possível para que uma fotografia possa ser impressa sem que os pixels ou pontos sejam notados (fiquem granulados, em uma linguagem mais técnica), basta dividir a largura e a altura da imagem (em pixels) por 300. Assinale a sequência correta de cima para baixo.', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'F, F, V, V, V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'V, F, V, F, V.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'F, F, F, F, V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'V, V, F, F, V.', 0);

    -- Questao 41 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q41', N'A _________ de imagens consiste em ______ novos pontos a ela, baseado nos pontos existentes, de modo a ________ assim a sua quantidade total. Na prática, a ________ serve para _______ a imagem, dando apenas a impressão de possuir uma ________ sem, entretanto, aumentar o nível de detalhes. Assinale a alternativa que preencha correta e respectivamente as lacunas.', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Interpolação, diminuir, diminuir, compactação, clarear, resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Compactação, adicionar, diminuir, interpolação, clarear, versão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Preservação, diminuir, aumentar, resolução, embaçar, resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Interpolação, adicionar, aumentar, interpolação, embaçar, resolução.', 1);

    -- Questao 42 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q42', N'Leia atentamente as alternativas abaixo e assinale a INCORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'GIF (Graphics Interchange Format) é um formato de imagem muito comum na Internet. É um arquivo leve e famoso pelas fotografias com movimento (gifs animados). Recomendado para quem precisa espalhar muita imagem na internet, com a vantagem de gerar arquivos de tamanho reduzido, e para quem não está preocupado em enviar imagens com pouca cor, já que o GIF só trabalha com esquema de 256 cores (8 bits), por isso não é muito comum em fotografias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'PNG (Portable Network Graphics). Ao contrário do GIF, o PNG suporta mais cores, não apenas 256, sendo assim, é uma ótima opção para fotos. Surgiu em 1996 e é um concorrente do GIF. Uma característica a mais no PNG é a transparência por 24 imagens de bit RGB.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'RAW (“cru” em inglês) é um padrão em algumas câmeras digitais, mas não é um formato obrigatório, podendo-se escolher entre os padrões JPG ou PNG. É “cru” por não conter aplicação de efeitos ou ajustes. Por causa disso, os arquivos neste padrão não são “puros”, porém oferecem alta qualidade de imagem e menor profundidade de cores, o que permite ao editor a liberdade para utilizar a imagem do jeito como foi capturada e aplicar seus próprios efeitos ou ajustes.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Bitmap pode suportar milhões de cores e preservar os detalhes, porém deixa os arquivos extremamente pesados, pois não utiliza compressão; o formato torna o envio de imagens na internet lento.', 0);

    -- Questao 45 (Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q45', N'ND são filtros de densidade neutra; os comuns ND2, ND4 e ND8 reduzem a quantidade de luz em ambientes muito iluminados. Em fotos de longa exposição, permitem aumentar o tempo de exposição. Sua coloração é:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Amarela.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Verde.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Cinza escuro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Sépia.', 0);

    -- Questao 46 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q46', N'Para fotografar objetos com enquadramentos muito fechados e com bastante nitidez, a lente indicada é:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Macro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Teleobjetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Grande angular.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Olho de peixe.', 0);

    -- Questao 47 (Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q47', N'Com o objetivo de minimizar os reflexos em água, o fotógrafo pode fazer uso de um filtro:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'UV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ND Grad.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Polarizador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Center-spot.', 0);

    -- Questao 48 (Impressão)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q48', N'A publicação de uma imagem requer alta resolução, se esta for para utilização em:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Banner.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Publicação impressa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Monografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Redes Sociais.', 0);

    -- Questao 49 (Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q49', N'Podemos dizer que na fotografia a luz é o diferencial, a chamada “cereja do bolo” e, saber usá-la pode significar um bom resultado final em um trabalho fotográfico. Quase tudo que emite luz pode ser uma fonte de iluminação para uma imagem. I. A luz do sol é natural e se modifica ao longo do dia, em fotografia dizemos que ela está no ambiente e dela faz parte. II. É uma luz fraca (sol), que se modifica durante todo o dia, mas facilmente controlada através do diafragma. III. Uma luz dura é aquela que não incide diretamente no objeto fotografado, criando sombras de difícil correção. IV. A luz suave é aquela que gera sombras sem contornos definidos; dias ensolarados são um bom exemplo deste tipo de luz. V. O Flare é um defeito ótico causado quando o diafragma está com defeito. Assinale a alternativa que apresenta as afirmativas incorretas:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'II, III, IV apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'II, III, IV, V apenas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'III, IV, V apenas.', 0);

    -- Questao 50 (Obturador)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'IBFC 2018 - Câmara de Feira de Santana/BA - Fotógrafo Legislativo - Q50', N'O tempo de exposição mínimo com que se pode fotografar na mão, sem auxílio de tripé, é aquele igual a distância focal da objetiva utilizada. Sendo assim, se o fotógrafo estiver utilizando uma objetiva 50mm, o tempo de exposição mínimo será 1/60. Se a objetiva for 200mm, o tempo mínimo será:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'IBFC', 2018);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'1/30.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'1/125.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'1/160.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'1/250.', 1);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

-- ============================================================
-- Fonte: ACPI 2015 - Prefeitura de Denise/MT - Fotógrafo Municipal
-- ============================================================
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Questao 21 (Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'ACPI 2015 - Prefeitura de Denise/MT - Fotógrafo Municipal - Q21', N'A altura e a direção da luz têm influência decisiva no resultado final da fotografia. A seleção cuidadosa da direção da luz permite destacar objetos importantes e esconder em sombras os que não interessam. A luz direta ou frontal:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'ACPI', 2015);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'É a luz que incide lateralmente sobre o objeto ou sobre o assunto fotografado e que se caracteriza por destacar a textura e a profundidade, ao mesmo tempo em que determina uma perda de detalhes, ao aumentar consideravelmente a longitude das sombras, criando muitas vezes imagens confusas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'É o tipo de luz que reproduz a maior quantidade de detalhes, anulando a textura e achatando o volume da foto.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'É a luz que vem por trás do assunto, convertendo-o em silhueta, perdendo por completo a textura e praticamente todos os detalhes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'É a transição das altas-luzes (áreas claras) para a sombra (áreas escuras).', 0);

    -- Questao 22 (Composição e Enquadramento)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'ACPI 2015 - Prefeitura de Denise/MT - Fotógrafo Municipal - Q22', N'Um dos elementos da linguagem fotográfica são os planos, que se dividem em três grupos principais: plano geral, plano médio e primeiro plano. Assinale a alternativa CORRETA em relação ao primeiro plano.', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'ACPI', 2015);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O ambiente é o elemento primordial.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O sujeito é um elemento dominado pela situação geográfica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Nesse plano, o sujeito ou o assunto fotografado está ocupando boa parte do quadro, deixando espaço para outros elementos que deverão completar a informação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Enquadra o sujeito, dando destaque ao gesto, à emoção, à fisionomia; podendo também ser um plano de detalhe, em que a textura ganha força, a qual pode ser utilizada na criação de fotografias abstratas.', 1);

    -- Questao 23 (Composição e Enquadramento)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'ACPI 2015 - Prefeitura de Denise/MT - Fotógrafo Municipal - Q23', N'Marque V para as afirmativas verdadeiras e F para as falsas. (__) Linhas e formas podem ser usadas para criar imagens abstratas e subjetivas, ou para desviar a atenção do assunto principal de uma fotografia. (__) É por meio da textura que muitas vezes podemos reconhecer o material com o qual foi feito um objeto que aparece em nossa fotografia. (__) As fotografias são bidimensionais, possuem largura e comprimento; e, para conseguir o efeito de profundidade, é preciso que uma terceira dimensão seja introduzida: a perspectiva. Assinale a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'ACPI', 2015);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'V-V-V.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'V-F-V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'F-V-V.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'V-V-F.', 0);

    -- Questao 26 (Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'ACPI 2015 - Prefeitura de Denise/MT - Fotógrafo Municipal - Q26', N'Em uma câmera fotográfica, há uma peça que abre e fecha para a luz entrar; é ela que faz aquele “barulhinho” quando se aperta o botão para fazer a foto. Qual é essa peça?', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'ACPI', 2015);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Obturador.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Filme.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Sensor.', 0);

    -- Questao 27 (Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'ACPI 2015 - Prefeitura de Denise/MT - Fotógrafo Municipal - Q27', N'Estudamos a luz para entender de onde ela vem, que tipo de sombra e que tipo de cores ela gera. Independentemente da cor da luz e de sua fonte, podemos simplificar tudo e classificar a luz em dois tipos: dura e difusa. Assinale a alternativa INCORRETA em relação à luz difusa.', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'ACPI', 2015);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A luz difusa é criada quando a fonte de luz é grande; quanto maior a fonte, mais difusa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A luz difusa gera sombras suaves e com transição gradual entre claro e escuro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Um exemplo de luz difusa é a luz do sol que passa por uma cortina grande de uma janela; o sol é uma fonte pequena, mas, quando ele passa pela cortina, a luz espalha-se, e a fonte de luz passa a ser grande.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Luz difusa é a que gera “sombras duras”, isso é, sombras que não têm transição gradual de claro para escuro, o que cria bastante contraste na imagem.', 1);

    -- Questao 28 (Composição e Enquadramento)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'ACPI 2015 - Prefeitura de Denise/MT - Fotógrafo Municipal - Q28', N'Desde sempre a simetria tem sido utilizada na fotografia para criar composições harmônicas, equilibradas e unas. Imagens simétricas são imagens com lados:', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'ACPI', 2015);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Diferentes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Iguais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Heterogêneos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Tortuosos.', 0);

    -- Questao 29 (Edição de Imagens)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'ACPI 2015 - Prefeitura de Denise/MT - Fotógrafo Municipal - Q29', N'Assinale a alternativa CORRETA: O editor de imagem mais conhecido no mercado é o:', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'ACPI', 2015);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'The Gimp.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Photoplus.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Photoshop.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Photofiltre.', 0);

    -- Questao 30 (Obturador)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'ACPI 2015 - Prefeitura de Denise/MT - Fotógrafo Municipal - Q30', N'Observe a figura abaixo e complete o enunciado com a alternativa CORRETA: O (A) ______________ acontece quando o fotógrafo registra um objeto em movimento, mas faz com que ele pareça imóvel e com que a sensação de velocidade venha do fundo em “movimento”. Assinale a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'ACPI', 2015);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Regra dos terços.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Proporção áurea.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Panning.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Longa exposição.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

-- ============================================================
-- Fonte: VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo
-- ============================================================
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Questao 31 (História da Fotografia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q31', N'Dois anos após o término da Segunda Guerra Mundial, quatro importantes fotógrafos fundaram em Paris uma das mais prestigiosas e influentes Agências de Fotojornalismo. Foram eles, respectivamente: Henri Cartier-Bresson, Robert Capa, David “Chim” Seymour e George Rodger. O enunciado refere-se à Agência', 1,
        (SELECT id FROM temas WHERE nome = N'História da Fotografia'), N'VUNESP', 2016);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'France-Press.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Magnum.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Frame Photo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'World Press Photo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Sipa.', 0);

    -- Questao 32 (História da Fotografia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q32', N'Com circulação nacional e publicada pelos Diários Associados, Assis Chateaubriand lança, em 1928, uma revista de variedades com publicação semanal. A publicação tornou-se um dos mais influentes veículos de comunicação de massa que o país já havia conhecido. No início da década de 1940, ela incorporou o modelo da fotorreportagem, tornando-se pioneira na implantação do fotojornalismo no Brasil. O enunciado refere-se à Revista', 1,
        (SELECT id FROM temas WHERE nome = N'História da Fotografia'), N'VUNESP', 2016);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Caras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Manchete.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Fatos & Fotos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Cruzeiro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Pasquim.', 0);

    -- Questao 33 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q33', N'Nos 30 anos que se seguiram ao fim da Segunda Guerra Mundial, grandes empresas como a Kodak (USA), Fuji (Japão) e Agfa-Gevaert (Alemanha) lançaram no mercado métodos novos e simplificados de fotografia colorida. No processo fotográfico fotoquímico, o que diferencia a emulsão do negativo em cores daquela em branco e preto é a', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'VUNESP', 2016);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'presença em camadas sobrepostas de pigmentos corantes para as três cores primárias subtrativas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ausência de camadas de pigmentos na emulsão do negativo e a presença de pigmentos no positivo após o processo de revelação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ausência de haletos de prata presentes somente na emulsão em branco e preto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substituição dos grãos de prata sensíveis à luz por diodos fotoelétricos capazes de processar as informações de cor oriundas do espectro visível.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substituição, nas camadas da emulsão, de pigmentos corantes para as três cores primárias subtrativas por corantes para as três cores primárias aditivas.', 0);

    -- Questao 34 (Edição de Imagens)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q34', N'A palavra contraste pode ter diversas conotações em função da temática na qual ela está sendo inserida. No que diz respeito à “imagem fotográfica”, o conceito de contraste está relacionado', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', 2016);
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

    -- Questao 35 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q35', N'Em fotografia digital, o número de pixels de um sensor corresponde', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'VUNESP', 2016);
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

    -- Questao 36 (Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q36', N'Grande parte dos equipamentos de flash profissional tem cabeças que giram e se inclinam, permitindo direcionar o feixe luminoso contra paredes ou tetos, utilizando sobre o motivo iluminação rebatida. Em tais situações, é preciso observar que, ao inclinar o flash,', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'VUNESP', 2016);
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

    -- Questao 39 (Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q39', N'Nas câmeras SRL (single lens reflex), a imagem é formada sobre uma emulsão fotoquímica gerando a imagem latente; nas câmeras DSLR (digital single lens reflex), a emulsão fotoquímica foi substituída pelo', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'VUNESP', 2016);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'LCD (liquid crystal display).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'despolido.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'cartão de memória.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'view-finder.', 0);

    -- Questao 41 (Composição e Enquadramento)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q41', N'Uma técnica de composição de enquadramento com que os artistas visuais estão familiarizados é a ideia de que os elementos significativos serão colocados ao longo de linhas imaginárias que dividem a imagem tanto horizontalmente, quanto verticalmente. Elementos de particular interesse poderão ser colocados na intersecção dessas linhas, para criar uma composição mais expressiva e dinâmica. Esta técnica é chamada de', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'VUNESP', 2016);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Regra dos Quadriláteros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Regra dos Terços.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Regra dos Nonos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Regra dos Retângulos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Regra das Quatro Linhas.', 0);

    -- Questao 42 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q42', N'Na objetiva fotográfica, uma vez montada em uma câmera, a distância entre o Ponto Nodal, ou Ponto de Convergência, e o Sensor determina a', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'VUNESP', 2016);
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

    -- Questao 43 (História da Fotografia)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q43', N'No estudo da semiologia da imagem, entende-se que a fotografia recolhe em si, a serviço da representação, três significados conexos. São eles:', 1,
        (SELECT id FROM temas WHERE nome = N'História da Fotografia'), N'VUNESP', 2016);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'cognitivo, psicológico e cultural.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'analógico, digital e eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'luz, sombra e transparência.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'cor, brilho e contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'exposição normal, sobrexposição e subexposição.', 0);

    -- Questao 45 (Edição de Imagens)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q45', N'Define-se Editoração Gráfica como', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'VUNESP', 2016);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o processo de catalogação e fichamento de livros e periódicos para consulta em bibliotecas públicas e privadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o processo de finalização de textos e imagens com o auxílio de programas de computação que, posteriormente, serão utilizados na impressão de livros e periódicos.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a veiculação de livros e periódicos em forma de fascículos colecionáveis e, posteriormente, levados à encadernação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a colorização de material fotográfico, originalmente registrado em preto e branco, inviável à impressão de livros infantis e fotonovelas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a eliminação de imagens nas publicações de baixo orçamento, traduzindo-as em textos explicativos e de fácil compreensão.', 0);

    -- Questao 46 (Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q46', N'Entre inúmeros filtros disponíveis no mercado, aquele utilizado para atenuar a intensidade luminosa da cena em prol de uma correta exposição sem alteração do tempo de exposição, da abertura do diafragma e da temperatura de cor, é o filtro', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'VUNESP', 2016);
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

    -- Questao 47 (Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q47', N'Observe as imagens a seguir. Em fotografia, as condições de foco e desfoco entre os assuntos dispostos no enquadramento caracterizam diferentes resultados estéticos. No que diz respeito à “profundidade de campo”, a alteração de quais recursos determinam diferentes resultados?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'VUNESP', 2016);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A distância focal da objetiva, a temperatura de cor e a sensibilidade do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O tempo de exposição, a abertura do diafragma e a sensibilidade do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A distância focal da objetiva, a abertura do diafragma e a área do sensor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O tempo de exposição, o formato wide-screen e a abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A velocidade do obturador, a sensibilidade do sensor e a distância focal da objetiva.', 0);

    -- Questao 49 (Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'VUNESP 2016 - Câmara Municipal de Marília/SP - Fotógrafo Legislativo - Q49', N'Observe o esquema a seguir e assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'VUNESP', 2016);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Trata-se do “triângulo da exposição”, no qual o ISO representa o número de pixels dispostos na superfície sensível; o diafragma, o diâmetro da abertura por onde passam os raios luminosos; e o tempo de exposição, o tempo necessário à revelação do fotograma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Trata-se do “triângulo da exposição”, no qual o ISO representa a escala de amostragem cromática da imagem; o diafragma, a velocidade do obturador; e o tempo de exposição, o tempo de validade da emulsão fotoquímica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Trata-se do “triângulo da exposição”, no qual o ISO representa o nível de sensibilidade para imagens em cor, enquanto a ASA o mesmo valor para imagens em preto e branco; o diafragma, a área de abertura do obturador; e o tempo de exposição, o tempo de lampejo do flash.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Trata-se do “triângulo da exposição”, no qual o ISO representa a área útil do sensor; o diafragma, o ângulo de enquadramento da objetiva; e o tempo de exposição, o intervalo de tempo, no qual cada pixel transforma em código binário a informação luminosa recebida.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Trata-se do “triângulo da exposição”, no qual o ISO representa o nível de sensibilidade da superfície sensível; o diafragma, o diâmetro da abertura por onde passam os raios luminosos; e o tempo de exposição, o intervalo de tempo em que a superfície sensível recebe a informação luminosa.', 1);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

-- ============================================================
-- Fonte: Instituto ADM&TEC 2023 - Timbaúba/PE - Fotógrafo (A)
-- ============================================================
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Questao 1 (Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2023 - Timbaúba/PE - Fotógrafo (A) - Q01', N'Analise as afirmativas a seguir: I. Nas câmeras fotográficas DSLR, uma objetiva é formada por um conjunto de lentes, sendo responsável por captar a imagem, direcionando a luz até o sensor ou filme. II. Diafragma é um dispositivo da câmera que regula a passagem de luz até o interior da câmera, cujo nível de abertura é diretamente proporcional ao nível de profundidade de campo alcançada. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'Instituto ADM&TEC', 2023);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é a falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 2 (Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2023 - Timbaúba/PE - Fotógrafo (A) - Q02', N'Analise as afirmativas a seguir: I. O Sistema de enfoque de uma objetiva é responsável por regular a nitidez de uma fotografia, aproximando ou distanciando a objetiva do sensor ou filme da câmera. II. O obturador é um dispositivo que regula por quanto tempo o diafragma permanece aberto durante a captação de luz para a fotografia. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'Instituto ADM&TEC', 2023);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é a falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 6 (Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2023 - Timbaúba/PE - Fotógrafo (A) - Q06', N'Analise as afirmativas a seguir: I. Em sensores full frame existe um fator de corte, consistindo de uma ampliação da distância focal em 1,2x em relação à objetiva utilizada. II. Em câmeras digitais DSLR, com sensor fotográfico tipos APS-C e APS-H, é gerado um fator de corte, provocando uma ampliação na distância focal em objetivas para sensor full frame. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'Instituto ADM&TEC', 2023);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é a falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 7 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2023 - Timbaúba/PE - Fotógrafo (A) - Q07', N'Analise as afirmativas a seguir: I. Teleobjetivas possuem uma distância focal longa, sendo bastante utilizadas quando o objeto fotográfico se encontra muito distante da câmera, de modo que toda teleobjetiva possui sistema de zoom. II. Objetivas macro, também conhecidas como fisheye, possuem uma grande abrangência angular e são utilizadas para fotografar em áreas com pouco espaço para afastar a câmera, ampliando o enquadramento. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Instituto ADM&TEC', 2023);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é a falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 1);

    -- Questao 8 (Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2023 - Timbaúba/PE - Fotógrafo (A) - Q08', N'Analise as afirmativas a seguir: I. SLR é uma sigla para Single Lens Reflex, de modo que nessas câmeras o sistema de captura não capta a mesma imagem do sistema de visualização. II. As câmeras DSLR, versões digitais das analógicas SLR, possuem objetivas específicas em versão digital, assim, não é possível aproveitar as lentes das câmeras SLR nas DSLR. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'Instituto ADM&TEC', 2023);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é a falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 1);

    -- Questao 9 (Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2023 - Timbaúba/PE - Fotógrafo (A) - Q09', N'Analise as afirmativas a seguir: I. O para-sol é um equipamento acoplado à objetiva, tendo a função de barrar a entrada de luzes e reflexos indesejáveis que afetam o contraste das fotos, servindo também para proteger a lente dos raios UV. II. O filtro polarizador para objetivas é utilizado para eliminar os raios de sol que refletem em partículas suspensas no ar, melhorando o contraste das fotografias. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'Instituto ADM&TEC', 2023);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é a falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 11 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2023 - Timbaúba/PE - Fotógrafo (A) - Q11', N'Analise as afirmativas a seguir: I. Quando o obturador de uma câmara se abre, ele deixa passar a luz que é regulada pelo diafragma para chegar a um elemento fundamental: o sensor. II. O sensor é um dispositivo cheio de elementos sensíveis à luz, conhecidos como pixels. Eles se organizam em linhas verticais e horizontais e, quando há juntos um milhão de pixels, tem-se o que se chama de megapixel. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'Instituto ADM&TEC', 2023);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é a falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 12 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2023 - Timbaúba/PE - Fotógrafo (A) - Q12', N'Analise as afirmativas a seguir: I. O CFexpress é um padrão moderno para cartões de mídia removíveis, ele usa a interface de conexão PCI-E 3.0, com até 4 canais, de modo que até 5GB/s pode ser fornecido por canal. II. Cartões Secure Digital são os mais comuns nas câmeras DSLR atuais, cujos tipos compreendem o SD, SDHC, SDXC e SDUC. III. Os cartões Compact Flash compreendem uma tecnologia mais antiga em câmeras DSLR profissionais, cuja versão mais recente é a CFast, com maiores taxas de transferência de dados. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'Instituto ADM&TEC', 2023);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Todas as afirmativas estão corretas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Nenhuma afirmativa está correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas uma afirmativa está correta.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas duas afirmativas estão corretas.', 0);

    -- Questao 13 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2023 - Timbaúba/PE - Fotógrafo (A) - Q13', N'Analise as afirmativas a seguir: I. Um arquivo RAW contém os dados brutos de uma imagem, capturados pelos sensores de uma câmera digital, comprimidos com codecs de altíssima qualidade, sendo equivalentes aos negativos dos filmes utilizados na fotografia analógica. II. Existem várias extensões de arquivos RAW, como DNG, CRW, CR2, 3FR, NEF, RW2 e BRAW, levando em consideração que cada fabricante costuma possuir um formato padrão. III. Existem vários softwares para manipulação de arquivos RAW, entre eles o Adobe Lightroom, Microsoft Photos, Raw Power e Darktable. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'Instituto ADM&TEC', 2023);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Todas as afirmativas estão corretas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Nenhuma afirmativa está correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas uma afirmativa está correta.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas duas afirmativas estão corretas.', 0);

    -- Questao 14 (Luz)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2023 - Timbaúba/PE - Fotógrafo (A) - Q14', N'Analise as afirmativas a seguir: I. A luz é uma forma de energia que se desloca em linha reta no vácuo, a uma velocidade de 300.000 km/s. II. A luz é composta por uma série de quantidades indivisíveis de energia chamada de Fóton, sendo uma partícula elementar, já que não possui uma subestrutura. III. A luz não transfere um fluxo constante de energia, ela transfere sua energia em quantidades bem definidas, diretamente proporcionais à sua frequência. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Luz'), N'Instituto ADM&TEC', 2023);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Todas as afirmativas estão corretas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Nenhuma afirmativa está correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas uma afirmativa está correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas duas afirmativas estão corretas.', 0);

    -- Questao 15 (Obturador)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2023 - Timbaúba/PE - Fotógrafo (A) - Q15', N'Analise as afirmativas a seguir: I. Lightpaint é uma técnica que produz pinturas de luz na fotografia, consistindo de uma intervenção artística baseada na emissão de luz, através de lanternas mesclada à longa exposição, não sendo possível sua criação em softwares de edição. II. A fotografia de longa exposição consiste na ampliação do tempo de captura da fotografia, sendo impreterível que o diafragma da objetiva esteja em sua abertura máxima. III. Bokeh é um efeito visual que propõe na fotografia uma profundidade de campo profunda e focada, deixando o objeto principal do primeiro plano em evidência, para sua produção, sendo impreterível que o diafragma da objetiva esteja em sua abertura máxima. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'Instituto ADM&TEC', 2023);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Todas as afirmativas estão corretas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Nenhuma afirmativa está correta.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas uma afirmativa está correta.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Apenas duas afirmativas estão corretas.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

-- ============================================================
-- Fonte: Instituto ADM&TEC 2020 - Gravatá/PE - Fotógrafo (A)
-- ============================================================
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Questao 1 (Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2020 - Gravatá/PE - Fotógrafo (A) - Q01', N'Analise as afirmativas a seguir: I. Existe uma relação entre o obturador e a sensibilidade ISO. Os sensores de alto ISO necessitam de menos luz, logo maior é a velocidade do obturador (1/500). Os sensores de baixo ISO necessitam de mais luz, logo menor é a velocidade do obturador (1/60). II. Ao selecionar uma lente objetiva, o fotógrafo é impedido de definir as características da perspectiva, da profundidade de campo, da composição e do enquadramento. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'Instituto ADM&TEC', 2020);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 12 (ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2020 - Gravatá/PE - Fotógrafo (A) - Q12', N'Analise as afirmativas a seguir: I. Em geral, as máquinas têm a opção de escolha automática para o ISO. Mas, para fotos internas com pouca luminosidade, é importante aumentar o ISO para que o tempo de exposição seja possível de ser realizado sem tripé. II. A sigla SLR significa Single Lens Reflex, em inglês, e se refere às câmeras que usam um prisma e um jogo de espelhos para a captura da imagem, além de permitir o intercâmbio de lentes e filtros, possibilitando uma maior qualidade das fotos. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'Instituto ADM&TEC', 2020);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 13 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2020 - Gravatá/PE - Fotógrafo (A) - Q13', N'Analise as afirmativas a seguir: I. A distância focal, medida em milímetros, é a distância entre o centro ótico da lente e o sensor da câmera. Essa é uma informação importante para classificar as lentes. II. O ISO mede a sensibilidade do sensor ou filme à luz. Quanto maior for o valor do ISO, mais sensível será o sensor. Normalmente, em cenários ou espaços com pouca luz, devemos usar um ISO de valor mais elevado para compensar a falta de luz. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'Instituto ADM&TEC', 2020);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 14 (ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2020 - Gravatá/PE - Fotógrafo (A) - Q14', N'Analise as afirmativas a seguir: I. Quando temos demasiada luz, devemos usar um valor ISO mais baixo. No entanto, devemos ter um especial cuidado quando selecionamos o valor do ISO porque, se tratando de um elemento de sensibilidade, ele poderá provocar algum ruído nas fotografias. II. As lentes objetivas com distâncias focais inferiores a aproximadamente 40 mm são consideradas grande angular, pois oferecem um amplo campo de visão, ou seja, com seu uso, podemos enquadrar grandes áreas a uma curta distância. As lentes são indispensáveis para fotografias em locais fechados, como festas. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'Instituto ADM&TEC', 2020);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 15 (Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2020 - Gravatá/PE - Fotógrafo (A) - Q15', N'Analise as afirmativas a seguir: I. O balanço de brancos permite controlar a luz que entra na câmera fotográfica. Ou seja, a temperatura da cor. Atualmente, a maior parte das câmeras fotografias, sejam elas digitais ou reflex, possuem um programa automático de controle do balanço de brancos. II. Em uma câmera, depois da resolução, o fator mais importante a ser levado em consideração é a lente. Para tirar boas fotos, a câmera deve ter lentes de qualidade, o que significa que devem ser feitas de plástico, nada de vidro. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Instituto ADM&TEC', 2020);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 16 (Composição e Enquadramento)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2020 - Gravatá/PE - Fotógrafo (A) - Q16', N'Analise as afirmativas a seguir: I. Desfocando, propositalmente, certas regiões da foto, o fotógrafo consegue induzir o cérebro do espectador a pensar que um objeto está mais distante que outro e recriar assim uma sensação unidimensional. II. Ao contrário de uma composição na horizontal, a composição na vertical é uma composição alta e estreita que realça um panorama vertical. É também uma imagem que apenas pode ser captada quando se ergue a cabeça e se olha para cima. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'Instituto ADM&TEC', 2020);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 17 (Obturador)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2020 - Gravatá/PE - Fotógrafo (A) - Q17', N'Analise as afirmativas a seguir: I. O obturador é uma espécie de cortina que protege a câmera da luz, que, quando acionado, abre o disparador, permitindo que a luz atinja o CCD ou o sensor. Quanto mais tempo aberto, mais luz entra. A velocidade do obturador é um dos fatores utilizados para alterar o resultado final de uma fotografia pelo fotógrafo. II. A profundidade de campo é um efeito que descreve até que ponto objetos que estão mais próximos ou mais distantes do plano de foco aparentam estar nítidos. Ela é medida pelos tons de verde na imagem. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'Instituto ADM&TEC', 2020);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 18 (ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2020 - Gravatá/PE - Fotógrafo (A) - Q18', N'Analise as afirmativas a seguir: I. O ruído é o termo que se usa para denominar os pontilhados e aberrações de cores que tornam a fotografia menos nítida. Trata-se de pequenos pontos luminosos que dão a ideia de granulado, pouca definição e são gerados pela instabilidade do sensor ISO. II. A estabilização de imagem é um recurso muito útil que aumenta o número de imagens falhas e tremidas, que pode ser instalado no próprio corpo da câmera ou nas lentes. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'Instituto ADM&TEC', 2020);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 19 (Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2020 - Gravatá/PE - Fotógrafo (A) - Q19', N'Analise as afirmativas a seguir: I. O obturador é um dispositivo eletromecânico situado no corpo da máquina fotográfica, após o diafragma, e que controla o tempo de duração restante da bateria ou da pilha. II. A fotometria, na fotografia, é o processo de medir a luz refletida para dentro da câmera através do fotômetro e ajustar seus valores através dos dispositivos diafragma e obturador, de forma a captar uma imagem gravada com qualidade, em uma superfície fotossensível. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'Instituto ADM&TEC', 2020);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    -- Questao 22 (Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Instituto ADM&TEC 2020 - Gravatá/PE - Fotógrafo (A) - Q22', N'Analise as afirmativas a seguir: I. Nas câmeras reflex, é possível controlar manualmente o balanço de brancos, conferindo, assim, uma imagem mais genuína às fotografias. De acordo com o objetivo e o gosto pessoal do fotógrafo, é possível “aquecer” ou “esfriar” o balanço de cores da imagem, conferindo-lhe tonalidades diferentes. II. As lentes zoom possuem distância focal fixa e única, sendo por isso muito versáteis e práticas por nos possibilitar fazer vários tipos de enquadramento com um único equipamento. Marque a alternativa CORRETA:', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'Instituto ADM&TEC', 2020);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas afirmativas são verdadeiras.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A afirmativa I é verdadeira, e a II é falsa.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'A afirmativa II é verdadeira, e a I é falsa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As duas afirmativas são falsas.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

-- ============================================================
-- Fonte: SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I
-- ============================================================
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Questao 21 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q21', N'A sensibilidade de um filme fotográfico afeta diretamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'SANEPAR', 2005);
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

    -- Questao 22 (Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q22', N'O uso do diafragma afeta diretamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'SANEPAR', 2005);
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

    -- Questao 23 (Obturador)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q23', N'A utilização do obturador afeta diretamente:', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'SANEPAR', 2005);
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

    -- Questao 24 (Fotometria)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q24', N'O fotômetro é utilizado para medir a:', 1,
        (SELECT id FROM temas WHERE nome = N'Fotometria'), N'SANEPAR', 2005);
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

    -- Questao 25 (Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q25', N'Quais são as unidades com as quais identificamos, respectivamente, a sensibilidade do filme, a abertura do diafragma e a velocidade do obturador?', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'SANEPAR', 2005);
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

    -- Questao 26 (Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q26', N'Para as questões 26 a 29, deve-se considerar as seguintes escalas: Abertura: 1.4 – 2 – 2.8 – 4 – 5.6 – 8 – 11 – 16 – 22. Velocidade: 1 – 1/2 – 1/4 – 1/8 – 1/15 – 1/30 – 1/60 – 1/125 – 1/250 – 1/500 – 1/1000. Uma foto com ISO 400 utilizou 1/500 e f:16. Para se fazer a mesma foto utilizando-se filme ISO 100, com a mesma velocidade, deve-se:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'SANEPAR', 2005);
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

    -- Questao 27 (Triângulo de Exposição)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q27', N'Uma foto com ISO 100 utilizou 1/125. Para se fazer a mesma foto, utilizando-se ISO 400, deve-se:', 1,
        (SELECT id FROM temas WHERE nome = N'Triângulo de Exposição'), N'SANEPAR', 2005);
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

    -- Questao 28 (Obturador)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q28', N'Uma fotografia foi feita com f:8 e 1/60. Se a abertura for mantida, qual será o tempo dado para uma foto feita com quatro vezes mais luz ambiente?', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'SANEPAR', 2005);
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

    -- Questao 29 (Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q29', N'Uma fotografia foi feita com abertura 8 e 1/125. Se a velocidade for mantida, qual será a abertura utilizada para uma foto feita com quatro vezes menos luz ambiente?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'SANEPAR', 2005);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'16.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'2.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'5.6.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'11.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'4.', 1);

    -- Questao 30 (Flash)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q30', N'Sobre o flash eletrônico, é correto afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'Flash'), N'SANEPAR', 2005);
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

    -- Questao 31 (Impressão)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q31', N'Desejando-se maior definição de detalhes em uma imagem fotográfica, sua cópia pode ser feita:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'SANEPAR', 2005);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'em papel de superfície fosca.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'em papel de superfície brilhante.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'em papel com qualquer tipo de superfície.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a partir do processamento em preto e branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a partir da digitalização da imagem analógica original.', 0);

    -- Questao 32 (Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q32', N'Para se corrigir a distorção de cor em uma foto com filme para luz do dia (day light) sob uma fonte de luz incandescente deve-se usar um filtro:', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'SANEPAR', 2005);
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

    -- Questao 33 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q33', N'Ao se analisar, em um computador, uma pasta que contém arquivos de imagens, pode-se ter alguma ideia das dimensões e/ou da qualidade dessas imagens:', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'SANEPAR', 2005);
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

    -- Questao 34 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q34', N'Considerando-se somente os diversos tamanhos (em bytes) em que pode ser salva uma mesma fotografia, qual deles pode ser melhor empregado para uma impressão de grandes dimensões e alta qualidade?', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'SANEPAR', 2005);
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

    -- Questao 35 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q35', N'Para uma transmissão rápida, via Internet, é desejável que uma imagem fotográfica tenha:', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'SANEPAR', 2005);
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

    -- Questao 36 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q36', N'Em relação aos “pixels por polegada” (ppi) de uma imagem fotográfica, é correto afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'SANEPAR', 2005);
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

    -- Questao 37 (Impressão)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q37', N'Uma impressão fotográfica de grandes dimensões é melhor obtida por um arquivo de:', 1,
        (SELECT id FROM temas WHERE nome = N'Impressão'), N'SANEPAR', 2005);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior tamanho (em bytes) e alta resolução.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'maior tamanho (em bytes) e baixa resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'menor tamanho (em bytes) e alta resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'menor tamanho (em bytes) e baixa resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'qualquer tamanho (em bytes) ou resolução.', 0);

    -- Questao 38 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q38', N'Em relação à câmera fotográfica digital, é correto afirmar:', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'SANEPAR', 2005);
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

    -- Questao 40 (Edição de Imagens)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'SANEPAR 2005 - Companhia de Saneamento do Paraná - Fotógrafo I - Q40', N'Uma foto digital de uma determinada cena apresentou pouca diferença entre suas áreas claras e escuras. Desejando-se corrigir essa diferença, um programa de tratamento de imagens deve:', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'SANEPAR', 2005);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar o brilho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'diminuir o brilho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'aumentar o contraste.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'diminuir o contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'alterar ou diminuir a saturação das cores.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

-- ============================================================
-- Fonte: CEBRASPE 2023/2024 - ITAIPU Binacional - Repórter Fotográfico
-- ============================================================
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Questao 28 (Edição de Imagens)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'CEBRASPE 2023/2024 - ITAIPU Binacional - Repórter Fotográfico - Q28', N'Assinale a opção que apresenta dois dos softwares de edição e tratamento de imagem mais utilizados de modo profissional, seja pela gama de efeitos disponíveis, seja pela facilidade de manejo e personalização, geralmente com adesão financeira.', 1,
        (SELECT id FROM temas WHERE nome = N'Edição de Imagens'), N'CEBRASPE', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'AutoCad e CorelDraw.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Adobe Photoshop e Corel PaintShop.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Befunky e Paint 3D.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Afterlight e Adobe After Effects.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Cap Cut e PhotoWonder.', 0);

    -- Questao 30 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'CEBRASPE 2023/2024 - ITAIPU Binacional - Repórter Fotográfico - Q30', N'Tendo em vista que, em programas de edição de imagens e sistemas de armazenamento, a escolha do formato de arquivo determina a qualidade e o tamanho da imagem que será salva, assinale a opção que apresenta apenas formatos de arquivos de fotografia digital.', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'CEBRASPE', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'JPG, TIFF, PNG, RAW.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'PNG, WAV, TIFF, PDF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'JPG, VHS, AVI, RAW.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'TIFF, PNG, AVI, WAV.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'AVI, TIFF, PDF, WAV.', 0);

    -- Questao 31 (Composição e Enquadramento)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'CEBRASPE 2023/2024 - ITAIPU Binacional - Repórter Fotográfico - Q31', N'Tendo em vista que os elementos fotográficos que permitem a construção e a captura da imagem podem representar e caracterizar a linguagem fotográfica, assinale a opção correta acerca de tais elementos.', 1,
        (SELECT id FROM temas WHERE nome = N'Composição e Enquadramento'), N'CEBRASPE', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Plano refere-se ao distanciamento da câmara em relação ao objeto, sem contemplar o arranjo dos elementos de cena no enquadramento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Foco possibilita manipular o tamanho da imagem, mas não permite controlar sua nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Composição corresponde à organização visual dos elementos, fruto da influência mútua dos componentes visuais.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Equilíbrio não tem relação com a composição em si, mas, sim, com a capacidade do fotógrafo de manter-se em equilíbrio no ambiente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Iluminação permite destacar um elemento em detrimento de outros, mas não acrescentar aspecto subjetivo, podendo, ainda, diminuir as possibilidades de interligação entre elementos da linguagem.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

-- ============================================================
-- Fonte: UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo
-- ============================================================
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- Questao 21 (Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q21', N'O equipamento necessário para garantir a estabilidade da câmera durante a captura de imagens em situações fotográficas, como longa exposição, retratos e paisagens, é o', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'filtro polarizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'visor da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'tripé.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'filtro ND.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'disparador remoto.', 0);

    -- Questao 22 (Obturador)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q22', N'Na maioria das câmeras, o obturador fica perto do plano do filme (obturador de plano focal), mas ele também pode estar embutido entre os elementos da objetiva (obturador central ou de lâmina, utilizado principalmente nas câmeras de estúdio). O obturador, em uma câmera fotográfica convencional, trabalha como uma cortina que se abre e fecha, determinando como o sensor da câmera será exposto à luz proveniente da cena. Sua função é', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ajustar a sensibilidade ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'controlar a abertura da lente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'focar automaticamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'medir a exposição da cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'controlar o tempo de exposição da imagem.', 1);

    -- Questao 23 (Tipos de Luzes)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q23', N'Se há uma coisa com a qual quase todos os fotógrafos concordam é que a fotografia se trata de capturar a luz. O modo como seu assunto está iluminado é crucial para o sucesso de qualquer foto. A descrição da luz suave e difusa que ocorre em um ambiente sombreado ou em dias nublados, criando uma iluminação uniforme e sem sombras intensas, é conhecida por um termo específico. Qual é o termo utilizado para descrever essa iluminação uniforme e sem sombras intensas?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Luzes'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Luz contrária.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Luz ambiente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Luz dura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Luz frontal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Luz de preenchimento.', 0);

    -- Questao 24 (Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q24', N'A temperatura de cor é expressa por meio de uma unidade de medida específica na fotografia, indicando se a luz apresenta tonalidades mais quentes (amareladas) ou mais frias (azuladas). Qual é a unidade de medida utilizada para expressar a temperatura de cor?', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Megapixel.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Lux.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Kelvin.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'F-stop.', 0);

    -- Questao 25 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q25', N'A utilização de uma lente grande angular, em uma câmera fotográfica DSLR (Digital Single-Lens Reflex), pode ter diversos efeitos notáveis na composição de uma imagem. O principal efeito causado é', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a distorção de perspectiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a compressão da cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o bokeh pronunciado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a ampliação de objetos distantes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o aumento da profundidade de campo.', 0);

    -- Questao 26 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q26', N'Nos materiais fotossensíveis tradicionais, como filmes fotográficos, um componente sensível à luz desempenha um papel crucial na captura de imagens na fotografia convencional. O componente sensível à luz utilizado durante esse processo de captura de imagens é', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o acrílico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o poliestireno.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o polietileno.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o silício.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a emulsão de prata.', 1);

    -- Questao 27 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q27', N'Ainda que o mundo seja visto em cores, cada vez mais fotógrafos optam por criar suas imagens em preto e branco. Alguns temas funcionam melhor que outros quando registrados dessa forma. Ao retirar as cores, uma fotografia passa a depender de outros elementos de composição para chamar a atenção: luz e sombra, formas, linhas ou volumes. A produção de imagens em preto e branco envolve um método específico, conhecido por um termo característico. Esse processo fotográfico é chamado de', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Fotografia infravermelha.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Fotografia monocromática.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Separação de cores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Processo C-41.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Polaroid.', 0);

    -- Questao 28 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q28', N'O uso de produtos químicos nos laboratórios fotográficos esbarra na questão da preservação ambiental. Em tese, tais produtos não poderiam ser jogados pelo ralo nas redes de esgotos sem o devido tratamento. É bom que se saiba que a maioria dos produtos usados nos laboratórios fotográficos é solúvel em água, o que os torna menos agressivos ao meio ambiente comparativamente a outras substâncias, como ácido sulfúrico, mercúrio ou chumbo. No contexto da fotografia convencional, a fase do processo que envolve a imersão do filme em substâncias químicas para transformar a imagem latente em uma imagem visível é a', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'fixação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'impressão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'revelação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'digitalização.', 0);

    -- Questao 29 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q29', N'A fotografia macro é uma técnica que se concentra em capturar imagens extremamente ampliadas de objetos pequenos, revelando detalhes minuciosos que muitas vezes não são visíveis a olho nu. Ao fotografar em escala macro, torna-se necessário efetuar ajustes nas configurações da câmera para superar o problema de', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'profundidade de campo limitada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'dificuldade no foco automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'exposição insuficiente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'exposição excessiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'distorção de cor.', 0);

    -- Questao 30 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q30', N'Quando realizamos ampliações fotográficas, é crucial atentar para uma configuração fundamental, que preserva a qualidade da imagem, evitando a perda de detalhes. Qual é a configuração que deve ser observada?', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Resolução do monitor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Redução de abertura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Alta resolução do arquivo original.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Alta velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Elevação do ISO.', 0);

    -- Questao 31 (Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q31', N'O filtro óptico é um componente transparente ou semitransparente que é colocado na frente da lente de uma câmera fotográfica para modificar a qualidade da luz que atinge o sensor ou filme. Existem diversos tipos de filtros ópticos, cada um projetado para cumprir funções específicas na captura de imagens. O filtro óptico, que é comumente utilizado para corrigir tons indesejados em fotografias preto e branco, especialmente em cenas com céu e nuvens, é chamado de', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'filtro infravermelho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'filtro de correção de cor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'filtro de densidade neutra.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'filtro de densidade ajustada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'filtro graduado.', 0);

    -- Questao 32 (Sensor e Fator de Corte)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q32', N'A popularização e a melhoria constante da qualidade das câmeras digitais contribuíram para a transição gradual do uso predominante de câmeras analógicas para digitais. Desde então, as câmeras digitais evoluíram significativamente em termos de resolução, recursos e acessibilidade. Nesse contexto de evolução das câmeras digitais, qual componente específico passou a ser responsável pela conversão da luz em sinais elétricos para realizar o processamento digital?', 1,
        (SELECT id FROM temas WHERE nome = N'Sensor e Fator de Corte'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Flash embutido.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Visor óptico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Processador de zoom.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Monitor de LCD.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Sensor de imagem.', 1);

    -- Questao 33 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q33', N'Ao comparar câmeras fotográficas digitais e convencionais, uma diferença significativa na captura de imagens está relacionada a um aspecto específico. A diferença importante na captura de imagens entre câmeras fotográficas digitais e convencionais está no', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'método de armazenamento de imagens.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'mecanismo de foco automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'processo de exposição à luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'tipo de lente utilizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'sistema de obturador.', 0);

    -- Questao 34 (Obturador)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q34', N'Saber controlar o obturador em uma câmera fotográfica DSLR (Digital Single-Lens Reflex) é uma habilidade essencial, que impacta diretamente na qualidade do registro fotográfico digital, possibilitando explorar a criatividade e a obtenção de imagens bem expostas e visualmente impactantes. A função do obturador é', 1,
        (SELECT id FROM temas WHERE nome = N'Obturador'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'focar automaticamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ajustar a sensibilidade do ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar a exposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'determinar a abertura da lente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'armazenar imagens no cartão de memória.', 0);

    -- Questao 35 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q35', N'A evolução da fotografia digital foi marcada por avanços significativos desde o seu surgimento nas décadas de 1970 e 1980. No final dos anos de 1980, a fotografia digital passou a ter um grande aliado para a padronização do formato e armazenamento de imagens. O que a sigla JPEG significa?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Java Photo Editing Graphics.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Jittery Pixel Extraction Guide.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Jumbo Photo Enhancement Grid.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Joint Photographic Experts Group.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Justified Pixel Enhancement Graphics.', 0);

    -- Questao 36 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q36', N'Os equipamentos para a captura de imagens na fotografia digital passaram por uma evolução significativa, permitindo a captação de mais detalhes e a geração de fotografias com maior nitidez. Esse avanço está diretamente relacionado à resolução, termo que se refere', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'à capacidade de zoom da lente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'à densidade de pixels em uma imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à profundidade de campo da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao equilíbrio de branco ajustado na câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'à quantidade de luz capturada pela câmera.', 0);

    -- Questao 37 (Modos da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q37', N'Na utilização de uma câmera digital, o modo que permite ao fotógrafo ter controle total sobre configurações como a abertura do diafragma, velocidade do obturador e ISO é o modo', 1,
        (SELECT id FROM temas WHERE nome = N'Modos da Câmera'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'paisagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'pré-programas (“Scene”).', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'retrato.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'manual.', 1);

    -- Questao 38 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q38', N'Após uma sessão de fotos realizadas através de uma câmera digital, na etapa de edição das imagens, o fotógrafo precisa observar com atenção um ajuste que afeta diretamente a quantidade de pixels e, portanto, a resolução da imagem. Esse ajuste se refere ao', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'redimensionamento.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'contraste.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'controle de nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ajuste de brilho.', 0);

    -- Questao 39 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q39', N'No ambiente digital, a autenticidade das imagens é uma preocupação importante devido à possibilidade de manipulações. Diversas soluções tecnológicas foram desenvolvidas para garantir a integridade e autenticidade das imagens digitais. Qual é a solução tecnológica que contribui significativamente para garantir a autenticidade das imagens digitais, tornando-as mais seguras contra manipulações?', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Compressão JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Redução de resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Marca d’água digital.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Camadas no Photoshop.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Conversão para preto e branco.', 0);

    -- Questao 40 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q40', N'Existem vários formatos de armazenamento de imagem, cada um com suas características específicas, adequados para diferentes finalidades. O formato de armazenamento de imagem que preserva a qualidade sem compressão, utilizado profissionalmente na fotografia para armazenar imagens de alta resolução, recebe o nome de', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'BMP.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'GIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'PNG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'TIFF.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'JPEG.', 0);

    -- Questao 41 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q41', N'Na fotografia digital, uma preocupação essencial é prevenir a perda de imagens devido a falhas no equipamento ou cartões de memória, especialmente para fotógrafos profissionais. Considerando a importância de evitar a perda de imagens, qual medida de segurança na fotografia digital deve ser adotada para mitigar riscos relacionados a falhas no equipamento ou cartões de memória?', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Backup em nuvem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Uso de filtros polarizadores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Armazenamento em pen drives.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Modo de economia de energia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Ajuste manual de balanço de branco.', 0);

    -- Questao 42 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q42', N'Quando comparada a uma filmadora padrão, uma característica se destaca como a principal vantagem de uma filmadora digital. Essa característica torna a filmadora HD uma escolha preferencial para gravar vídeos, seja para uso pessoal, profissional ou produções mais elaboradas por conter', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'estabilização de imagem aprimorada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'resolução de imagem mais nítida.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'melhor reprodução de cores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'maior profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'gravação de áudio em alta fidelidade.', 0);

    -- Questao 43 (Tipos de Arquivos)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q43', N'Na produção cinematográfica, existe um formato de imagem que é utilizado para captura de quadros (frames), permitindo um conjunto de benefícios valiosos, que oferecem flexibilidade, controle e qualidade durante o processo de pós-produção, edição, visualização e impressão com alta qualidade. Esse formato recebe o nome de', 1,
        (SELECT id FROM temas WHERE nome = N'Tipos de Arquivos'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'GIF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'PNG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'JPEG.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'TIFF.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'RAW.', 1);

    -- Questao 44 (Protocolo e Cartão de Memória)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q44', N'A aplicação de HASH é uma prática crucial para a segurança e integridade dos arquivos digitais. Essa técnica envolve a utilização de um algoritmo de hash a um conjunto de dados, resultando em uma sequência única de caracteres, conhecida como hash. Na fotografia digital, a utilização da soma de verificação HASH está relacionada com', 1,
        (SELECT id FROM temas WHERE nome = N'Protocolo e Cartão de Memória'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o ajuste de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a redução de ruído digital.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o aprimoramento de nitidez.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a verificação de autenticidade.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o controle de temperatura de cor.', 0);

    -- Questao 45 (Filtros)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q45', N'Os filtros ópticos de efeito e correção são amplamente utilizados para lidar com material colorido na fotografia. Esses filtros têm uma função específica na modificação e ajuste das características cromáticas da imagem. Qual é a finalidade dos filtros ópticos de efeito e correção quando aplicados em material colorido na fotografia?', 1,
        (SELECT id FROM temas WHERE nome = N'Filtros'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Aumentar a saturação de cores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Criar efeitos de distorção artística.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Corrigir a temperatura de cor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Neutralizar reflexos indesejados.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Realçar o contraste global.', 0);

    -- Questao 46 (ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q46', N'Ao explorar as terminologias associadas à fotografia digital, é comum encontrar a sigla ISO, que é a abreviação de International Organization for Standardization, uma organização internacional que estabeleceu as normas ISO. Em termos de configuração de equipamento fotográfico na fotografia digital, o ISO significa', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'intervalo de sensibilidade à luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'índice de saturação de objetos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'instrução de sensibilidade ótica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'indicação de sincronização de obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'intensidade de sombreamento de objetivas.', 0);

    -- Questao 47 (Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q47', N'A lente é como o olho da câmera e tem algumas funções importantes, entre elas, focar a cena fotografada, a profundidade de campo, que é determinada pelo f/stop, e o ângulo de visão, determinado pela distância focal. Ainda, como se fosse uma janela, podendo ser pequena ou grande, quem escolhe o tamanho é o fotógrafo. Ao decidir o tamanho dessa abertura, o fotógrafo está decidindo a quantidade de luz que deseja capturar. Para corrigir a exposição de uma imagem, um recurso é comumente utilizado na fotografia digital e convencional, e tem papel importante no processo de captura da imagem ao ajustar a quantidade de luz que atinge o sensor da câmera. Para se obter uma exposição adequada, deve-se fazer uso do', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'sombreamento de lentes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'flash externo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'filtro polarizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'balanço de branco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'diafragma.', 1);

    -- Questao 48 (Histograma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q48', N'Qual termo é utilizado na fotografia para descrever a variação gradual da intensidade da luz em uma imagem, indo de áreas mais escuras para áreas mais claras, e qual é o recurso que ajuda a medir e controlar essa variação?', 1,
        (SELECT id FROM temas WHERE nome = N'Histograma'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Nitidez; Filtro polarizador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Contraste; Histograma.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Balanço de branco; refletor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Profundidade de campo; Fotômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Saturação; Filtro de densidade neutra.', 0);

    -- Questao 49 (Objetivas)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q49', N'A objetiva fotográfica, também conhecida como lente ou conjunto de lentes, é um componente fundamental de uma câmera fotográfica. Sua principal função é focar a luz que entra na câmera para formar uma imagem nítida no sensor ou filme. Qual a característica de uma objetiva fotográfica que está diretamente relacionada ao poder de resolução, influenciando a nitidez e detalhes nas imagens?', 1,
        (SELECT id FROM temas WHERE nome = N'Objetivas'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A abertura máxima.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O revestimento antirreflexo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'A qualidade do vidro óptico.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O número f/stop.', 0);

    -- Questao 50 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q50', N'Desde que foi descoberta, a fotografia analógica pouco evoluiu. Permaneceu com seus princípios ópticos e formatos por mais de 100 anos, reinando absoluta na história. No século XX, a fotografia passou a ser utilizada em grande escala pela imprensa mundial. Na fotografia analógica, onde o processo químico de revelação desempenha um papel crucial, destaca-se uma distinção importante entre os processos de revelação positivo e negativo. Considerando o desenvolvimento químico das imagens, essa diferença está relacionada', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao tipo de filme utilizado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao uso de fixador na solução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à ordem das etapas no processo de revelação.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao nível de exposição à luz durante a captura.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'à temperatura da solução reveladora.', 0);

    -- Questao 51 (Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q51', N'As câmeras digitais profissionais são ferramentas poderosas para fotógrafos que demandam precisão, versatilidade e qualidade excepcionais em suas imagens. Qual o recurso específico encontrado nas câmeras digitais profissionais que permite ao fotógrafo controlar manualmente a quantidade de luz que atinge o sensor, influenciando diretamente a exposição da imagem?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Prioridade de abertura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Balanço de branco automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Foco automático contínuo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Estabilização de imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Modo de cena.', 0);

    -- Questao 52 (Focagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q52', N'As câmeras digitais possuem uma tecnologia que permite ao fotógrafo garantir que o objeto desejado seja capturado de forma nítida. Esse sistema é fundamental para simplificar o processo de captura de imagens para fotógrafos de todos os níveis de habilidade, permitindo que se concentrem mais na composição e criatividade. Qual é o dispositivo que simplifica o processo fotográfico, ajustando a nitidez da imagem ao detectar contrastes na cena?', 1,
        (SELECT id FROM temas WHERE nome = N'Focagem'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Acelerômetro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Barômetro integrado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Motor de vibração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Sensor infravermelho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Sistema de autofoco.', 1);

    -- Questao 53 (Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q53', N'Sebastião Salgado dá a seu tema uma presença escultural impressionante ao deixar as linhas do corpo do homem tão claramente definidas contra um fundo fora de foco. Esse efeito chama-se profundidade de campo. A profundidade de campo é um conceito importante na fotografia e se refere à faixa de distâncias na cena que aparecem nítidas na imagem final. Em outras palavras, é a área compreendida entre os pontos mais próximos e mais distantes da câmera que ainda parece estar em foco. Qual é o ajuste que desempenha um papel crucial no controle da profundidade de campo, permitindo ao fotógrafo determinar a área nítida da imagem?', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Filtro ND.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Diafragma da lente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Flash externo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Tubo de extensão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Tubo de polarização.', 0);

    -- Questao 54 (ISO)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q54', N'Para aprimorar a captura de imagens em variadas condições de iluminação em uma câmera fotográfica digital, é necessário ajustar a sensibilidade ISO, a qual se refere', 1,
        (SELECT id FROM temas WHERE nome = N'ISO'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'à abertura da lente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao tempo de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à resolução da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'à sensibilidade do sensor à luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao foco automático.', 0);

    -- Questao 55 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q55', N'Os materiais sensíveis negativos e positivos, no universo da fotografia analógica, possuem diferenças que indicam a aplicação típica de cada um. Uma diferença entre esses dois materiais está no fato de que', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o material sensível negativo é usado para fotografias em preto e branco, enquanto o positivo é para fotografias coloridas.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o material sensível negativo é utilizado em câmeras compactas, enquanto o positivo é preferencial em câmeras DSLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o material sensível negativo é adequado para fotografias externas, enquanto o positivo é mais apropriado para ambientes internos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o material sensível negativo é utilizado em retratos, enquanto o positivo é mais indicado para paisagens.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o material sensível negativo é destinado a câmeras de médio formato, enquanto o positivo é mais comumente usado em câmeras 35mm.', 0);

    -- Questao 56 (Balanço de Branco)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q56', N'A luz natural que incide em nós vem principalmente de cima, como a luz solar, a luz das estrelas e o luar. Somos altamente sensíveis à intensidade do Sol e à sua ausência à noite. Fontes artificiais de luz ficam bem mais perto de nós do que o Sol, então vemos melhor como a luz se esvai à distância. Ao empregar a luz natural como fonte para iluminar um assunto, o fotógrafo deve considerar cuidadosamente a necessidade de', 1,
        (SELECT id FROM temas WHERE nome = N'Balanço de Branco'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'controlar a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizar um flash de preenchimento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ajustar a temperatura de cor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'posicionar o assunto de frente para o sol.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'escolher um balanço de branco automático.', 0);

    -- Questao 57 (Resolução e Qualidade de Imagem)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q57', N'Fotografias digitais são baseadas em pixels, pedacinhos minúsculos de informação visual. Eles possibilitam editar e transmitir fotografias usando programas de computador e a internet, e eliminaram praticamente todas as técnicas manuais e de tempo real usadas no quarto escuro. Hoje, ferramentas elementares de edição de foto estão disponíveis para uso amador. Qual é o termo utilizado para descrever a quantidade de detalhes presentes em uma imagem digital, indicando o número total de pixels que compõem a largura e a altura da imagem?', 1,
        (SELECT id FROM temas WHERE nome = N'Resolução e Qualidade de Imagem'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Profundidade de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Abertura da lente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Taxa de quadros.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Resolução.', 1);

    -- Questao 58 (Componentes da Câmera)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q58', N'Uma das vantagens significativas dos equipamentos fotográficos digitais, em comparação com os convencionais, no contexto da visualização das imagens capturadas, está relacionada à', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior profundidade de campo da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'visualização imediata das imagens no visor LCD.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'trepidações durante a captura de imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'manipulação mais flexível de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'maior capacidade de armazenamento interno.', 0);

    -- Questao 59 (Fotografia Analógica)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q59', N'Nos primeiros dias da fotografia, a foto definitiva era imaginada como imitando a visão humana. Portanto, a imagem ideal de uma câmera seria formada rápida e completamente, sem aprimoramento ao filme após a sua exposição inicial. A imagem instantânea ideal pode ter impedido os primeiros fotógrafos de abraçar uma ideia mais mundana: a imagem latente. No processo fotográfico, a formação da imagem latente é um passo crucial. Essa ‘imagem latente’ durante o processo, antes da revelação, representa', 1,
        (SELECT id FROM temas WHERE nome = N'Fotografia Analógica'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a imagem virtual projetada no visor da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a imagem já totalmente formada, mas ainda não revelada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a representação digital da cena capturada pela câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'os cristais de halogeneto de prata alterados pela exposição à luz.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a imagem após a fixação, pronta para ser impressa.', 0);

    -- Questao 60 (Diafragma)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'UFG 2024 - Câmara Municipal de Caldas Novas/GO - Fotógrafo Legislativo - Q60', N'Para capturar imagens em ambientes escuros, existe um componente na câmera digital que controla a quantidade de luz que atinge o sensor, influenciando diretamente a exposição da imagem. Esse componente se refere à', 1,
        (SELECT id FROM temas WHERE nome = N'Diafragma'), N'UFG', 2024);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'abertura da lente.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'sensibilidade ISO.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'resolução de imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'profundidade de cor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'velocidade do obturador.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO

