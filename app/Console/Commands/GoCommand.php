<?php

namespace App\Console\Commands;

use App\Enums\Param\ParamFilterTypeEnum;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Console\Command;

class GoCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'go';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $arr[] =['id'=>1,
            [
                'id'=>2,
                [
                    'id'=>3,
                ]
            ],
            [
                'id'=>4,
            ]

        ];

        dd(Product::getArrayById('id', $arr));
    }
}
