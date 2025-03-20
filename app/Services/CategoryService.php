<?php

namespace App\Services;

use App\Models\Category;

class CategoryService
{
    public static function store(array $data):Category
    {
        return Category::create($data);
    }
    public static function update(array $data, Category $category)
    {
        $category->update($data);
        return $category->fresh();
    }

    public static function getCategoryChildren(Category $category):array
    {
        $array = [];
        $array[] = $category;
        $categoryChildren = Category::query()->where('parent_id', $category->id)->get();
        foreach ($categoryChildren as $categoryChild) {
            $array[] = array_merge($array, self::getCategoryChildren($categoryChild));
        }

        return $array;
    }
}
