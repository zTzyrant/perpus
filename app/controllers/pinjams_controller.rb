class PinjamsController < ApplicationController
  before_action :set_pinjam, only: [:show, :edit, :update, :destroy]

  # GET /pinjams
  # GET /pinjams.json
  def index
    @pinjams = Pinjam.all
    @pinjams = Pinjam.select('pinjams.id, pinjams.nama, pinjams.phone, pinjams.alamat, books.judul_buku').joins(:book)
    @books = Book.joins("INNER JOIN pinjams ON pinjams.book_id = books.id")

  end

  # GET /pinjams/1
  # GET /pinjams/1.json
  def show
  end

  # GET /pinjams/new
  def new
    @pinjam = Pinjam.new
  end

  # GET /pinjams/1/edit
  def edit
  end

  # POST /pinjams
  # POST /pinjams.json
  def create
    @pinjam = Pinjam.new(pinjam_params)

    respond_to do |format|
      if @pinjam.save
        format.html { redirect_to @pinjam, notice: 'Pinjam was successfully created.' }
        format.json { render :show, status: :created, location: @pinjam }
      else
        format.html { render :new }
        format.json { render json: @pinjam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pinjams/1
  # PATCH/PUT /pinjams/1.json
  def update
    respond_to do |format|
      if @pinjam.update(pinjam_params)
        format.html { redirect_to @pinjam, notice: 'Pinjam was successfully updated.' }
        format.json { render :show, status: :ok, location: @pinjam }
      else
        format.html { render :edit }
        format.json { render json: @pinjam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pinjams/1
  # DELETE /pinjams/1.json
  def destroy
    @pinjam.destroy
    respond_to do |format|
      format.html { redirect_to pinjams_url, notice: 'Pinjam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pinjam
      @pinjam = Pinjam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pinjam_params
      params.require(:pinjam).permit(:nama, :phone, :alamat)
    end
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:judul_buku, :author, :genre_buku, :rating)
      
    end
    
end
