namespace :dev do
  desc "Configure development enviroment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") do 
        %x(rails db:drop)
      end
      # Ou, quando o bloco tem apenas uma linha...
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Criando Tabelas...") { %x(rails db:migrate) }
      show_spinner("Cadastrando tipo de mineiração...") { %x(rails dev:add_mining_types)} 
      show_spinner("Populando BD...") { %x(rails dev:add_coins)} 
    else
      puts "Você não está em um ambiente de desenvolvimento!"
    end
  end
  
  desc "Registry Coins"
  task add_coins: :environment do
    coins = [
      {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://usethebitcoin.com/wp-content/uploads/2018/07/bitcoin_PNG47.png",
        mining_type: MiningType.find_by(acronym: "PoW") #Poderia ser com .where("acronuym: 'Pow'") ou .find(id)
      },
        
      {
        description: "Ethereun",
        acronym: "ETH",
        url_image: "https://www.infomoney.com.br/Assets/Images/crypto/eth_badge.png",
        mining_type: MiningType.all.sample
      },
      {
        description: "Dash",
        acronym: "DASH",
        url_image: "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpersistencemining.com%2Fimages%2Frel-images%2FDash-logo-transparent.png&f=1",
        mining_type: MiningType.all.sample
      },
      { 
        description: "Iota",
        acronym: "IOT",
        url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png",
        mining_type: MiningType.all.sample
      },
      { 
        description: "ZCash",
        acronym: "ZEC",
        url_image: "https://www.cryptocompare.com/media/351360/zec.png",
        mining_type: MiningType.all.sample
      }
    ]
    coins.each do |coin|
      Coin.find_or_create_by!(coin)
    end
  end
  
  desc "Registry Mining Types"
  task add_mining_types: :environment do
    mining_types = [
      {description: "Proof of Work", acronym: "PoW"},
      {description: "Proof of Stake", acronym: "PoS"},
      {description: "Proof of Capacity", acronym: "PoC"},
    ]
    mining_types.each do |type|
      MiningType.find_or_create_by!(type)
    end
  end

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    # %x(rails db:seed) Será substituído por um bloco de código
    # yield representa um bloco de código 
    yield
    spinner.success("(#{msg_end})")
  end
end
