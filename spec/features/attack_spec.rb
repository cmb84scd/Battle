feature 'Attack' do
  scenario 'Player 1 attacks player 2' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Success! Player 2 attacked!'
  end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).not_to have_content 'Steve: 80HP'
    expect(page).to have_content 'Steve: 70HP'
  end
end
