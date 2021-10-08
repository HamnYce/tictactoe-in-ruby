# frozen_string_literal: true

# Module contains data for the visual portions of the game.
module Menu
  TITLE =
    <<-TITLE
        ╔════╗─╔════╗───╔════╗
        ║╔╗╔╗║─║╔╗╔╗║───║╔╗╔╗║
        ╚╝║║╠╬═╩╣║║╠╩═╦═╩╣║║╠╩═╦══╗
        ──║║╠╣╔═╝║║║╔╗║╔═╝║║║╔╗║║═╣
        ──║║║║╚═╗║║║╔╗║╚═╗║║║╚╝║║═╣
        ──╚╝╚╩══╝╚╝╚╝╚╩══╝╚╝╚══╩══╝
    TITLE

  def print_title
    print TITLE
  end

  def print_intro_dialogue
    # puts 'decided?'
    puts 'okay, so here\'s what the board currently looks like'
    # puts "your job, #{player_one}, is to make a line of Xs"
    # puts 'sounds easy right?'
    # puts 'But your not alone!'
    # puts "#{player_two} will be blocking and trying to win as well..."
    # puts 'but with Os!'
    puts 'BEGIN!'
  end
end

