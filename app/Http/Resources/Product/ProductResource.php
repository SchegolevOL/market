<?php

namespace App\Http\Resources\Product;

use App\Http\Resources\Image\ImageResource;
use App\Http\Resources\Param\ParamResource;
use App\Http\Resources\Param\ParamWithPivotValueResource;
use App\Models\Image;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'description' => $this->description,
            'content' => $this->content,
            'price' => $this->price,
            'old_price' => $this->old_price,
            'qty' => $this->qty,
            'product_group_id' => $this->product_group_id,
            'category_id' => $this->category_id,
            'images'=> ImageResource::collection($this->images)->resolve(),
            'params'=>ParamWithPivotValueResource::collection($this->params)->resolve(),
            'article'=>$this->article
        ];
    }
}
