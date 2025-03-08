<?php

namespace Database\Seeders;

use App\Enums\Param\ParamFilterTypeEnum;
use App\Enums\Role\RoleEnum;
use App\Models\Param;
use App\Models\Role;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $user = [
            'name' => 'admin',
            'email' => 'admin@admin.com',
            'password' => Hash::make(123456789),
        ];
        $user = User::query()->firstOrCreate([
            'email' => $user['email']
        ], $user);
        $role = Role::query()->firstOrCreate([
            'title' => RoleEnum::ADMIN->value
        ]);
        $user->roles()->sync($role->id);

        $this->call([
            ParamSeeder::class,
            ProductGroupSeeder::class,
            CategorySeeder::class,
        ]);



    }
}
