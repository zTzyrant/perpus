require "application_system_test_case"

class PinjamsTest < ApplicationSystemTestCase
  setup do
    @pinjam = pinjams(:one)
  end

  test "visiting the index" do
    visit pinjams_url
    assert_selector "h1", text: "Pinjams"
  end

  test "creating a Pinjam" do
    visit pinjams_url
    click_on "New Pinjam"

    fill_in "Alamat", with: @pinjam.alamat
    fill_in "Book", with: @pinjam.book_id
    fill_in "Nama", with: @pinjam.nama
    fill_in "Phone", with: @pinjam.phone
    click_on "Create Pinjam"

    assert_text "Pinjam was successfully created"
    click_on "Back"
  end

  test "updating a Pinjam" do
    visit pinjams_url
    click_on "Edit", match: :first

    fill_in "Alamat", with: @pinjam.alamat
    fill_in "Book", with: @pinjam.book_id
    fill_in "Nama", with: @pinjam.nama
    fill_in "Phone", with: @pinjam.phone
    click_on "Update Pinjam"

    assert_text "Pinjam was successfully updated"
    click_on "Back"
  end

  test "destroying a Pinjam" do
    visit pinjams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pinjam was successfully destroyed"
  end
end
