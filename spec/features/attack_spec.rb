feature 'Attack' do
  scenario 'Player 1 attacks player 2' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'John attacked Steve'
    click_button('OK')
  end

  scenario 'Player 2 attacks player 1' do
    sign_in_and_play
    click_button('Attack')
    click_button('OK')
    click_button('Attack')
    expect(page).to have_content 'Steve attacked John'
  end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    expect(page).not_to have_content 'Steve: 80HP'
    expect(page).to have_content 'Steve: 70HP'
  end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    click_button 'Attack'
    click_button 'OK'
    expect(page).not_to have_content 'John: 80HP'
    expect(page).to have_content 'John: 70HP'
  end
end
