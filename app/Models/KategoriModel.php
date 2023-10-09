<?php

namespace App\Models;

use CodeIgniter\Model;

class ModelKategori extends Model
{
    protected $DBGroup          = 'default';
    protected $table            = 'tb_kategori'; // Nama tabel yang sesuai
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    
    // Tambahkan kolom yang diperbolehkan untuk digunakan dalam operasi CRUD
    protected $allowedFields    = ['kategori', 'kode_ddc'];

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