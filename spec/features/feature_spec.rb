require 'rails_helper'

describe 'Main page tests' do
  before(:each) do
    card = create(:card).update_attribute(:review_date, Time.now - 10.days)
    visit root_path
  end

  it 'load title' do
    expect(title).to have_content 'Флэшкарточкер'
  end

  it 'load page content' do
    expect(page).to have_content 'Первый в мире удобный менеджер флеш-карточек. Именно так.'
  end

  it 'load check_form' do
    expect(page).to have_content 'Слово на немецком:'
  end

  it 'not load page without check_form' do
    expect(page).not_to have_content 'Вы выучили все доступные карточки. Приходите позже!'
  end

  it 'entered incorrect translation' do
    fill_in 'answer', with: 'village'
    click_button 'Проверить'
    expect(page).to have_content 'Incorrect'
  end

  it 'entered correct translation' do
    fill_in 'answer', with: 'city'
    click_button 'Проверить'
    expect(page).not_to have_content 'Incorrect'
  end
end

