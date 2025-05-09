<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Category::query()->firstOrCreate([
            'title'=>'Clothes',
            'parent_id'=>null
        ]);
        Category::query()->firstOrCreate([
            'title'=>'Mens clothing',
            'parent_id'=>1
        ]);

    }
}
