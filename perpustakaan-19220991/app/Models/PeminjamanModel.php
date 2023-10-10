<?php

namespace App\Models;

use CodeIgniter\Model;

class ModelPinjaman extends Model
{
    protected $table      = 'tb_peminjaman'; // Sesuaikan dengan nama tabel di database
    protected $primaryKey = 'id'; // Sesuaikan dengan primary key tabel

    // Tambahkan kolom yang diperbolehkan untuk digunakan dalam operasi CRUD
    protected $allowedFields = ['tgl_peminjaman', 'tgl_pengembalian', 'tb_pengguna_id_peminjaman', 'tb_pengguna_id_pengembalian', 'tb_anggota_id', 'tb_buku_id', 'denda'];

    // Dates
    protected $useTimestamps    = false;
    protected $dateFormat       = 'datetime';
    protected $createdField     = 'created_at';
    protected $updatedField     = 'updated_at';
    protected $deletedField     = 'deleted_at';

    // Validation
    protected $validationRules  = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks    = true;
    protected $beforeInsert      = [];
    protected $afterInsert       = [];
    protected $beforeUpdate      = [];
    protected $afterUpdate       = [];
    protected $beforeFind        = [];
    protected $afterFind         = [];
    protected $beforeDelete      = [];
    protected $afterDelete       = [];
}

