<?php

namespace App\Models;

use CodeIgniter\Model;

class ModelPinjaman extends Model
{
    protected $table      = 'tb_peminjaman'; // Sesuaikan dengan nama tabel di database
    protected $primaryKey = 'id'; // Sesuaikan dengan primary key tabel

    // Tambahkan kolom yang diperbolehkan untuk digunakan dalam operasi CRUD
    protected $allowedFields = ['tgl_peminjaman', 'tgl_pengembalian', 'tb_pengguna_id_peminjaman', 'tb_pengguna_id_pengembalian', 'tb_anggota_id', 'tb_buku_id', 'denda'];
protected $useTimestamps = false; // Jika Anda tidak menggunakan timestamp pada tabel

    // Tambahkan relasi ke tabel lain jika diperlukan
    protected $returnType = 'array';

    // Contoh relasi dengan tabel tb_pengguna
    protected $belongsTo = [
        'pengguna_peminjaman' => [
            'model' => 'PenggunaModel',
            'foreign_key' => 'tb_pengguna_id_peminjaman',
        ],
        'pengguna_pengembalian' => [
            'model' => 'PenggunaModel',
            'foreign_key' => 'tb_pengguna_id_pengembalian',
        ],
        'anggota' => [
            'model' => 'AnggotaModel',
            'foreign_key' => 'tb_anggota_id',
        ],
        'buku' => [
            'model' => 'BukuModel',
            'foreign_key' => 'tb_buku_id',
        ],
    ];
}