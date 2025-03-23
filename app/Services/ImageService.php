<?php

namespace App\Services;

use App\Models\Image;
use App\Models\Product;
use Illuminate\Support\Facades\Storage;


class ImageService
{
    public static function storeBatch(Product $product, array $data): void
    {


        foreach ($data['images'] as $image) {
            $product->images()->create([
                'path' => Storage::disk('public')->putFile('/images', $image),
            ]);
        }


        if (isset($data['parent_images'])) {

            $parentImages = Image::query()->whereIn('id', array_column($data['parent_images'], 'id'))->get();

           foreach ($parentImages as $parentImage) {

                $product->images()->create(['path' => $parentImage->path]);
            }
        }
    }



    public static function destroy(Image $image): void
    {
        Storage::disk('public')->delete($image->path);
        $image->delete();
    }


}
