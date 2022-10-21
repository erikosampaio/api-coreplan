namespace :dev do
  desc "Configurando o ambiente"
  task setup: :environment do
    puts "Resetando o banco de dados"
    %(rails db:drop db:create db:migrate)
    puts "Banco resetado com sucesso!"

    #################################################

    puts "Cadastrando produtos..."

    # Criando Placa de vídeo
    3.times do |i|
      nomes_placa_video = [
        'Evga Geforce RTX 2060 6GB',
        'Asus ROG Strix Geforce RTX 3060 6GB',
        'Gigabyte Radeon RX 6600 XT EAGLE 8GB'
      ]
      PlacaVideo.create!(
        produto:nomes_placa_video[i]
      )
    end
    
    # Criando memoria_ram
    MemoriaRam.create!(
      produto:"Kingston Hiper X",
      tamanho:[4, 8, 16, 32, 64].sample
    )

    # Criando processador
    4.times do |i|
      nomes_processador = ['Core i5', 'Core i7', 'Ryzen 5', 'Ryzen 7']
      marcas_processador = ['Intel', 'Intel', 'AMD', 'AMD']
      Processador.create!(
        produto:nomes_processador[i],
        marca:marcas_processador[i]
      )
    end

    # Criando placa mãe
    3.times do |i|
      nomes_placa_mae = [
        'Asus ROG',
        'Gigabyte Aorus',
        'ASRock Steel Legend'
      ]
      processadores_suportados = [
        'Intel',
        'AMD',
        'Intel e AMD'
      ]
      quantidade_slots_memoria_ram = [2, 2, 4]
      total_memoria_suportada = [16, 16, 64]
      video_integrado = ["Não", "Não", 'Sim']
      PlacaMae.create!(
        produto:nomes_placa_mae[i],
        processadores_suportados:processadores_suportados[i],
        quantidade_slots_memoria:quantidade_slots_memoria_ram[i],
        total_memoria_suportada:total_memoria_suportada[i],
        video_integrado:video_integrado[i]
      )
    end

    ################################################

    puts "Produtos cadastrados com sucesso!"

    puts "Cadastrando Pedidos..."
    50.times do |i|
      # Criando pedido
      Pedido.create!(
        cliente:Faker::Name.name,
        placa_video:PlacaVideo.all.sample,
        placa_mae:PlacaMae.all.sample,
        processador:Processador.all.sample,
        # memoria_ram:MemoriaRam.all.sample
      )
    end
    puts "Pedidos cadastrados com sucesso!"
  end

end
