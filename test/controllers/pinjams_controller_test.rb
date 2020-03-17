require 'test_helper'

class PinjamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pinjam = pinjams(:one)
  end

  test "should get index" do
    get pinjams_url
    assert_response :success
  end

  test "should get new" do
    get new_pinjam_url
    assert_response :success
  end

  test "should create pinjam" do
    assert_difference('Pinjam.count') do
      post pinjams_url, params: { pinjam: { alamat: @pinjam.alamat, book_id: @pinjam.book_id, nama: @pinjam.nama, phone: @pinjam.phone } }
    end

    assert_redirected_to pinjam_url(Pinjam.last)
  end

  test "should show pinjam" do
    get pinjam_url(@pinjam)
    assert_response :success
  end

  test "should get edit" do
    get edit_pinjam_url(@pinjam)
    assert_response :success
  end

  test "should update pinjam" do
    patch pinjam_url(@pinjam), params: { pinjam: { alamat: @pinjam.alamat, book_id: @pinjam.book_id, nama: @pinjam.nama, phone: @pinjam.phone } }
    assert_redirected_to pinjam_url(@pinjam)
  end

  test "should destroy pinjam" do
    assert_difference('Pinjam.count', -1) do
      delete pinjam_url(@pinjam)
    end

    assert_redirected_to pinjams_url
  end
end
