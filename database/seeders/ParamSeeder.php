<?php

namespace Database\Seeders;

use App\Enums\Param\ParamFilterTypeEnum;
use App\Models\Param;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ParamSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Param::query()->firstOrCreate([
            'title'=>'Size',
            'filter_type'=>ParamFilterTypeEnum::CHECKBOX
        ]);
        Param::query()->firstOrCreate([
            'title'=>'Color',
            'filter_type'=>ParamFilterTypeEnum::CHECKBOX
        ]);
        Param::query()->firstOrCreate([
            'title'=>'Height',
            'filter_type'=>ParamFilterTypeEnum::INTEGER
        ]);
        Param::query()->firstOrCreate([
            'title'=>'Material',
            'filter_type'=>ParamFilterTypeEnum::CHECKBOX
        ]);

    }
}
