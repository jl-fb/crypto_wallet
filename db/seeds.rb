# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Use o dev:setup (lib/tasks/dev.rake)
=begin  
spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas...")
spinner.auto_spin

coins = [
    {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://usethebitcoin.com/wp-content/uploads/2018/07/bitcoin_PNG47.png"
      },
        
      {
        description: "Ethereun",
        acronym: "ETH",
        url_image: "https://www.infomoney.com.br/Assets/Images/crypto/eth_badge.png"
      },
      {
        description: "Dash",
        acronym: "DASH",
        url_image: "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpersistencemining.com%2Fimages%2Frel-images%2FDash-logo-transparent.png&f=1"
    }
]

coins.each do |coin|
    Coin.find_or_create_by!(coin)
end
spinner.success("Cadastro concluído com sucesso!")
=end

=begin
Coin.create!(
    [
        {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://usethebitcoin.com/wp-content/uploads/2018/07/bitcoin_PNG47.png"
        },
        
        {
            description: "Ethereun",
            acronym: "ETH",
            url_image: "https://www.infomoney.com.br/Assets/Images/crypto/eth_badge.png"
            
        },
        {
            description: "Dash",
            acronym: "DASH",
            url_image: "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpersistencemining.com%2Fimages%2Frel-images%2FDash-logo-transparent.png&f=1"
        }
=end
