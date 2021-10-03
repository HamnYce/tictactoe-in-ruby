# frozen_string_literal: true

# Module contains data for the visual portions of the game. For example the
# title screen, options etc.
# However the board state can be found in board.rb.
module Menu
  # title ascii art
  TITLE =
    <<-TITLE
        ╔════╗─╔════╗───╔════╗
        ║╔╗╔╗║─║╔╗╔╗║───║╔╗╔╗║
        ╚╝║║╠╬═╩╣║║╠╩═╦═╩╣║║╠╩═╦══╗
        ──║║╠╣╔═╝║║║╔╗║╔═╝║║║╔╗║║═╣
        ──║║║║╚═╗║║║╔╗║╚═╗║║║╚╝║║═╣
        ──╚╝╚╩══╝╚╝╚╝╚╩══╝╚╝╚══╩══╝
    TITLE

  MENU =
    <<-MENU
        +-+-+ +-+-+-+-+-+ +-+-+-+-+
        |1|:| |S|t|a|r|t| |G|a|m|e|
        +-+-+ +-+-+-+-+-+-+-+-+-+-+
            |2|:| |R|u|l|e|s|
            +-++-+-+++-+-+-+-+
            |3|:| |E|x|i|t|
            +-+-+ +-+-+-+-+
    MENU

  def print_title
    print TITLE
  end

  def print_menu
    print MENU
  end

  def print_title_screen
    print_title
    print_menu
  end

  def print_intro_dialogue(player_one, player_two)
    puts 'decided?'
    puts 'okay, so heres what the board currently looks like'
    puts "your job, #{player_one}, is to make a line of Xs"
    puts 'sounds easy right?'
    puts 'But your note alone!'
    puts "#{player_two} will be blocking and trying to win aswell..."
    puts 'but with Os!'
    puts 'BEGIN!'
  end

  def print_dialogue_two; end
end

