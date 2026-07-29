-- Insercao de 90 questoes ineditas (estilo VUNESP) sobre sistemas de visor de
-- camera (SLR, TLR, visor direto), pentaprisma, espelho reflex e paralaxe.
-- Fonte: arquivos quest1.pdf a quest9.pdf (conteudo autoral, gabarito ja vinha
-- no proprio PDF - nenhuma resposta foi inventada, apenas transcrita).
-- referencia = "Inéditas Padrão VUNESP", banca = VUNESP, ano = NULL (conteudo
-- nao-oficial, nao e prova real de banca).

USE ConcursosDB;
GO

IF NOT EXISTS (SELECT 1 FROM temas WHERE nome = N'Componentes da Câmera')
    INSERT INTO temas (nome) VALUES (N'Componentes da Câmera');
GO

BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @idQuestao INT;

    -- QUESTÃO 011 (arquivo quest1)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q011', N'Ao comparar câmeras TLR e SLR, verifica-se que ambas permitem a visualização da cena antes do disparo. Entretanto, apenas uma delas elimina o erro de paralaxe durante o enquadramento. Assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A câmera TLR elimina o erro de paralaxe por utilizar duas objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'A câmera SLR elimina o erro de paralaxe por utilizar a própria objetiva para formar a imagem no visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Ambas eliminam completamente o erro de paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Nenhuma delas elimina o erro de paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O erro de paralaxe ocorre apenas em câmeras digitais.', 0);

    -- QUESTÃO 012 (arquivo quest1)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q012', N'Uma característica típica das câmeras SLR consiste na presença de um componente móvel responsável por direcionar a luz ao visor durante a composição da fotografia. Esse componente é denominado', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pentaprisma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'espelho reflex.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'diafragma.', 0);

    -- QUESTÃO 013 (arquivo quest1)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q013', N'Nas câmeras SLR, imediatamente antes do registro da imagem,', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o diafragma permanece totalmente aberto durante toda a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o espelho é levantado para permitir a passagem da luz até o sensor ou filme.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o pentaprisma gira 180 graus.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o sensor é desligado temporariamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a objetiva é deslocada para frente.', 0);

    -- QUESTÃO 014 (arquivo quest1)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q014', N'Em relação ao pentaprisma presente nas câmeras SLR, é correto afirmar que sua principal função é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'controlar o tempo de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'corrigir a orientação da imagem visualizada pelo fotógrafo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'realizar a medição da luz ambiente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'estabilizar mecanicamente a câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ampliar a distância focal da objetiva.', 0);

    -- QUESTÃO 015 (arquivo quest1)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q015', N'O sistema reflex recebeu essa denominação porque', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utiliza filtros refletivos na objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a luz é refletida por um espelho antes de chegar ao visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'toda fotografia é registrada por reflexão da luz no sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o pentaprisma funciona por reflexão total da imagem diretamente no sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utiliza duas objetivas refletindo imagens simultaneamente.', 0);

    -- QUESTÃO 016 (arquivo quest1)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q016', N'Ao fotografar utilizando uma câmera de visor direto, o fotógrafo percebeu pequena diferença entre o enquadramento observado e a fotografia obtida. Esse fenômeno decorre', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'da difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'da vinhetagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da paralaxe.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'da aberração cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'da profundidade de campo.', 0);

    -- QUESTÃO 017 (arquivo quest1)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q017', N'Uma vantagem das câmeras de visor direto em relação às SLR consiste, em regra, na', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'maior complexidade mecânica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'maior peso.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'construção mais simples e compacta.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilização obrigatória de objetivas intercambiáveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminação da necessidade de foco.', 0);

    -- QUESTÃO 018 (arquivo quest1)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q018', N'Em uma câmera TLR, a objetiva destinada à visualização da cena', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'registra simultaneamente a fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'possui exclusivamente função de iluminação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'forma a imagem observada no visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'substitui o obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'funciona apenas durante a focagem automática.', 0);

    -- QUESTÃO 019 (arquivo quest1)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q019', N'Assinale a alternativa que apresenta corretamente uma característica das câmeras SLR.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Utilizam visor independente da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Não possuem espelho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O fotógrafo observa a cena através da própria objetiva utilizada para registrar a imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'São compostas por duas objetivas idênticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Não permitem troca de objetivas.', 0);

    -- QUESTÃO 020 (arquivo quest1)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q020', N'A principal consequência da utilização de um visor independente da objetiva é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumento da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'eliminação das distorções ópticas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'possibilidade de ocorrência de erro de paralaxe.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumento da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'redução do campo de visão da objetiva.', 0);

    -- QUESTÃO 021 (arquivo quest2)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q021', N'Uma das diferenças fundamentais entre uma câmera de visor direto e uma câmera SLR está na forma como o fotógrafo observa a cena antes do disparo. Nas câmeras SLR, a imagem observada no visor', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'é formada por uma câmera secundária localizada acima da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'é captada por um sensor auxiliar.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'percorre o mesmo caminho óptico utilizado para registrar a fotografia.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'sofre correção eletrônica antes de chegar ao visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'é produzida por uma objetiva exclusiva para visualização.', 0);

    -- QUESTÃO 022 (arquivo quest2)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q022', N'Durante o disparo de uma câmera SLR, o fotógrafo percebe um breve escurecimento do visor. Esse fenômeno ocorre porque', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o sensor interrompe a captura da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o espelho reflex é levantado durante a exposição.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o pentaprisma deixa de funcionar.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a objetiva fecha completamente o diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o obturador bloqueia permanentemente a entrada de luz.', 0);

    -- QUESTÃO 023 (arquivo quest2)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q023', N'Em relação às câmeras TLR, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas objetivas registram simultaneamente a fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas a objetiva inferior registra a fotografia, enquanto a superior é utilizada para visualização.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Apenas a objetiva superior registra a fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As objetivas possuem distâncias focais obrigatoriamente diferentes.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Não existe visor óptico.', 0);

    -- QUESTÃO 024 (arquivo quest2)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q024', N'Uma câmera apresenta enquadramento extremamente preciso, mesmo em fotografias realizadas a pequenas distâncias do objeto. Esse resultado decorre, principalmente,', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'da utilização de visor independente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'da utilização de visor eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da visualização através da própria objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'da utilização de duas objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'da presença de foco automático.', 0);

    -- QUESTÃO 025 (arquivo quest2)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q025', N'O pentaprisma das câmeras SLR está diretamente relacionado', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'à ampliação da distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao aumento da velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao correto posicionamento da imagem observada no visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'à estabilização óptica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'à medição da exposição.', 0);

    -- QUESTÃO 026 (arquivo quest2)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q026', N'Nas câmeras reflex de objetiva única (SLR), o espelho permanece normalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'recolhido acima do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'atrás do pentaprisma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'inclinado, refletindo a luz para o visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fechado sobre o obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'acoplado ao diafragma.', 0);

    -- QUESTÃO 027 (arquivo quest2)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q027', N'Ao utilizar uma câmera de visor direto para fotografar um documento a curta distância, o fotógrafo deve considerar que', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a profundidade de campo será sempre reduzida.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'poderá ocorrer diferença entre o enquadramento observado e a imagem registrada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a objetiva sofrerá alteração de distância focal.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o obturador permanecerá aberto por mais tempo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a imagem ficará invertida.', 0);

    -- QUESTÃO 028 (arquivo quest2)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q028', N'Uma vantagem das câmeras SLR sobre os modelos de visor direto é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'dispensarem objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'eliminarem a necessidade de focagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'permitirem visualização fiel do enquadramento e da perspectiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'possuírem obrigatoriamente duas objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'não utilizarem espelhos.', 0);

    -- QUESTÃO 029 (arquivo quest2)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q029', N'O espelho existente nas câmeras SLR possui como finalidade principal', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a luminosidade do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'direcionar a luz ao visor durante a composição da fotografia.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar a abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ampliar o campo de visão da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'estabilizar mecanicamente o equipamento.', 0);

    -- QUESTÃO 030 (arquivo quest2)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q030', N'Uma característica típica das câmeras de visor direto é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizarem o mesmo caminho óptico para visualização e registro.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apresentarem obrigatoriamente visor eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'possuírem visor independente da objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizarem duas objetivas sobrepostas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'dispensarem sistema de focagem.', 0);

    -- QUESTÃO 031 (arquivo quest3)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q031', N'Um fotógrafo precisa realizar fotografias de reprodução de documentos, exigindo o enquadramento mais fiel possível em curtas distâncias. Considerando apenas o sistema de visualização da câmera, o equipamento mais indicado é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'câmera de visor direto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'câmera TLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'câmera SLR.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'câmera compacta com visor óptico independente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'qualquer câmera de visor direto, pois não existe paralaxe em curtas distâncias.', 0);

    -- QUESTÃO 032 (arquivo quest3)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q032', N'Assinale a alternativa que apresenta corretamente uma característica das câmeras TLR.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Utilizam uma única objetiva para visualização e registro da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Possuem duas objetivas, sendo uma destinada ao visor e outra ao registro fotográfico.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Eliminam completamente a necessidade de foco.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Não apresentam visor óptico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Utilizam exclusivamente visor eletrônico.', 0);

    -- QUESTÃO 033 (arquivo quest3)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q033', N'Durante o disparo de uma câmera SLR, o espelho reflex movimenta-se porque', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'precisa permitir que a luz alcance o sensor ou o filme.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'corrige automaticamente a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'reduz a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumenta a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'amplia o campo de visão da objetiva.', 0);

    -- QUESTÃO 034 (arquivo quest3)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q034', N'Em relação ao erro de paralaxe, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Ocorre apenas em câmeras digitais.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Está relacionado exclusivamente ao foco automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'É eliminado pelo aumento da velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Decorre da diferença entre o eixo do visor e o da objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'É provocado pela abertura excessiva do diafragma.', 0);

    -- QUESTÃO 035 (arquivo quest3)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q035', N'Uma vantagem importante das câmeras de visor direto é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'permitir visualização através da própria objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'eliminar completamente a paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'possuir obrigatoriamente objetivas intercambiáveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar sistema reflex.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apresentar construção simples e menor complexidade mecânica.', 1);

    -- QUESTÃO 036 (arquivo quest3)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q036', N'O pentaprisma presente nas câmeras SLR tem como principal finalidade', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'inverter corretamente a imagem para o fotógrafo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'medir a intensidade luminosa.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar o foco automático.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'acionar o obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'estabilizar a imagem.', 0);

    -- QUESTÃO 037 (arquivo quest3)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q037', N'Ao analisar uma câmera fotográfica, um perito constatou que o fotógrafo observa exatamente a imagem formada pela objetiva utilizada para registrar a fotografia. Essa característica identifica uma câmera', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'de visor direto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'TLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'telemétrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'SLR.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'panorâmica.', 0);

    -- QUESTÃO 038 (arquivo quest3)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q038', N'Assinale a alternativa incorreta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O pentaprisma participa da formação da imagem observada no visor das câmeras SLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O espelho reflex permanece abaixado durante a composição da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O erro de paralaxe é comum em sistemas de visor independente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As câmeras TLR utilizam duas objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Nas câmeras SLR, o visor é totalmente independente da objetiva.', 1);

    -- QUESTÃO 039 (arquivo quest3)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q039', N'Uma câmera apresenta visor independente da objetiva principal. Nessa situação, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o sistema elimina completamente erros de enquadramento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a paralaxe tende a ser mais perceptível em fotografias realizadas a pequenas distâncias.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a câmera obrigatoriamente possui duas objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'trata-se obrigatoriamente de uma câmera SLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o pentaprisma corrige automaticamente a paralaxe.', 0);

    -- QUESTÃO 040 (arquivo quest3)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q040', N'Ao comparar os sistemas de visor direto, TLR e SLR, conclui-se corretamente que', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'somente as câmeras TLR utilizam visor óptico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'todas utilizam a mesma trajetória óptica entre visor e registro da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apenas as SLR utilizam espelho móvel para direcionar a luz ao visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'todas eliminam o erro de paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'somente as câmeras de visor direto permitem fotografias de curta distância.', 0);

    -- QUESTÃO 041 (arquivo quest4)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q041', N'Um fotógrafo necessita registrar evidências em uma cena de crime utilizando um equipamento que permita visualizar exatamente o enquadramento que será registrado, reduzindo erros de composição. Nesse caso, o equipamento mais adequado é uma câmera', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'de visor direto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'SLR.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'TLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'telemétrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'compacta de visor independente.', 0);

    -- QUESTÃO 042 (arquivo quest4)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q042', N'Assinale a alternativa incorreta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Nas câmeras SLR, o espelho reflete a luz para o visor durante a composição da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O pentaprisma corrige a orientação da imagem observada no visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Nas câmeras TLR, uma objetiva é destinada ao visor e outra ao registro da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Nas câmeras de visor direto, visor e objetiva compartilham exatamente o mesmo eixo óptico.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A paralaxe tende a ser mais perceptível em fotografias realizadas a curta distância.', 0);

    -- QUESTÃO 043 (arquivo quest4)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q043', N'Uma câmera possui duas objetivas de mesma distância focal montadas uma sobre a outra. Essa configuração caracteriza uma câmera', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'panorâmica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'reflex de objetiva única.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'TLR.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'telemétrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'mirrorless.', 0);

    -- QUESTÃO 044 (arquivo quest4)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q044', N'O principal motivo para o espelho das câmeras SLR permanecer abaixado antes do disparo é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'impedir a entrada de luz na objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'proteger o sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'refletir a imagem em direção ao visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'controlar a abertura do diafragma.', 0);

    -- QUESTÃO 045 (arquivo quest4)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q045', N'Em uma câmera SLR, durante o instante da exposição,', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o espelho permanece imóvel refletindo a luz ao visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o visor continua exibindo normalmente a cena.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o espelho é levantado para permitir a passagem da luz ao sensor ou filme.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o pentaprisma substitui a função do espelho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a objetiva deixa de formar imagem.', 0);

    -- QUESTÃO 046 (arquivo quest4)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q046', N'O fenômeno denominado paralaxe está diretamente relacionado', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'à diferença entre o enquadramento observado e o efetivamente registrado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'à baixa resolução da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ao excesso de ruído eletrônico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'à superexposição da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ao movimento do espelho reflex.', 0);

    -- QUESTÃO 047 (arquivo quest4)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q047', N'Em relação às câmeras de visor direto, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizam espelho móvel.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'utilizam pentaprisma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apresentam maior complexidade mecânica que as SLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'possuem visor independente da objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminam totalmente o erro de paralaxe.', 0);

    -- QUESTÃO 048 (arquivo quest4)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q048', N'Um fotógrafo está utilizando uma câmera TLR. Ao observar a cena pelo visor, a imagem é formada', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'pela mesma objetiva que registra a fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'por uma objetiva destinada exclusivamente à visualização.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'diretamente pelo sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'pelo pentaprisma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'pelo obturador.', 0);

    -- QUESTÃO 049 (arquivo quest4)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q049', N'A principal vantagem do sistema SLR sobre os sistemas de visor independente é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'produzir arquivos de maior resolução.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permitir velocidades de obturação mais elevadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar diferenças entre o enquadramento observado e o registrado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'dispensar a utilização de objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'reduzir automaticamente o peso do equipamento.', 0);

    -- QUESTÃO 050 (arquivo quest4)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q050', N'Ao comparar os três sistemas clássicos de câmeras estudados (visor direto, TLR e SLR), conclui-se corretamente que', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas as câmeras SLR utilizam um espelho móvel para direcionar a luz ao visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'todas utilizam duas objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'todas eliminam o erro de paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas as câmeras de visor direto possuem visor óptico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'as câmeras TLR utilizam o mesmo caminho óptico entre visor e registro da imagem.', 0);

    -- QUESTÃO 051 (arquivo quest5)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q051', N'Durante a análise de uma câmera fotográfica, um perito verificou que o visor recebe a imagem refletida por um espelho móvel e corrigida por um pentaprisma antes da visualização pelo fotógrafo. Essa descrição corresponde ao funcionamento de uma câmera', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'de visor direto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'TLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'telemétrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'SLR.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'pinhole.', 0);

    -- QUESTÃO 052 (arquivo quest5)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q052', N'O erro de paralaxe tende a ser mais perceptível quando', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a fotografia é realizada com altas velocidades de obturação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o objeto fotografado encontra-se muito próximo da câmera.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'são utilizadas objetivas teleobjetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o ISO é elevado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o diafragma permanece muito fechado.', 0);

    -- QUESTÃO 053 (arquivo quest5)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q053', N'Em relação ao sistema TLR, analise as afirmativas. I. Possui duas objetivas de mesma distância focal. II. Apenas uma das objetivas registra a fotografia. III. A visualização da cena ocorre por uma objetiva diferente daquela utilizada para registrar a imagem. Está correto o que se afirma em', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I, II e III.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'I e II, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'II e III, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I e III, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I, apenas.', 0);

    -- QUESTÃO 054 (arquivo quest5)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q054', N'Assinale a alternativa que apresenta uma consequência direta da utilização de visor independente da objetiva.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Eliminação do espelho reflex.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Aumento automático da profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Possibilidade de diferença entre o enquadramento observado e a fotografia registrada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Redução da distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Necessidade de utilização de pentaprisma.', 0);

    -- QUESTÃO 055 (arquivo quest5)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q055', N'Durante o disparo de uma câmera SLR, o visor escurece por uma fração de segundo porque', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o sensor interrompe a captura da luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o obturador permanece permanentemente fechado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o pentaprisma deixa de refletir a imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o espelho é deslocado para liberar a passagem da luz ao sensor ou filme.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a objetiva é fechada automaticamente.', 0);

    -- QUESTÃO 056 (arquivo quest5)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q056', N'Uma característica que diferencia a câmera SLR da TLR é que', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas a TLR possui visor óptico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'apenas a SLR utiliza uma única objetiva tanto para visualização quanto para registro da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apenas a TLR permite troca de objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a SLR não possui espelho.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a TLR elimina completamente a paralaxe.', 0);

    -- QUESTÃO 057 (arquivo quest5)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q057', N'Assinale a alternativa incorreta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O pentaprisma participa da formação da imagem observada no visor das câmeras SLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O espelho reflex permanece abaixado durante a composição da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Nas câmeras TLR, ambas as objetivas registram simultaneamente a fotografia.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O visor direto utiliza caminho óptico diferente daquele da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A paralaxe decorre da diferença entre esses dois caminhos ópticos.', 0);

    -- QUESTÃO 058 (arquivo quest5)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q058', N'Em um levantamento pericial, o fotógrafo precisa reproduzir exatamente os limites da área observada no visor. Para essa finalidade, o sistema que oferece maior fidelidade de enquadramento é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'visor direto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'visor galileano.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'SLR.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'TLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'câmera descartável.', 0);

    -- QUESTÃO 059 (arquivo quest5)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q059', N'O sistema reflex presente nas câmeras SLR recebe esse nome porque', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utiliza objetivas espelhadas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a luz proveniente da objetiva é refletida por um espelho antes de alcançar o visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'registra imagens apenas por reflexão da luz ambiente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utiliza duas objetivas paralelas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substitui completamente o pentaprisma.', 0);

    -- QUESTÃO 060 (arquivo quest5)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q060', N'Ao comparar os sistemas clássicos de câmeras fotográficas, conclui-se corretamente que', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas as câmeras de visor direto estão sujeitas ao erro de paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'TLR e visor direto utilizam caminhos ópticos independentes entre visor e objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'todas utilizam o mesmo caminho óptico para visualização.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas as TLR utilizam espelho móvel.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'as SLR utilizam duas objetivas independentes.', 0);

    -- QUESTÃO 061 (arquivo quest6)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q061', N'Ao adquirir uma câmera para trabalhos periciais, um fotógrafo priorizou um equipamento que lhe permitisse verificar exatamente o efeito produzido pela objetiva escolhida antes do disparo. Essa característica é típica das câmeras', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'SLR.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'de visor direto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'TLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'panorâmicas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'compactas de visor óptico independente.', 0);

    -- QUESTÃO 062 (arquivo quest6)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q062', N'A diferença entre a imagem observada no visor e aquela efetivamente registrada pode comprometer a precisão do enquadramento, especialmente em fotografias realizadas a curta distância. Esse efeito recebe o nome de', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'difração.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'aberração cromática.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'paralaxe.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'vinhetagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'flare.', 0);

    -- QUESTÃO 063 (arquivo quest6)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q063', N'Em relação às câmeras TLR, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As duas objetivas registram simultaneamente a fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Apenas uma das objetivas é destinada ao registro da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Não possuem visor óptico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Utilizam espelho móvel semelhante ao das SLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Eliminam completamente a paralaxe.', 0);

    -- QUESTÃO 064 (arquivo quest6)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q064', N'O pentaprisma existente nas câmeras SLR está associado, principalmente,', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'ao aumento da luminosidade da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'ao funcionamento do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'à inversão correta da imagem observada pelo fotógrafo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ao controle da abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'à estabilização óptica.', 0);

    -- QUESTÃO 065 (arquivo quest6)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q065', N'Assinale a alternativa incorreta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O visor das câmeras SLR recebe a imagem proveniente da própria objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O espelho reflex permanece levantado durante toda a composição da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O pentaprisma participa da formação da imagem visualizada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Durante a exposição, o espelho é deslocado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O visor escurece momentaneamente durante o disparo.', 0);

    -- QUESTÃO 066 (arquivo quest6)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q066', N'Um fotógrafo deseja reduzir ao máximo a possibilidade de erro de enquadramento causado pela paralaxe. Para isso, deverá optar por uma câmera', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'TLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'de visor direto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'telemétrica.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'SLR.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'compacta convencional.', 0);

    -- QUESTÃO 067 (arquivo quest6)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q067', N'Nas câmeras SLR, a principal função do espelho reflex é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'controlar o tempo de exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'direcionar a luz da objetiva para o visor antes do disparo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'ampliar a distância focal da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'corrigir automaticamente a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'aumentar a profundidade de campo.', 0);

    -- QUESTÃO 068 (arquivo quest6)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q068', N'Uma câmera cuja visualização ocorre por meio de uma objetiva diferente daquela responsável pelo registro da fotografia pertence ao sistema', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'reflex de objetiva única.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'mirrorless.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'TLR.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'SLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'pinhole.', 0);

    -- QUESTÃO 069 (arquivo quest6)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q069', N'A observação de um breve escurecimento do visor durante o disparo, característica típica das câmeras SLR, decorre', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'do fechamento do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'da interrupção do funcionamento do pentaprisma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da elevação do espelho reflex.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do desligamento temporário do sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'da troca automática da objetiva.', 0);

    -- QUESTÃO 070 (arquivo quest6)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q070', N'Ao comparar os sistemas de visor direto, TLR e SLR, conclui-se corretamente que', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas as SLR utilizam espelho móvel para direcionar a luz ao visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'todas utilizam duas objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'todas eliminam a paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas as TLR utilizam visor óptico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'apenas as câmeras de visor direto permitem fotografias de curta distância.', 0);

    -- QUESTÃO 071 (arquivo quest7)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q071', N'Durante uma perícia, o fotógrafo precisa registrar um vestígio localizado a poucos centímetros da câmera. Para minimizar diferenças entre o enquadramento observado e a imagem registrada, o equipamento mais indicado é uma câmera', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'de visor direto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'TLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'SLR.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'compacta com visor óptico independente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'panorâmica.', 0);

    -- QUESTÃO 072 (arquivo quest7)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q072', N'Assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O pentaprisma impede a entrada de luz na objetiva durante a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O espelho reflex permanece levantado durante toda a composição da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O visor das câmeras SLR recebe a imagem formada pela própria objetiva utilizada no registro fotográfico.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'As câmeras TLR utilizam apenas uma objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'A paralaxe ocorre exclusivamente em câmeras analógicas.', 0);

    -- QUESTÃO 073 (arquivo quest7)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q073', N'A principal função do espelho existente nas câmeras SLR é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'controlar a intensidade da luz que atinge o sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'direcionar a luz proveniente da objetiva para o visor antes do disparo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'inverter lateralmente a fotografia gravada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'corrigir automaticamente a perspectiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substituir o pentaprisma.', 0);

    -- QUESTÃO 074 (arquivo quest7)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q074', N'Em relação às câmeras de visor direto, é correto afirmar que', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'utilizam o mesmo caminho óptico para visualização e captura da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'possuem obrigatoriamente objetivas intercambiáveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizam duas objetivas sobrepostas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o visor está posicionado separadamente da objetiva principal.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminam completamente a ocorrência de paralaxe.', 0);

    -- QUESTÃO 075 (arquivo quest7)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q075', N'Analise as afirmativas. I. As câmeras SLR utilizam espelho móvel. II. As câmeras TLR possuem duas objetivas. III. O visor direto utiliza caminho óptico independente da objetiva. Está correto o que se afirma em', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'I, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'I e II, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'II e III, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'I e III, apenas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'I, II e III.', 1);

    -- QUESTÃO 076 (arquivo quest7)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q076', N'Uma vantagem proporcionada pelo sistema SLR é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'registrar imagens sem objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permitir ao fotógrafo visualizar praticamente o mesmo enquadramento que será registrado.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar a necessidade de focagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'dispensar o uso de visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilizar duas objetivas para cada fotografia.', 0);

    -- QUESTÃO 077 (arquivo quest7)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q077', N'O escurecimento momentâneo observado no visor de uma câmera SLR durante o disparo ocorre porque', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o diafragma permanece completamente fechado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o pentaprisma interrompe a passagem da luz.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o espelho deixa temporariamente de refletir a imagem para o visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o sensor é desligado.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a objetiva interrompe a formação da imagem.', 0);

    -- QUESTÃO 078 (arquivo quest7)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q078', N'Assinale a alternativa incorreta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'A paralaxe é mais perceptível em fotografias realizadas a pequenas distâncias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O visor das câmeras SLR utiliza a imagem proveniente da própria objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'As câmeras TLR possuem duas objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O pentaprisma participa da orientação correta da imagem observada.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'As câmeras de visor direto utilizam espelho reflex móvel.', 1);

    -- QUESTÃO 079 (arquivo quest7)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q079', N'Um fabricante informa que determinado modelo utiliza duas objetivas, sendo uma destinada exclusivamente ao visor e outra ao registro da fotografia. Esse equipamento corresponde ao sistema', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'SLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'mirrorless.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'visor direto.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'TLR.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'pinhole.', 0);

    -- QUESTÃO 080 (arquivo quest7)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q080', N'A respeito dos sistemas clássicos de câmeras fotográficas, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O sistema SLR utiliza espelho móvel e pentaprisma para permitir a visualização da imagem formada pela própria objetiva.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O sistema TLR elimina completamente a paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O visor direto utiliza exatamente o mesmo caminho óptico da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Todas as câmeras utilizam espelho reflex.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O pentaprisma está presente em todos os sistemas de câmeras.', 0);

    -- QUESTÃO 081 (arquivo quest8)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q081', N'O sistema reflex empregado nas câmeras SLR permite ao fotógrafo', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'visualizar a cena por meio de uma segunda objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'observar uma imagem proveniente diretamente da objetiva utilizada para o registro.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminar completamente qualquer erro óptico da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'fotografar sem a necessidade de visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substituir o uso do pentaprisma.', 0);

    -- QUESTÃO 082 (arquivo quest8)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q082', N'A utilização de duas objetivas paralelas em uma câmera TLR tem como finalidade', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a velocidade de disparo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'registrar duas fotografias simultaneamente.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'separar as funções de visualização e de registro da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'aumentar a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar o uso do obturador.', 0);

    -- QUESTÃO 083 (arquivo quest8)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q083', N'O breve escurecimento do visor observado durante o disparo de uma câmera SLR decorre', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'da elevação temporária do espelho reflex.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'da abertura total do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'da redução da intensidade luminosa da objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'do desligamento do pentaprisma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'do bloqueio eletrônico do sensor.', 0);

    -- QUESTÃO 084 (arquivo quest8)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q084', N'Assinale a alternativa incorreta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O erro de paralaxe tende a aumentar em fotografias realizadas a pequenas distâncias.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'As câmeras TLR utilizam duas objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O visor das câmeras SLR recebe a imagem proveniente da própria objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O pentaprisma participa da orientação correta da imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O visor direto utiliza espelho móvel para direcionar a luz ao visor.', 1);

    -- QUESTÃO 085 (arquivo quest8)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q085', N'Uma vantagem das câmeras de visor direto é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a construção mecânica mais simples.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a eliminação da paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'a utilização obrigatória de objetivas intercambiáveis.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a visualização através da própria objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a existência de espelho reflex.', 0);

    -- QUESTÃO 086 (arquivo quest8)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q086', N'Nas câmeras SLR, o pentaprisma atua principalmente para', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'controlar a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'corrigir a orientação da imagem observada no visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'movimentar o espelho reflex.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'ampliar o campo de visão.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'estabilizar a objetiva.', 0);

    -- QUESTÃO 087 (arquivo quest8)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q087', N'Uma característica exclusiva das câmeras SLR, quando comparadas aos sistemas clássicos de visor direto e TLR, é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'possuir visor óptico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'permitir fotografias coloridas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'utilizar um espelho móvel associado a uma única objetiva de visualização e captura.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'utilizar objetivas intercambiáveis em todos os modelos.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'eliminar completamente qualquer erro de enquadramento.', 0);

    -- QUESTÃO 088 (arquivo quest8)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q088', N'Em relação às câmeras TLR, assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Ambas as objetivas registram a fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O visor recebe a imagem proveniente da objetiva superior.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O sistema utiliza pentaprisma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O espelho móvel direciona continuamente a luz ao visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'O sistema utiliza exclusivamente visor eletrônico.', 0);

    -- QUESTÃO 089 (arquivo quest8)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q089', N'A paralaxe pode comprometer principalmente', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a resolução da fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'a reprodução das cores.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o enquadramento da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a profundidade de campo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'a distância focal da objetiva.', 0);

    -- QUESTÃO 090 (arquivo quest8)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q090', N'Ao comparar visor direto, TLR e SLR, conclui-se corretamente que', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'apenas o sistema SLR utiliza espelho móvel durante a composição da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'todos utilizam exatamente o mesmo caminho óptico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'apenas o visor direto utiliza visor óptico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas a TLR possui objetiva.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'todos eliminam completamente a paralaxe.', 0);

    -- QUESTÃO 091 (arquivo quest9)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q091', N'Ao fotografar um objeto muito próximo utilizando uma câmera de visor direto, o fotógrafo deve estar atento porque', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'a objetiva deixa de formar imagem.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'o obturador permanece aberto por mais tempo.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'poderá ocorrer diferença entre a área visualizada no visor e a efetivamente registrada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'o pentaprisma altera automaticamente o enquadramento.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o sensor reduz sua resolução.', 0);

    -- QUESTÃO 092 (arquivo quest9)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q092', N'Nas câmeras SLR, a sequência correta do caminho percorrido pela luz durante a composição da fotografia é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'Objetiva → Espelho → Pentaprisma → Visor.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'Objetiva → Pentaprisma → Espelho → Visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'Objetiva → Sensor → Pentaprisma → Visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Objetiva → Obturador → Visor → Pentaprisma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Objetiva → Diafragma → Visor → Sensor.', 0);

    -- QUESTÃO 093 (arquivo quest9)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q093', N'Assinale a alternativa correta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'O sistema TLR elimina completamente a paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O visor direto utiliza espelho móvel.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'O sistema SLR permite visualizar a imagem formada pela própria objetiva utilizada para registrar a fotografia.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'Todas as câmeras utilizam pentaprisma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'As câmeras TLR utilizam apenas uma objetiva.', 0);

    -- QUESTÃO 094 (arquivo quest9)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q094', N'A principal finalidade do pentaprisma nas câmeras SLR é', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'aumentar a velocidade do obturador.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'corrigir a orientação da imagem antes que ela seja observada pelo fotógrafo.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'controlar a abertura do diafragma.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'direcionar a luz diretamente ao sensor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'ampliar a distância focal da objetiva.', 0);

    -- QUESTÃO 095 (arquivo quest9)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q095', N'Em uma câmera TLR, a objetiva responsável pelo visor', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'registra simultaneamente a fotografia.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'movimenta o espelho reflex.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'forma apenas a imagem utilizada para visualização da cena.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'controla a abertura do diafragma da objetiva inferior.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substitui o pentaprisma.', 0);

    -- QUESTÃO 096 (arquivo quest9)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q096', N'Assinale a alternativa incorreta.', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'As câmeras SLR utilizam espelho móvel.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'O visor direto está sujeito à ocorrência de paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'As câmeras TLR possuem duas objetivas.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'O pentaprisma é um componente típico das câmeras SLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'Todas as câmeras TLR utilizam espelho reflex móvel semelhante ao das SLR.', 1);

    -- QUESTÃO 097 (arquivo quest9)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q097', N'Uma câmera possui visor independente da objetiva principal. Essa característica permite concluir que', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o equipamento obrigatoriamente é uma SLR.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'poderá ocorrer erro de paralaxe em determinadas situações.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'existe um pentaprisma entre a objetiva e o visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'a câmera utiliza espelho móvel.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'o enquadramento será sempre idêntico ao da fotografia registrada.', 0);

    -- QUESTÃO 098 (arquivo quest9)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q098', N'Durante o disparo de uma câmera SLR, o espelho reflex', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'permanece imóvel.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'é retirado permanentemente da câmera.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'desloca-se temporariamente para permitir a passagem da luz em direção ao sensor ou filme.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'gira continuamente durante toda a exposição.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'substitui a função do obturador.', 0);

    -- QUESTÃO 099 (arquivo quest9)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q099', N'Em comparação às câmeras de visor direto, as câmeras SLR apresentam como principal vantagem', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'construção mecânica mais simples.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'menor custo de fabricação.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'eliminação da necessidade de visor.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'maior fidelidade entre a imagem observada e a imagem registrada.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'utilização obrigatória de duas objetivas.', 0);

    -- QUESTÃO 100 (arquivo quest9)
    INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano)
    VALUES (N'Inéditas Padrão VUNESP - Q100', N'Ao estudar os sistemas clássicos de câmeras fotográficas, conclui-se corretamente que', 1,
        (SELECT id FROM temas WHERE nome = N'Componentes da Câmera'), N'VUNESP', NULL);
    SET @idQuestao = SCOPE_IDENTITY();

    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'A', N'o sistema TLR utiliza duas objetivas com funções distintas, enquanto o sistema SLR utiliza uma única objetiva para visualização e registro da imagem.', 1);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'B', N'todas as câmeras utilizam espelho móvel.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'C', N'o visor direto elimina completamente a paralaxe.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'D', N'apenas as câmeras TLR possuem visor óptico.', 0);
    INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
    VALUES (@idQuestao, 'E', N'todas utilizam pentaprisma.', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO
