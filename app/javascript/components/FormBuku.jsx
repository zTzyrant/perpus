import React, { useState } from 'react'

function FormBuku(props) {
  const [judul_buku, setBuku] = useState("")
  const [author, setAuthor] = useState("")
  const [genre_buku, setGenre] = useState("")
  const [rating, setRating] = useState("")

  const onSubmit = (e) => {
    e.preventDefault()
    const url = "/books"
    const body =  {
      judul_buku,
      author,
      genre_buku,
      rating
    }
    const token = document.querySelector('meta[name="csrf-token"]').content;
    fetch(url, {
      method: 'POST',
      headers: {
        "X-CSRF-Token": token,
        "Content-Type": "application/json"
      },
      body: JSON.stringify(body)
    })
    .then(response => {
      if(response.ok) {
        return response.json()
      }
      throw new Error('jaringan error')
    })
    .then(console.log('data berhasil disimpan'))
    .catch((error) => console.error(error))
  }
  return (
    <div className="container mt-5">
      <div className="row">
        <div className="col-sm-12 col-lg-6 offset-lg-3">
          <h1 className="font-weight-normal mb-5">
            Tambah Buku test dari React
          </h1>
          <form onSubmit={onSubmit}>
            <div className="form-group">
              <label htmlFor="tambahJudul">Judul Buku</label>
              <input
                type="text"
                name="name"
                id="tambahJudul"
                className="form-control"
                required
                onChange={e => setBuku(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="tambahPengarang">Pengarang</label>
              <input
                type="text"
                name="pengarang"
                id="tambahPengarang"
                className="form-control"
                required
                onChange={e => setAuthor(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="tambahGenre">Genre</label>
              <input
                type="text"
                name="genre"
                id="tambahGenre"
                className="form-control"
                required
                onChange={e => setGenre(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="tambahRating">Rating</label>
              <input
                type="text"
                name="pengarang"
                id="tambahRating"
                className="form-control"
                required
                onChange={e => setRating(e.target.value)}
              />
            </div>
            <button type="submit" className="btn custom-button mt-3 btn-dark">
              Submit
            </button>
          </form>
        </div>
      </div>
    </div>
  );
}

export default FormBuku