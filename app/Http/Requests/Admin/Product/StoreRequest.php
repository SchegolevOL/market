<?php

namespace App\Http\Requests\Admin\Product;

use Illuminate\Foundation\Http\FormRequest;

class StoreRequest extends FormRequest
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
            'product.parent_id'=>'nullable|integer|exists:products,id',
            'product.qty'=>'required|integer',
            'product.product_group_id'=>'required|integer|exists:product_groups,id',
            'product.category_id'=>'required|integer|exists:categories,id',
            'images' => 'nullable|array',
            'images.*' => 'required|file',
            'params'=>'nullable|array',
            'params.*.id'=>'required|integer|exists:params,id',
            'params.*.value'=>'required|string',
            'product.article'=>'required|integer|unique:products,article',
            'parent_images'=>'nullable|array',
        ];
    }

    /**
     * @return StoreRequest|void
     * @ru: - метод добавляет возвращаемый массив, массив images, вызывается после валидации (в контроллере нужно вызывать $request->validationData())
     * @en: - the method adds an array of images to the returned array, called after validation (in the controller, you need to call the $request->validationData())
     */
    protected function passedValidation()
    {
        $validated = $this->validated();
        return $this->merge([
            'product'=>$validated['product'],
            'params'=>$validated['params']??[],
            'images'=>$this->images ?? []
        ]);
    }


}
