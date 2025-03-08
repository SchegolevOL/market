<?php

namespace Database\Seeders;

use App\Models\ProductGroup;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductGroupSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        ProductGroup::query()->firstOrCreate([
            'title'=>'Trousers'
        ]);
        ProductGroup::query()->firstOrCreate([
            'title'=>'Header'
        ]);
        ProductGroup::query()->firstOrCreate([
            'title'=>'Shirt'
        ]);
        ProductGroup::query()->firstOrCreate([
            'title'=>'Shoes'
        ]);
    }
}
