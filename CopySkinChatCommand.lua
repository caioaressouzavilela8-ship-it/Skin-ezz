-- CopySkinChatCommand.lua
-- Script para capturar o comando "/skin" no chat e copiar a skin do jogador alvo.

-- Função para copiar a skin pelo apelido do jogador alvo
local function copiarSkin(apelido)
    -- Lógica fictícia para encontrar o jogador pelo apelido
    local jogadorAlvo = encontrarJogadorPeloApelido(apelido)
    if jogadorAlvo then
        -- Lógica fictícia para copiar a skin (ajustar conforme o sistema do jogo)
        aplicarSkin(jogadorAlvo.skin)
        print("Skin copiada com sucesso de " .. apelido)
    else
        print("Jogador com apelido " .. apelido .. " não encontrado.")
    end
end

-- Captura do comando no chat
local function aoReceberMensagemChat(mensagem, remetente)
    if mensagem:sub(1, 5) == "/skin" then
        local apelido = mensagem:sub(7) -- Obtém o texto após "/skin "
        if apelido and apelido ~= "" then
            copiarSkin(apelido)
        else
            print("Uso correto do comando: /skin [apelido]")
        end
    end
end

-- Inscrição no evento de mensagem do chat (ajustar para o sistema do jogo)
inscreverEventoChat(aoReceberMensagemChat)

-- Nota: Funções como "encontrarJogadorPeloApelido", "aplicarSkin" e "inscreverEventoChat"
-- devem ser substituídas pelas APIs do sistema do jogo em uso.