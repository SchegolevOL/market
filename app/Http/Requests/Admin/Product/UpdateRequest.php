<?php

namespace App\Http\Requests\Admin\Product;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {

        return [
            'product.title'=>'required|string|max:255',
            'product.description'=>'required',
            'product.content'=>'required',
            'product.price'=>'required|numeric',
            'product.old_price'=>'required|numeric',
            'product.qty'=>'required|integer',
            'product.product_group_id'=>'required|integer|exists:product_groups,id',
            'product.category_id'=>'required|integer|exists:categories,id',
            'images' => 'nullable|array',
            'images.*' => 'required|file',
        ];
    }
}
