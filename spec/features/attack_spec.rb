feature 'Attack' do
  scenario 'Player 1 attacks player 2' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'John attacked Steve'
    click_button('OK')
  end

  scenario 'Player 2 attacks player 1' do
    sign_in_and_play
    attack_and_confirm
    click_button('Attack')
    expect(page).to have_content 'Steve attacked John'
  end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    attack_and_confirm
    expect(page).not_to have_content 'Steve: 80HP'
    expect(page).to have_content 'Steve: 70HP'
  end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    attack_and_confirm
    attack_and_confirm
    expect(page).not_to have_content 'John: 80HP'
    expect(page).to have_content 'John: 70HP'
  end

  context 'when dealing random damage' do
    scenario 'reduce player 2 HP by random amount' do
      sign_in_and_play
      attack_and_confirm
      expect(page).not_to have_content 'Steve: 80HP'
    end

    scenario 'reduce player 1 HP by random amount' do
      sign_in_and_play
      attack_and_confirm
      attack_and_confirm
      expect(page).not_to have_content 'John: 80HP'
    end
  end
end
